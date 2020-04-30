package com.gx.login.service;

import com.gx.user.domain.TbUserInfo;

import javax.servlet.http.HttpServletRequest;

public interface LoginService {
    /**
     * 根据用户名查找用户
     * @param userName
     * @return
     */
    TbUserInfo getUserByUserName(String userName);

    /**
     * 测试发布
     * @param request
     */
    void publish(HttpServletRequest request);
}
