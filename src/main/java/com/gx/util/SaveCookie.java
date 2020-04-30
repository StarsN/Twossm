package com.gx.util;

import javax.servlet.http.Cookie;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class SaveCookie {
    /*
     * 保持用户名和密码保存在cookies中,使用URLEncoder解决无法在cookie中保持中文的问题,先转码，在解码
     */
    public static Cookie[] saveCookie(String username, String password) {
        String usern;
        String pwd;
        Cookie usernamecookie = null;
        Cookie passwordcookie = null;
        try {
            usern = URLEncoder.encode(username, "utf-8");
            pwd = URLEncoder.encode(password, "utf-8");
            usernamecookie = new Cookie("username", usern);
            passwordcookie = new Cookie("password", pwd);
            usernamecookie.setMaxAge(7 * 24 * 60 * 60);// 设置最长生存时间为7天
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        Cookie[] c = new Cookie[2];
        c[0] = usernamecookie;
        c[1] = passwordcookie;
        return c;
    }
}
