package com.gx.portal.personalCenter.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author admin
 */
@Controller
@RequestMapping("/personalCenter")
public class personalCenterController {

    /**
     * 返回个人中心页面
     * @return
     */
    @RequestMapping("/returnPersonalCenterPage")
    public String returnPersonalCenterPage(){
        return "portal/personalCenter/list";
    }

    /**
     * 返回全部商品页面
     * @return
     */
    @RequestMapping("/returnItemListPage")
    public String returnItemListPage(){
        return "portal/item/itemList";
    }

    /**
     * 返回自定义模块
     * @return
     */
    @RequestMapping("/returnDIYmodulePage")
    public String returnDIYmodulePage(){
        return "portal/item/DIYmodule";
    }

    /**
     * 主页
     * @return
     */
    @RequestMapping("/returnIndexPage")
    public String returnIndexPage(){
        return "portal/index";
    }
}
