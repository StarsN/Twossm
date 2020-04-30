package com.gx.member.controller;

import cn.com.do1.common.exception.DataConfictException;
import cn.com.do1.common.util.AssertUtil;
import cn.com.do1.common.util.string.StringUtil;
import cn.com.do1.component.dqdpmemcache.cachecore.CacheUtil;
import cn.com.do1.dqdp.core.ConfigMgr;
import com.google.gson.Gson;
import com.gx.member.domain.TbMemberPO;
import com.gx.member.service.MemberService;
import com.gx.merchant.domain.TbMerchantPO;
import com.gx.merchant.service.MerchantService;
import com.gx.util.HttpClientUtil;
import com.gx.util.IpUtil;
import com.gx.util.MD5Utils;
import com.gx.util.vcode.GetVcode;
import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.concurrent.TimeUnit;


@Controller
@RequestMapping("/member")
public class MemberController {
    private final static transient Logger logger = LoggerFactory.getLogger(MemberController.class);
    @Autowired
    private MemberService memberService;
    @Autowired
    private MerchantService merchantService;
    @Autowired
    private RedisTemplate redisTemplate;

    //==========================前端
    /**
     * 跳转个人中心页面
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/returnPersonCenterPage")
    public String returnPersonCenterPage(HttpServletRequest request,HttpServletResponse response){
        logger.info("===正在跳转到前端个人中心===");
        HttpSession session = request.getSession();
        TbMemberPO tbMemberPO = (TbMemberPO) session.getAttribute("tbMemberPO");
        logger.info("session中的tbMemberPO=" + tbMemberPO);
        return "portal/personalCenter/list";
    }

    /**
     * 跳转强制修改密码页面
     * @return
     */
    @RequestMapping("/returnChangePwdPage")
    public String returnChangePwdPage(){
        return "portal/login/accountChangePwd";
    }

    @RequestMapping("/returnAccountMgrPage")
    public String returnAccountMgrPage(){
        return "portal/accountMgr/accountMgr";
    }


    //==================================后端
    /**
     *
     * @return
     */
    @RequestMapping("/returnListPage")
    public String returnListPage(){
        return "member/list";
    }

