package com.gx.merchant.controller;

import cn.com.do1.common.util.AssertUtil;
import com.google.gson.Gson;
import com.gx.merchant.domain.TbMerchantPO;
import com.gx.merchant.service.MerchantService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author admin
 */
@Controller
@RequestMapping("/merchant")
public class MerchantController {
    private final static transient Logger logger = LoggerFactory.getLogger(MerchantController.class);
    @Autowired
    private MerchantService merchantService;

    /**
     * 商家列表
     * @return
     */
    @RequestMapping("/returnListPage")
    public String returnListPage(){
        return "merchant/list";
    }

    /**
     * 店铺详情
     * @return
     */
    @RequestMapping("/returnDetailPage")
    public String returnDetailPage(HttpServletRequest request,HttpServletResponse response){
        String merchantCode = (String) request.getSession().getAttribute("merchantCode");
        TbMerchantPO tbMerchantPO = null;
        if(!AssertUtil.isEmpty(merchantCode)){
            logger.info("该用户是普通管理员");
            tbMerchantPO = merchantService.getMerchantInfoByMerchantCode(merchantCode);
            logger.info("将tbMerchantPO放进session=" + tbMerchantPO);
        }else{
            logger.info("该用户是系统管理员");
        }
        request.getSession().setAttribute("tbMerchantPO",tbMerchantPO);
        return "merchant/merchantDetail";
    }

    @ResponseBody
    @RequestMapping(value = "/getAllMerchantInfo",produces = "text/plain;charset=utf-8")
    public String getAllMerchantInfo(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        //判断session是否存在商家
        String merchantCode = (String) request.getSession().getAttribute("merchantCode");
        String userName = (String) request.getSession().getAttribute("adminName");
        logger.info("session中存在的merchantCode=" + merchantCode);
        logger.info("session中存在的userName=" + userName);
        //admin是系统管理员
        if(!"admin".equals(userName)){
            //普通管理员查询
            logger.info("该用户是普通管理员");
            logger.info("商家管理control层......正在查询用户所对应商家......");
            Integer page = Integer.valueOf(request.getParameter("page"));
            Integer rows = Integer.valueOf(request.getParameter("rows"));
            logger.info("page=" + page);
            logger.info("rows=" + rows);
            List<TbMerchantPO> totalMerchantInfoPOS = merchantService.getAllMerchantInfoByMerchantCode(merchantCode);
            //获取分页数据
            List<TbMerchantPO> merchantPOS = merchantService.getPageMerchantInfoByMerchantCode((page - 1) * rows,rows,merchantCode);
            logger.info("merchandiseInfoPO=" + merchantPOS);
            Map<String, Object> map = new HashMap<String, Object>();
            Gson gson = new Gson();
            int total = totalMerchantInfoPOS.size();
            map.put("total", total);
            map.put("rows", merchantPOS);
            String jsonMap = gson.toJson(map);
            logger.info("jsonMap=" + jsonMap);
            return jsonMap;
        }else{
            //系统管理员查询
            logger.info("该用户是系统管理员");
            logger.info("商家管理control层......正在查询全部商家......");
            Integer page = Integer.valueOf(request.getParameter("page"));
            Integer rows = Integer.valueOf(request.getParameter("rows"));
            logger.info("page=" + page);
            logger.info("rows=" + rows);
            List<TbMerchantPO> totalMerchantInfoPOS = merchantService.getAllMerchantInfo();
            //获取分页数据
            List<TbMerchantPO> merchantPOS = merchantService.getPageMerchantInfo((page - 1) * rows,rows);
            logger.info("merchandiseInfoPO=" + merchantPOS);
            Map<String, Object> map = new HashMap<String, Object>();
            Gson gson = new Gson();
            int total = totalMerchantInfoPOS.size();
            map.put("total", total);
            map.put("rows", merchantPOS);
            String jsonMap = gson.toJson(map);
            logger.info("jsonMap=" + jsonMap);
            return jsonMap;
        }
    }

    /**
     *
     * @param request
     * @param response
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/ajaxView",produces = "text/plain;charset=utf-8")
    public String ajaxView(HttpServletRequest request,HttpServletResponse response){
        String merchantCode = (String) request.getSession().getAttribute("merchantCode");
        Map map = new HashMap();
        Gson gson = new Gson();
        TbMerchantPO tbMerchantPO = null;
        if(!AssertUtil.isEmpty(merchantCode)){
            logger.info("该用户是普通管理员");
            tbMerchantPO = merchantService.getMerchantInfoByMerchantCode(merchantCode);
        }else{
            logger.info("该用户是系统管理员");
        }
        map.put("tbMerchantPO",tbMerchantPO);
        String jsonMap = gson.toJson(map);
        return jsonMap;
    }
}
