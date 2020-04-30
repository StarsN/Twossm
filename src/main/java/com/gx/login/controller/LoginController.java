package com.gx.login.controller;

import com.gx.login.service.Impl.LoginServiceImpl;
import com.gx.login.service.LoginService;
import com.gx.merchandise.service.MerchandiseService;
import com.gx.merchant.domain.TbMerchantPO;
import com.gx.merchant.service.MerchantService;
import com.gx.user.domain.TbUserInfo;
import com.gx.util.GetMD5String;
import com.gx.util.HttpClientUtil;
import com.gx.util.SaveCookie;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.jdbc.support.JdbcUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author admin
 */
@Controller
@RequestMapping("/login")
public class LoginController {
    private final static transient Logger logger = LoggerFactory.getLogger(LoginController.class);
    @Autowired
    private LoginService loginService;
    @Autowired
    private RedisTemplate redisTemplate;
    @Autowired
    private MerchantService merchantService;
    /**
     * 返回后台登录首页
     * @return
     */
    @RequestMapping("/returnLoginPage")
    public String returnLoginPage(){
        return "login/login";
    }

//    @RequestMapping("/returnLoginPage1")
//    public void returnLoginPage1(HttpServletRequest request,HttpServletResponse response){
////        logger.info("returnPage请求中======");
////        String url = "http://127.0.0.1:8080/Twossm/login/returnLoginPage2";
////        HashMap<String,String> requestMap = new HashMap<>();
////        requestMap.put("name","liangguanquan");
////        requestMap.put("age","20");
////        String result = HttpClientUtil.doPost(url, "UTF-8", null, requestMap);
////        logger.info("result=" + result);
//        loginService.publish(request);
////        return "login/login";
//    }

//    @RequestMapping("/returnLoginPage2")
//    public void returnLoginPage2(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
//        logger.info("returnPage2请求中======");
//        String name = request.getParameter("name");
//        String age = request.getParameter("age");
//        logger.info("name=" + name);
//        logger.info("age=" + age);
//        request.getSession().setAttribute("name",name);
//        request.getSession().setAttribute("age",age);
//        request.getRequestDispatcher("returnLoginPage")
//        .forward(request,response);
//    }


    /**
     * 返回手机商城登录首页
     * @return
     */
    @RequestMapping("/returnLogin2Page")
    public String returnLogin2Page(){
        return "portal/login/login";
    }

    /**
     * 返回注册首页
     * @return
     */
    @RequestMapping("/returnRegisterPage")
    public String returnRegisterPage(){
        return "login/register";
    }

    /**
     * 返回忘记密码1页面
     * @return
     */
    @RequestMapping("/returnForgetPage")
    public String returnForgetPage(){
        return "portal/login/forget";
    }


    @RequestMapping("/loginCheck")
    public String loginCheck(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        request.setCharacterEncoding("utf-8");
        String userName = request.getParameter("username");
        String password = request.getParameter("password");
        // 获取所填验证码
        String code = request.getParameter("checkcode");
        // 获取图片中验证码
        String sessioncode = (String) session.getAttribute("sRand");

        // 如果验证码正确
        if (code.equals(sessioncode)) {
            //移除session中的图形验证码
            request.getSession().removeAttribute("sRand");
            try {
                //根据用户名查找用户对象
                TbUserInfo tbUserInfo = loginService.getUserByUserName(userName);
                logger.info("tbUserInfo=" + tbUserInfo);
                // 如果存在该用户名
                if (tbUserInfo != null) {
                    // 判断用户输入密码，与 数据库检索密码账号是否一致
                    if (GetMD5String.getMD5String(password).equals(tbUserInfo.getPassword())) {
                        // 如果登录成功
                        // 首先判断用户是否点击了checkbox记住登录状态
                        String s = request.getParameter("remember");
                        if (s != null) {
                            Cookie[] c = SaveCookie.saveCookie(userName, password);
                            response.addCookie(c[0]);
                            response.addCookie(c[1]);
                        }
                        logger.info("用户名：" + tbUserInfo.getUserName());
                        session.setAttribute("adminName", tbUserInfo.getUserName());
                        //如果不是系统管理员,将用户所在店铺放进session
                        if(!"admin".equals(tbUserInfo.getUserName())){
                            logger.info("该用户是普通管理员");
                            session.setAttribute("merchantCode",tbUserInfo.getMerchant());
                            List<TbMerchantPO> tbMerchantPOS = merchantService.getAllMerchantInfo();
                            TbMerchantPO tbMerchantPO = tbMerchantPOS.get(0);
                            request.getSession().setAttribute("tbMerchantPO",tbMerchantPO);
                            logger.info("会员登录，已将商家信息放进session" + request.getSession().getAttribute("tbMerchantPO"));
                            //将登陆管理员信息放进session
                            request.getSession().setAttribute("tbUserInfoPO",tbUserInfo);
                        }else{
                            logger.info("该用户是系统管理员");
                        }
                        // 跳转到主页
                        logger.info("登陆成功，正在进入后台管理......");
                        return "personalMember/PersonalMembers_Home";
                    } else {
                        // 如果用户名和密码不匹配
                        // 跳转至login。jsp页面
//                        request.getRequestDispatcher(
//                                "/login.jsp?errorMessage=用户名或密码错误!").forward(
//                                request, response);
                        logger.info("用户名与密码不正确");
                        request.setAttribute("errorMessage","用户名或密码错误!");
                        return "login/login";
                    }

                }else{
                    //不存用户名
                    logger.info("不存在此用户");
                    request.setAttribute("errorMessage","不存在此用户");
                    return  "login/login";
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            // 如果验证码错误
            // 跳转至login。jsp页面
//            request.getRequestDispatcher("/login.jsp?errorMessage=验证码错误!")
//                    .forward(request, response);
            request.setAttribute("errorMessage","验证码错误!");
            return "login/login";
        }
        request.setAttribute("errorMessage","未知错误，请重新输入!");
        return "login/login";
    }

}