    /**
     * 密码登录
     * @param request
     * @param response
     * @return
     * @throws ParseException
     */
    @ResponseBody
    @RequestMapping(value = "/login",produces = "text/plain;charset=utf-8")
    public String login(HttpServletRequest request, HttpServletResponse response) throws ParseException {
        //todo 这是在会员输入地址的时候就该做的事，现在先假设会员登录时做了，假设只有一个商家
        List<TbMerchantPO> tbMerchantPOS = merchantService.getAllMerchantInfo();
        TbMerchantPO tbMerchantPO = tbMerchantPOS.get(0);
        request.getSession().setAttribute("tbMerchantPO",tbMerchantPO);
        logger.info("会员登录，已将商家信息放进session" + request.getSession().getAttribute("tbMerchantPO"));
//        -------------------------------------------------------------------
        logger.info("来了");
        String phoneNumber = request.getParameter("phoneNumber");
        //前端已MD5加密，2018-6-4 15:41:17
        String password = request.getParameter("password");
        //判断是否为空，防止非法请求，2018-07-11，xiejianbin
        if (AssertUtil.isEmpty(phoneNumber) || AssertUtil.isEmpty(password)) {

        }
        //--------2.防止请求频繁---------
        //1.--------------校验验证码--------------
        //判断手机号是否存在
        TbMemberPO PO = memberService.checkphoneNumber(phoneNumber);
        //查redis，该ip下   一分钟登录请求的次数有没有超过60次
//		if(loginRequestNum>=5){
//		}
        if (PO == null) {
//            setActionResult("101", "该手机号不存在，可点击左下角进行注册!");
        }
        TbMemberPO tbMemberPO = memberService.login(phoneNumber, password);
        logger.info("正在登录的会员=" + tbMemberPO);
//        if (tbMemberPO != null) {
//            if ("1".equals(tbMemberPO.getChangePwd())) {
//                //修改过密码
//            } else {
//                //没修改过，还需判断是否在16日前
//                SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//                Date date1 = df.parse("2018-07-16 00:00:00");
//                if (System.currentTimeMillis() >= date1.getTime()) {
//                    //在2018-07-16 00:00:00后，跳去忘记密码
//                    addJsonObj("toUrl", "/jsp/component/portal/JSP/login/forget.jsp?phoneNumber=" + tbMemberPO.getPhoneNumber());
//                    setActionResult("2", "将跳转到忘记密码页面");
//                } else {
//                    //在2018-07-16 00:00:00前，跳去密码修改
//                    addJsonObj("toUrl", "/jsp/component/portal/JSP/login/account_changePwd.jsp");
//                    ServletActionContext.getRequest().getSession().setAttribute("wantToChangePwd", tbMemberPO.getMemberId());
//                    setActionResult("3", "将跳转到密码修改页面");
//                }
//
//            }
//        }

        //判断该密码错误次数


        //向前端反馈
        //0:成功 2:修改密码再使用 1:密码错误
        Map<String,Object> map = new HashMap<>();
        Gson gson = new Gson();
        if (tbMemberPO != null) {
            //账号密码正确
            if ("1".equals(tbMemberPO.getChangePwd())) {
                //有修改过密码，登录
                if (StringUtil.isNullEmpty(tbMemberPO.getLoginCount())) {
                    tbMemberPO.setLoginCount("1");
                } else {
                    tbMemberPO.setLoginCount((Integer.parseInt((tbMemberPO.getLoginCount())) + 1) + "");//登录数加一
                }
                tbMemberPO.setLastTime(new Date());//最后登录时间
                memberService.updatePO(tbMemberPO);//更新用户信息

                //如果是新的粉丝，需要创建fans记录

                //删除redis密码错误次数
//                if (rcs.exist("longinEorroNum_" + phoneNumber)) {
//                    rcs.remove("longinEorroNum_" + phoneNumber);
//                }

                //防止会话中存 渠道内容丢失
//                String channelCode = (String)ServletActionContext.getRequest().getSession().getAttribute("channelCode");
//                logger.info("channelCode="+channelCode);
//                String oriSessionId = ServletActionContext.getRequest().getSession().getId();
//                String currentAloneWeiPageId = (String) rcs.get("ALONEWEIPAGE_" + oriSessionId);
//                rcs.remove("ALONEWEIPAGE_" + oriSessionId);//删掉登录前的redis情况
//                ServletActionContext.getRequest().getSession().invalidate();
//                ServletActionContext.getRequest().getSession().setAttribute("tbMemberPO", tbMemberPO);

                /**
                 * 初始化用户外部优惠券
                 */
//                setActionResult("0", "登录成功！进入商城！");
                map.put("code","0");
                map.put("msg","登录成功！进入商城！");
            } else {
                //ServletActionContext.getRequest().getSession().invalidate();
                //没修改过，需要提醒要修改
//                setActionResult("2", "请修改密码继续使用！");
                map.put("code","2");
                map.put("msg","请修改密码继续使用！");
            }
        } else {
            //密码错误
//            int errorNum = 0;
//            if (rcs.exist("longinEorroNum_" + phoneNumber)) {
//                //存在错误次数
//                errorNum = (Integer) rcs.get("longinEorroNum_" + phoneNumber);
//                errorNum++;
//                rcs.put("longinEorroNum_" + phoneNumber, errorNum, 60 * Integer.valueOf(retryPasswordTime));//15分钟
//            } else {
//                errorNum = 1;
//                rcs.put("longinEorroNum_" + phoneNumber, 1, 60 * Integer.valueOf(retryPasswordTime));//15分钟
//            }
//            if (errorNum > 0 && errorNum < 3) {
//                setActionResult("1", "密码错误，请重新输入");
//            } else if (errorNum == 3) {
//                setActionResult("1", "密码错误次数累计3次，您还有2次机会");
//            } else if (errorNum == 4) {
//                setActionResult("1", "密码错误次数累计4次，您还有1次机会");
//            } else if (errorNum >= 5) {
//                setActionResult("1", "对不起，密码错误次数累计5次，请" + retryPasswordTime + "分钟后重新尝试");
//            }
//            setActionResult("1", "密码错误，请重新输入");
            map.put("code","1");
            map.put("msg","密码错误，请重新输入");
        }
        //将会员信息放进session
        request.getSession().setAttribute("tbMemberPO",tbMemberPO);
        String jsonMap = gson.toJson(map);
        return jsonMap;
    }


