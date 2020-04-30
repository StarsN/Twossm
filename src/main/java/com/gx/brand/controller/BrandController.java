package com.gx.brand.controller;

import com.google.gson.Gson;
import com.gx.brand.domain.TbBrand;
import com.gx.brand.service.BrandService;
import com.gx.brand.service.Impl.BrandServiceImpl;
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
import java.util.UUID;

/**
 * @author admin
 */
@Controller
@RequestMapping("/brand")
public class BrandController {
    private final static transient Logger logger = LoggerFactory.getLogger(BrandController.class);
    @Autowired
    private BrandService brandService;
    /**
     * 跳转到品牌列表页面
     * @return
     */
    @RequestMapping("/returnListPage")
    public String returnListPage(){
        return "brand/list";
    }

    /**
     * 查询分页查询品牌
     * @param request
     * @return
     */
    //produces统一编码
    @ResponseBody
    @RequestMapping(value = "/getAllBrandInfo",produces = "text/plain;charset=utf-8")
    public String getAllMerchandiseInfo(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        logger.info("品牌管理control层......正在查询全部品牌......");
        Integer page = Integer.valueOf(request.getParameter("page"));
        Integer rows = Integer.valueOf(request.getParameter("rows"));
        logger.info("page=" + page);
        logger.info("rows=" + rows);
        List<TbBrand> totalBrandInfoPOS = brandService.getAllBrandInfo();
        //获取分页数据
        List<TbBrand> brandInfoPOS = brandService.getPageBrandInfo((page - 1) * rows,rows);
        logger.info("BrandInfoPO=" + brandInfoPOS);
        Map<String, Object> map = new HashMap<String, Object>();
        Gson gson = new Gson();
        int total = totalBrandInfoPOS.size();
        map.put("total", total);
        map.put("rows", brandInfoPOS);
        String jsonMap = gson.toJson(map);
        logger.info("jsonMap=" + jsonMap);
        return jsonMap;
    }

    /**
     * 新增品牌
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/addBrandInfo",produces = "text/plain;charset=utf-8")
    public String addMerchandiseInfo(HttpServletRequest request,HttpServletResponse response) throws Exception {
        String name = request.getParameter("name");
        String code = request.getParameter("code");
        TbBrand tbBrand = new TbBrand();
        tbBrand.setBrandId(UUID.randomUUID().toString());
        tbBrand.setName(name);
        tbBrand.setCode(code);
        //保存到数据库
        brandService.saveBrandInfo(tbBrand);
        logger.info("品牌保存成功");
        logger.info("name=" + tbBrand.getName());
        logger.info("code=" + tbBrand.getCode());
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code","001");
        map.put("successMessage","品牌保存成功");
        Gson gson = new Gson();
        String result = gson.toJson(map);
        return result;
    }

    /**
     * 编辑
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/editBrandInfo",produces = "text/plain;charset=utf-8")
    public String editMerchandiseInfo(HttpServletRequest request,HttpServletResponse response) throws Exception {
        String brandId = request.getParameter("brandId");
        String name = request.getParameter("name");
        String code = request.getParameter("code");
        logger.info("brandId=" + brandId);
        logger.info("name" + name);
        logger.info("code=" + code);
        TbBrand tbBrand = new TbBrand();
        tbBrand.setBrandId(brandId);
        tbBrand.setName(name);
        tbBrand.setCode(code);
        //更新到数据库
        brandService.updateBrandInfo(tbBrand);
        logger.info("品牌更新成功");
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code","002");
        map.put("successMessage","品牌更新成功");
        Gson gson = new Gson();
        String result = gson.toJson(map);
        return result;
    }

    /**
     * 删除
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/deleteBrandInfo",produces = "text/plain;charset=utf-8")
    public String deleteMerchandiseInfo(HttpServletRequest request,HttpServletResponse response) throws Exception {
        String brandId = request.getParameter("brandId");
        logger.info("brandId" + brandId);
        //更新到数据库
        brandService.deleteBrandInfo(brandId);
        logger.info("品牌删除成功");
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code","003");
        map.put("successMessage","品牌删除成功");
        Gson gson = new Gson();
        String result = gson.toJson(map);
        return result;
    }
}
