package com.gx.portal.item.controller;


import com.google.gson.Gson;
import com.gx.portal.item.domain.ItemPO;
import com.gx.portal.item.service.ItemService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * @author admin
 */
@Controller
@RequestMapping("/item")
public class ItemController {

    private final static Logger logger = LoggerFactory.getLogger(ItemController.class);

    @Autowired
    private ItemService itemService;

    @ResponseBody
    @RequestMapping(value = "/ajaxSearch",produces = "text/plain;charset=utf-8")
    public String ajaxSearch(){
        //查询已经上架商品信息
        List<ItemPO> itemPOS = itemService.searchItemList();
        Map<String,Object> map = new HashMap<>();
        Gson gson = new Gson();
        map.put("itemList",itemPOS);
        map.put("code","0");
        String jsonMap = gson.toJson(map);
        return jsonMap;
    }
}
