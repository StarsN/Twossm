package com.gx.intelligentlink.service.Impl;

import cn.com.do1.common.exception.BaseException;
import cn.com.do1.common.exception.DataConfictException;
import cn.com.do1.common.util.AssertUtil;
import cn.com.do1.common.util.string.StringUtil;
import cn.com.do1.dqdp.core.ConfigMgr;
import com.google.gson.Gson;
import com.gx.intelligentlink.service.IntelligentLinkService;
import com.gx.member.domain.TbMemberPO;
import com.gx.member.service.MemberService;
import org.apache.struts2.ServletActionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * @author admin
 */
@Service("intelligentLink")
public class IntelligentLinkServiceImpl implements IntelligentLinkService {

    private final static transient Logger logger = LoggerFactory.getLogger(IntelligentLinkServiceImpl.class);
    @Autowired
    private MemberService memberService;

    @Autowired
    private RedisTemplate redisTemplate;

    @Autowired
    private HttpSession session;
    /**
     * 验证码登录
     * @param mobile
     * @param type
     * @return
     */
    @Override
    public Map<String, Object> login(String ip, String mobile, String type) throws Exception, BaseException {
        //--------防止请求频繁---------
//        String ip = IpUtil.getIp(ServletActionContext.getRequest());
        int loginRequestNum = 0;
//        //查redis，该ip下   一分钟登录请求的次数有没有超过20次
//        if (rcs.exist("loginRequest_" + ip)) {
//            //存在发送次数
//            loginRequestNum = (Integer) rcs.get("loginRequest_" + ip);
//            if (loginRequestNum >= 20) {
//                // setActionResult("1101", "登录请求频繁，请稍后登录");
//                map.put("code", "1101");
//                map.put("msg", "登录请求频繁，请稍后登录");
//                return map;
//            }
//        }
        //判断手机号是否存在,取解密后生成的手机号
        TbMemberPO PO = memberService.checkphoneNumber(mobile);
        Map<String,Object> map = new HashMap<>();
        //查redis，该ip下   一分钟登录请求的次数有没有超过60次
//        if (redisTemplate.hasKey("loginRequest_" + ip)) {
//            //存在错误次数
//            loginRequestNum = (Integer) redisTemplate.opsForValue().get("loginRequest_" + ip);
//            redisTemplate.opsForValue().set("loginRequest_" + ip, loginRequestNum + 1, 60);//60分钟
//        } else {
//            redisTemplate.opsForValue().set("loginRequest_" + ip, 1, 60);//60分钟
//        }
        if (PO == null) {
            //新用户，生成用户信息,以便后面查找到用户
            TbMemberPO tbMemberPO = makeMember(mobile, "", type);
        }
        TbMemberPO PO1 = memberService.checkphoneNumber(mobile);
        if (PO1 != null) {
            if(StringUtil.isNullEmpty( PO1.getLoginCount())){
                PO1.setLoginCount("1");
            }else{
                PO1.setLoginCount(  (Integer.parseInt((PO1.getLoginCount() ))+1)+"" );//登录数加一
            }
            PO1.setLastTime(new Date());//最后登录时间
            memberService.updatePO(PO1);//更新用户信息
            logger.info("更新后的用户信息=" + PO1);
            map.put("code", "0");
            map.put("msg", "登录成功！进入商城！");
        }else{
            map.put("code", "-1");
            map.put("msg", "对不起，系统出错，请稍后再试。");
        }
        //将会员信息放进session
        session.setAttribute("tbMemberPO",PO1);
        return map;
    }

    @Override
    public TbMemberPO makeMember(String mobileNumber, String nickName, String channelName) throws Exception, BaseException {
        TbMemberPO tbMemberPO = new TbMemberPO();
        Date date = new Date();
        String memberId = UUID.randomUUID().toString();
        tbMemberPO.setMemberId(memberId);
        tbMemberPO.setLoginCount("1");
        tbMemberPO.setNickName(nickName);
        tbMemberPO.setPhoneNumber(mobileNumber);
        tbMemberPO.setMemberStatus("1");
        tbMemberPO.setRegisterTime(date);
        tbMemberPO.setLastTime(date);//最后登录时间
        //todo
        memberService.insertPO(tbMemberPO);//插入用户信息
        logger.info("生成新用户信息=" + tbMemberPO);
        return tbMemberPO;
    }
}
