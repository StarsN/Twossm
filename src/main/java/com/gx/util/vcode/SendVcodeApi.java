package com.gx.util.vcode;

import cn.com.do1.dqdp.core.ConfigMgr;
import com.gx.util.HttpClientUtil;
import com.gx.util.IpUtil;
import com.gx.util.MD5Utils;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;

public class SendVcodeApi {
    public static void sendVcode2(HttpServletRequest request,String vCode,String phoneNumber,String merchantId){
        HashMap<String , String> hashMap = new HashMap<String, String>();
        String timestamp = String.valueOf(System.currentTimeMillis()/1000);
//        HttpServletRequest request = ServletActionContext.getRequest();
        String ip = IpUtil.getIp(request);

//        System.out.print("ip=" + ip);
        String sign = MD5Utils.getMD5Str("sjsc||"+timestamp+"||SJSC123");
        String content = "请输入验证码："+ vCode+",完成手机校验,3分钟内有效,如非个人操作请忽略。";
        hashMap.put("mobile", phoneNumber);
        hashMap.put("content",content);
        hashMap.put("timestamp",timestamp);
        hashMap.put("sign",sign);
        hashMap.put("account","sjsc");
//        String ecssDomain=new String(ConfigMgr.get("dqdpDomain", "ecssDomain","121.43.77.241"));
        String ecssDomain = "112.124.111.36";
        String result = HttpClientUtil.doPost("http://"+ecssDomain+"/ecss/sms/api", "utf-8", null,hashMap);
        //返回的是xml的字符串，包括：<code>、<message>
        System.out.println(result);
        //发送成功：<code>1</code>-- 0为提交失败 1,null为提交成功
        //因为网络原因，返回报文为null也发送成功，只有返回为0发送失败
//        if(result == null || result.length() <= 0){
//            //新增到短信日志
//            addSmsLog(content,vCode,1L,merchantId);
//            //查redis，该ip下一个小时发送的次数有没有超过10次
//            if(rcs.exist("send_"+ip)){
//                //存在错误次数
//                int  sendNum = (Integer) rcs.get("send_"+ip);
//                //60分钟
//                rcs.put("send_"+ip, sendNum+1, 60*60);
//            }else{
//                //60分钟
//                rcs.put("send_"+ip, 1, 60*60);
//            }
//            setActionResult("1001","验证码发送成功！");
//        }else if(result.contains("<code>0</code>")){
//            //新增到短信日志
//            addSmsLog(content,vCode,0L,merchantId);
//            setActionResult("1000","验证码发送失败！");
//        }else{
//            //新增到短信日志
//            addSmsLog(content,vCode,1L,merchantId);
//            //查redis，该ip下一个小时发送的次数有没有超过10次
//            if(rcs.exist("send_"+ip)){
//                //存在错误次数
//                int  sendNum = (Integer) rcs.get("send_"+ip);
//                //60分钟
//                rcs.put("send_"+ip, sendNum+1, 60*60);
//            }else{
//                rcs.put("send_"+ip, 1, 60*60);
//            }
//            setActionResult("1001","验证码发送成功！");
//        }
    }
}
