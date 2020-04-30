package com.gx.user.controller;


import com.google.gson.Gson;
import com.gx.merchandise.controller.MerchandiseController;
import com.gx.merchandise.domain.TbMerchandiseInfoPO;
import com.gx.person.domain.TbPersonInfo;
import com.gx.person.service.PersonService;
import com.gx.user.domain.TbPersonUserRef;
import com.gx.user.domain.TbUserInfo;
import com.gx.user.service.UserService;
import com.gx.util.GetMD5String;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

/**
 * @author admin
 */
@Controller
@RequestMapping("/user")
public class UserController {
    private final static transient Logger logger = LoggerFactory.getLogger(UserController.class);
    @Autowired
    private UserService userService;
    @Autowired
    private PersonService personService;
    /**
     * 返回用户管理列表页面
     * @return
     */
    @RequestMapping("/returnUserListPage")
    public String returnUserListPage(){
        return "user/list";
    }

    /**
     * 获取user-person信息
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/getAllInfo",produces = "text/plain;charset=utf-8")
    public String getAllInfo(HttpServletRequest request, HttpServletResponse response){
        Integer page = Integer.valueOf(request.getParameter("page"));
        Integer rows = Integer.valueOf(request.getParameter("rows"));
        logger.info("page=" + page);
        logger.info("rows=" + rows);
        //查询全部数据
        List<Map<String,String>> totalUserInfos = userService.getAllInfo();
        //查询分页数据
        List<Map<String,String>> userInfos = userService.getAPagellInfo((page - 1) * rows,rows);
        logger.info("userInfos=" + userInfos);
        int total = totalUserInfos.size();
        Map<String,Object> map = new HashMap<>();
        map.put("total",total);
        map.put("rows",userInfos);
        Gson gson = new Gson();
        String jsonMap = gson.toJson(map);
        logger.info("jsonMap=" + jsonMap);
        return jsonMap;
    }

    /**
     * 新增用户信息
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/addUserInfo",produces = "text/plain;charset=utf-8")
    public String addMerchandiseInfo(HttpServletRequest request,HttpServletResponse response) throws Exception {
        String personName = request.getParameter("personName");
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String password2 = request.getParameter("password2");
        String age = request.getParameter("age");
        String sex = request.getParameter("sex");
        String merchant = request.getParameter("merchant");
        String province = request.getParameter("province");
        logger.info("personName=" + personName);
        logger.info("userName=" + userName);
        logger.info("p1=" + password);
        logger.info("p2=" + password2);
        logger.info("age=" + age);
        logger.info("sex" + sex);
        logger.info("merchant=" + String.valueOf(merchant));
        logger.info("province=" + province);
        TbUserInfo tbUserInfo = new TbUserInfo();
        TbPersonInfo tbPersonInfo = new TbPersonInfo();
        TbPersonUserRef tbPersonUserRef = new TbPersonUserRef();
        //保存User
        tbUserInfo.setUserId(UUID.randomUUID().toString());
        tbUserInfo.setUserName(userName);
        //将密码进行MD5加密
        password = GetMD5String.getMD5String(password);
        logger.info("进行加密后的密码：" + password);
        tbUserInfo.setPassword(password);
        Date date = new Date();
        tbUserInfo.setCreateTime(date);
        tbUserInfo.setStatus("0");
        tbUserInfo.setLastLoginTime(date);
        tbUserInfo.setMerchant(merchant);
        //保存person
        tbPersonInfo.setPersonId(UUID.randomUUID().toString());
        tbPersonInfo.setPersonName(personName);
        tbPersonInfo.setAge(age);
        tbPersonInfo.setSex(sex);
//        tbPersonInfo.setMerchant(merchant);
        //假设不考虑设置密码条件，全部已经设置过
        tbPersonInfo.setChangePwd("1");
        tbPersonInfo.setChangeTime(date);
        tbPersonInfo.setProvince(province);
        //保存关联
        tbPersonUserRef.setRefId(UUID.randomUUID().toString());
        tbPersonUserRef.setUserId(tbUserInfo.getUserId());
        tbPersonUserRef.setPersonId(tbPersonInfo.getPersonId());
        //保存到数据库
        userService.addUserInfo(tbUserInfo);
        personService.addPersonInfo(tbPersonInfo);
        userService.addUserPersonRef(tbPersonUserRef);
        logger.info("用户保存成功");
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code","001");
        map.put("successMessage","用户保存成功");
        Gson gson = new Gson();
        String result = gson.toJson(map);
        return result;
    }

    /**
     * 更改信息
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/editUserInfo",produces = "text/plain;charset=utf-8")
    public String editMerchandiseInfo(HttpServletRequest request,HttpServletResponse response) throws Exception {
        String personName = request.getParameter("personName");
        String userName = request.getParameter("userName");
        String userId = request.getParameter("userId");
        logger.info("personName=" + personName);
        logger.info("userName=" + userName);
        logger.info("userId=" + userId);
        TbUserInfo tbUserInfo = new TbUserInfo();
        TbPersonInfo tbPersonInfo = new TbPersonInfo();
        //根据userId找到personId
        String personId = userService.getPersonIdByUserId(userId);
        //user
        tbUserInfo.setUserId(userId);
        tbUserInfo.setUserName(userName);
        //person
        tbPersonInfo.setPersonId(personId);
        tbPersonInfo.setPersonName(personName);
        //更新user表、person表
        userService.updateUserInfo(tbUserInfo);
        personService.updatePersonInfo(tbPersonInfo);
        logger.info("用户更新成功");
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code","002");
        map.put("successMessage","用户更新成功");
        Gson gson = new Gson();
        String result = gson.toJson(map);
        return result;
    }

    /**
     * 删除用户
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/deleteUserInfo",produces = "text/plain;charset=utf-8")
    public String deleteMerchandiseInfo(HttpServletRequest request,HttpServletResponse response) throws Exception {
        String userId = request.getParameter("userId");
        logger.info("userId="+userId);
        //根据userId找到personId
        String personId = userService.getPersonIdByUserId(userId);
        //更新到数据库
        userService.deleteUserInfo(userId);
        personService.deletePersonInfo(personId);
        userService.delePersonUserRef(userId,personId);
        logger.info("用户删除成功");
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code","003");
        map.put("successMessage","用户删除成功");
        Gson gson = new Gson();
        String result = gson.toJson(map);
        return result;
    }
}
