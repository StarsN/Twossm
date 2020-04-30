package com.gx.intelligentlink.controller;

import cn.com.do1.common.exception.BaseException;
import cn.com.do1.common.util.AssertUtil;
import cn.com.do1.dqdp.core.ConfigMgr;
import com.google.gson.Gson;
import com.gx.intelligentlink.service.IntelligentLinkService;
import com.gx.member.domain.TbMemberPO;
import com.gx.util.HttpClientUtil;
import com.gx.util.IpUtil;
import com.gx.util.MD5Utils;
import com.gx.util.vcode.GetVcode;
import org.apache.struts2.ServletActionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.time.Duration;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import static com.gx.util.vcode.SendVcodeApi.sendVcode2;

/**
 * @author admin
 */
@Controller
@RequestMapping("/intelligentLink")
public class IntelligentLinkController {
    private final static transient Logger logger = LoggerFactory.getLogger(IntelligentLinkController.class);
    @Autowired
    private RedisTemplate redisTemplate;
    @Autowired
    private IntelligentLinkService intelligentLinkService;

    @ResponseBody
    @RequestMapping(value = "/sendVcode" , produces = "text/plain;charset=utf-8")
    public String sendVcode(HttpServletRequest request, HttpServletResponse response){
        //String phoneNumber = ServletActionContext.getRequest().getParameter("mobile");//获取用户手机号码
//        TbMerchantPO marchantpo = (TbMerchantPO) ServletActionContext.getRequest().getSession().getAttribute("tbMerchantPO");
//        String merchantId = marchantpo.getMerchantId();
        String ip = IpUtil.getIp(request);
        Map<String,Object> map = new HashMap<>();
        Gson gson = new Gson();
//        防止频繁发送短信
//        if(redisTemplate.hasKey("send_"+ip)){//查redis，该ip下一个小时发送的次数有没有超过10次
//            //存在发送次数
//            int  sendNum = (Integer) redisTemplate.opsForValue().get("send_"+ip);
//            if(sendNum>=10){
//                map.put("code","1101");
//                map.put("desc","发送操作频繁，请稍后重新发送");
//                String jsonMap = gson.toJson(map);
//                return jsonMap;
//            }
//        }
        String mobile = request.getParameter("mobile");
        logger.info("获取的手机号=" + mobile);
//        String mobile = "15768237218";
        String vCode = "";
        //查redis，是否存在该手机号码，有则直接读取验证码，没有则随机生成6位数字。
        if(redisTemplate.hasKey(mobile)){
            vCode =  (String) redisTemplate.opsForValue().get(mobile);
            //3分钟
            logger.info("发送验证码时在redis里取到的vCode=" + vCode);
            redisTemplate.opsForValue().set(mobile,vCode,60*3, TimeUnit.SECONDS);
        }else {
            //0-9的6位随机数
            vCode = GetVcode.getVcode();
            //3分钟
            logger.info("发送验证码时重新生成的vCode="+vCode);
            redisTemplate.opsForValue().set(mobile, vCode, 60*3,TimeUnit.SECONDS);
        }
//        sendVcode2(request,vCode,mobile,"001");
        //调用接口
        HashMap<String , String> hashMap = new HashMap<String, String>();
        String timestamp = String.valueOf(System.currentTimeMillis()/1000);
//        String ip = IpUtil.getIp(request);
        String sign = MD5Utils.getMD5Str("sjsc||"+timestamp+"||SJSC123");
        String content = "请输入验证码："+ vCode+",完成手机校验,3分钟内有效,如非个人操作请忽略。";
        hashMap.put("mobile", mobile);
        hashMap.put("content",content);
        hashMap.put("timestamp",timestamp);
        hashMap.put("sign",sign);
        hashMap.put("account","sjsc");
//        String ecssDomain=new String(ConfigMgr.get("dqdpDomain", "ecssDomain","121.43.77.241"));
        String ecssDomain = "112.124.111.36";
        logger.info("content=" + content);
        String result = HttpClientUtil.doPost("http://"+ecssDomain+"/ecss/sms/api", "utf-8", null,hashMap);
        //返回的是xml的字符串，包括：<code>、<message>
        System.out.println(result);
        //发送成功：<code>1</code>-- 0为提交失败 1,null为提交成功
        //因为网络原因，返回报文为null也发送成功，只有返回为0发送失败
        if(result == null || result.length() <= 0){
//            //新增到短信日志
//            addSmsLog(content,vCode,1L,merchantId);
            //查redis，该ip下一个小时发送的次数有没有超过10次
            if(redisTemplate.hasKey("send_"+ip)){
                //存在发送次数
                int  sendNum = Integer.parseInt(redisTemplate.opsForValue().get("send_"+ip).toString());
                sendNum++;
                String sendNumStr = String.valueOf(sendNum);
                //60分钟
                redisTemplate.opsForValue().set("send_"+ip, sendNumStr, 60*60,TimeUnit.SECONDS);
            }else{
                //60分钟
                redisTemplate.opsForValue().set("send_"+ip, "1", 60*60,TimeUnit.SECONDS);
            }
            map.put("code","1001");
            map.put("desc","验证码发送成功！");
        }else if(result.contains("<code>0</code>")){
            //新增到短信日志
//            addSmsLog(content,vCode,0L,merchantId);
            map.put("code","1000");
            map.put("desc","验证码发送失败！");
        }else{
            //新增到短信日志
//            addSmsLog(content,vCode,1L,merchantId);
            //查redis，该ip下一个小时发送的次数有没有超过10次
            if(redisTemplate.hasKey("send_"+ip)){
                //存在发送次数
                int  sendNum = Integer.parseInt(redisTemplate.opsForValue().get("send_"+ip).toString());
                sendNum++;
                String sendNumStr = String .valueOf(sendNum);
                //60分钟
                redisTemplate.opsForValue().set("send_"+ip, sendNumStr, 60*60,TimeUnit.SECONDS);
            }else{
                //60分钟
                redisTemplate.opsForValue().set("send_"+ip, "1", 60*60,TimeUnit.SECONDS);
            }
            map.put("code","1001");
            map.put("desc","验证码发送成功！");
        }
        String jsonMap = gson.toJson(map);
        return jsonMap;
    }