    /**
     * 修改密码
     * @param request
     * @param response
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/updateAccount",produces = "text/plain;charset=utf-8")
    public String updateAccount(HttpServletRequest request,HttpServletResponse response){
        //获取密码
        String password = request.getParameter("password");
        String originPassword = request.getParameter("originPassword");
        HttpSession session = request.getSession();
        //从session获取会员
        TbMemberPO sessionMemberPO = (TbMemberPO) session.getAttribute("tbMemberPO");
        Map<String,Object> map = new HashMap<>();
        Gson gson = new Gson();
        //原始密码不为空
        if (!StringUtils.isBlank(originPassword)) {
//            Long wantToChangePwd = (Long) session.getAttribute("wantToChangePwd");
//            TbMemberPO sessionMemberPO = (TbMemberPO) session.getAttribute("tbMemberPO");
//            if (wantToChangePwd != null) {
//                //TbMemberPO  sessionMemberPO = (TbMemberPO) session.getAttribute("tbMemberPO");
//                this.tbMemberPO.setMemberId(wantToChangePwd);
//            } else if (sessionMemberPO != null) {
//                this.tbMemberPO.setMemberId(sessionMemberPO.getMemberId());
//            } else if (wantToChangePwd == null && sessionMemberPO == null) {
//                setActionResult("3", "不存在用户信息，请重新操作");
//                return;
//            }
            //原密码不为空
            TbMemberPO memberPO = memberService.getMemberById(sessionMemberPO.getMemberId() + "");
            if (!StringUtils.equals(originPassword, memberPO.getPassword())) {
                //密码不正确
//                setActionResult("2", "原密码有误");
                map.put("code","2");
                map.put("desc","原密码有误！");
                String jsonMap = gson.toJson(map);
                return jsonMap;
            }
            //注册默认已经修改过密码，2018-7-12 22:31:40，@choy
            sessionMemberPO.setChangePwd("1");
            sessionMemberPO.setChangeTime(new Date());
        } else if ("".equals(originPassword)) {
            //原密码为空
//            setActionResult("1", "失败，原密码为空！");
            map.put("code","1");
            map.put("desc","失败，原密码为空！");
            String jsonMap = gson.toJson(map);
            return jsonMap;
        }
        if (!StringUtils.isBlank(password)) {
//			this.tbMemberPO.setPassword(MD5Utils.getMD5Str(password));
//            if (memberService.checkWeakPassword(password, 2)) {
//                setActionResult("4", "失败，新密码为弱密码，请重新填写！");
//                return;
//            }
            sessionMemberPO.setPassword(password);//前端已MD5加密，@Choy，2018-6-4 15:40:31
        }
        String nickName = request.getParameter("nickName");
        sessionMemberPO.setNickName(nickName);
        //更新数据库
        this.memberService.updatePO(sessionMemberPO);
        session.setAttribute("tbMemberPO", sessionMemberPO);//更新session里面会员信息
        map.put("code","0");
        map.put("desc","修改成功");
        String jsonMap = gson.toJson(map);
        return jsonMap;
    }


    /**
     *
     * @param request
     * @param response
     * @return
     * @throws UnsupportedEncodingException
     */
    @ResponseBody
    @RequestMapping(value = "/getAllMemberInfo",produces = "text/plain;charset=utf-8")
    public String getAllMemberInfo(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        logger.info("会员管理control层......正在查询全部会员......");
        Integer page = Integer.valueOf(request.getParameter("page"));
        Integer rows = Integer.valueOf(request.getParameter("rows"));
        logger.info("page=" + page);
        logger.info("rows=" + rows);
        List<TbMemberPO> totalMemberInfoPOS = memberService.getAllMemberInfo();
        //获取分页数据
        List<TbMemberPO> memberInfoPOS = memberService.getPageMemberInfo((page - 1) * rows,rows);
        logger.info("memberInfoPOS=" + memberInfoPOS);
        Map<String, Object> map = new HashMap<String, Object>();
        Gson gson = new Gson();
        int total = totalMemberInfoPOS.size();
        map.put("total", total);
        map.put("rows", memberInfoPOS);
        String jsonMap = gson.toJson(map);
        logger.info("jsonMap=" + jsonMap);
        return jsonMap;
    }

    @ResponseBody
    @RequestMapping(value = "/sendVcode" , produces = "text/plain;charset=utf-8")
    public String sendVcode(HttpServletRequest request, HttpServletResponse response){
        //String phoneNumber = ServletActionContext.getRequest().getParameter("mobile");//获取用户手机号码
//        TbMerchantPO marchantpo = (TbMerchantPO) ServletActionContext.getRequest().getSession().getAttribute("tbMerchantPO");
//        String merchantId = marchantpo.getMerchantId();
        //获取到前端输入手机号
        String phoneNumber = request.getParameter("phoneNumber");
        //获取到前端输入的图形验证码
        String sCode = request.getParameter("sCode");
        //获取到session的图形验证码
        String code = (String) request.getSession().getAttribute("sRand");
        logger.info("找回密码中session中的图形验证码=" + code);
        String sendType = request.getParameter("sendType");//发送信息类型,1-会员注册，2-会员忘记密码，3-绑定手机号
        logger.info("发送信息类型=" + sendType);
        //图形验证码检验
        if (AssertUtil.isEmpty(sCode)) {
            logger.info("图形验证码不能为空");
        }

        if (AssertUtil.isEmpty(code)) {
            logger.info("图形验证码过期");
        }

        if (sCode != null && code != null && code.toLowerCase().equals(sCode.toLowerCase())) {//不区分大小写
            //正确
            request.getSession().removeAttribute("sRand");
        } else {
            //错误
            logger.info("图形验证码错误");
        }
        //---------2.手机号是否存在校验-----------
        //判断手机号是否存在
        TbMemberPO PO = memberService.checkphoneNumber(phoneNumber);
        if (!AssertUtil.isEmpty(sendType) && sendType.equals("1")) {
            //会员注册
            if (!AssertUtil.isEmpty(PO)) {
                logger.info("账号存在，请重新输入手机号");
            }
        }
        if (!AssertUtil.isEmpty(sendType) && sendType.equals("2")) {
            //找回密码
            if (AssertUtil.isEmpty(PO)) {
                logger.info("账号不存在，请重新输入手机号");
            }
        }
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
        String mobile = phoneNumber;
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
}
