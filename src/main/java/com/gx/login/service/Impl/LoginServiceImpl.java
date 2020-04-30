package com.gx.login.service.Impl;

import com.gx.login.dao.ILogindao;
import com.gx.login.service.LoginService;
import com.gx.user.domain.TbUserInfo;
import com.gx.util.HttpClientUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;

/**
 * @author admin
 */
@Service("loginService")
public class LoginServiceImpl implements LoginService {private final static transient Logger logger = LoggerFactory.getLogger(LoginServiceImpl.class);

    @Autowired
    private ILogindao logindao;
    /**
     * 根据用户名查找用户
     * @param userName
     * @return
     */
    @Override
    public TbUserInfo getUserByUserName(String userName) {
        return logindao.getUserByUserName(userName);
    }

    /**
     * 测试发布
     * @param request
     */
    @Override
    public void publish(HttpServletRequest request) {
        logger.info("returnPage请求中======");
        String url = "http://127.0.0.1:8080/Twossm/login/returnLoginPage2";
        HashMap<String,String> requestMap = new HashMap<>();
        requestMap.put("name","liangguanquan");
        requestMap.put("age","20");
        String result = HttpClientUtil.doPost(url, "UTF-8", null, requestMap);
        logger.info("result=" + result);
    }
}
