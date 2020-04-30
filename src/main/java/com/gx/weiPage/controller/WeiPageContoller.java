package com.gx.weiPage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author admin
 */
@Controller
@RequestMapping("/weiPage")
public class WeiPageContoller {
    @RequestMapping("returnWeiPage")
    public String returnWeiPage(){
        return "";
    }
}