    //验证码登录
    @ResponseBody
    @RequestMapping(value = "/sms_login",produces = "text/plain;charset=utf-8")
    public String sms_login(HttpServletRequest request,HttpServletResponse response) throws Exception, BaseException {
        //用户手动输入的验证码
//        String verificationCode = ServletActionContext.getRequest().getParameter("smsCode");
        logger.info("正在进行验证码登录");
        String verificationCode = request.getParameter("smsCode");
        String mobile = request.getParameter("mobile");
        String ip = IpUtil.getIp(request);
        Map<String,Object> result = new HashMap<>();
        Gson gson = new Gson();
        //禁止用户重新校验验证码的时间
        String retryCodeTime = "15";
        //判断该手机号的验证码错误次数
        //查redis，该手机号1分钟内有没有发送过短信
//        if(rcs.exist("errorNum_"+mobile)){
//            //存在错误次数
//            int  errorNum = (Integer) rcs.get("errorNum_"+mobile);
//            if(errorNum>=5){
//                setActionResult("1101","验证码错误次数累计5次，请"+retryCodeTime+"分钟后重新尝试");
//                return;
//            }
//        }
        logger.info("phoneNumber=" + mobile);
        logger.info("smsCode=" + verificationCode);
        logger.info("是否" + redisTemplate.hasKey(mobile));
        if(redisTemplate.hasKey(mobile)){
            String vCode= (String) redisTemplate.opsForValue().get(mobile);
            logger.info("登录时从缓存中读取的验证码为：" + vCode);
            logger.info("登录时从会员输入的验证码为：" + verificationCode);
            if(verificationCode.equals(vCode)){
                //验证码正确
                logger.info("验证码正确");
                String type = "sms";
                Map map = intelligentLinkService.login(ip,mobile,type);
                result.put("code",map.get("code").toString());
                result.put("msg",map.get("msg").toString());
            }else{
                //判断该手机号的验证码错误次数
                int  errorNum = 0;
                if(redisTemplate.hasKey("errorNum_"+mobile)){
                    //存在错误次数
                    errorNum = Integer.parseInt(redisTemplate.opsForValue().get("errorNum_"+mobile).toString());
                    errorNum++;
                    String errorNumStr = String.valueOf(errorNum);
                    //15分钟
                    redisTemplate.opsForValue().set("errorNum_"+mobile, errorNumStr, 60*Integer.valueOf(retryCodeTime),TimeUnit.SECONDS);
                }else{
                    //不存在错误次数
                    errorNum = 1;
                    String errorNumStr = String.valueOf(errorNum);
                    //15分钟
                    redisTemplate.opsForValue().set("errorNum_"+mobile, errorNumStr, 60*Integer.valueOf(retryCodeTime),TimeUnit.SECONDS);
                }
                logger.info("输入验证码错误次数为=" + errorNum);
                if(errorNum>0&&errorNum<3){
                    result.put("code","1");
                    result.put("desc","验证码错误，请重新输入");
                }else if(errorNum==3){
                    result.put("code","1");
                    result.put("desc","验证码错误次数累计3次，您还有2次机会");
                }else if(errorNum==4){
                    result.put("code","1");
                    result.put("desc","验证码错误次数累计4次，您还有1次机会");
                }else if(errorNum>=5){
                    result.put("code","1");
                    result.put("desc","对不起，验证码错误次数累计5次，请"+retryCodeTime+"分钟后重新尝试");
                }
            }
        }else{
            result.put("code","105");
            result.put("desc","验证码错误，请发送验证码");
        }
//        request.getSession().setAttribute("tbMemberPO",tbMemberPO);
        String jsonMap = gson.toJson(result);
        return jsonMap;
    }

}
