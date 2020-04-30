package com.gx.intelligentlink.service;

import cn.com.do1.common.exception.BaseException;
import com.gx.member.domain.TbMemberPO;

import java.util.Map;

/**
 * @author admin
 */
public interface IntelligentLinkService {
    /**
     * 验证码登录
     * @param mobile
     * @param type
     * @return
     */
    Map login(String ip,String mobile, String type) throws Exception, BaseException;

    /**
     * 生成会员
     * @param mobileNumber
     * @param nickName
     * @param channelName
     * @return
     * @throws Exception
     * @throws BaseException
     */
    TbMemberPO makeMember(String mobileNumber, String nickName, String channelName) throws Exception, BaseException;
}
