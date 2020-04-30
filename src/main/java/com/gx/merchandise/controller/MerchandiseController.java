package com.gx.merchandise.controller;


import com.google.gson.Gson;
import com.gx.example.domain.Account;
import com.gx.example.service.AccountService;
import com.gx.merchandise.domain.TbMerchandiseImagePO;
import com.gx.merchandise.domain.TbMerchandiseInfoPO;
import com.gx.merchandise.domain.TbMerchandiseStockPO;
import com.gx.merchandise.service.MerchandiseService;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.aspectj.util.FileUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.transform.Result;
import java.io.*;
import java.util.*;

/**
 * @author admin
 */
@Controller
@RequestMapping("/merchandise")
public class MerchandiseController {
    private final static transient Logger logger = LoggerFactory.getLogger(MerchandiseController.class);
    @Autowired
    private MerchandiseService merchandiseService;
    @Autowired
    private AccountService accountService;

    /**
     * 跳转到商品列表页面
     * @return
     */
    @RequestMapping("/returnListPage")
    public String returnListPage(){
        return "merchandise/list";
    }

    //库存页面
    @RequestMapping("/returnStockPage")
    public String returnStockPage(){
        return "merchandise/stock";
    }

    /**
     * 商品渲染
     * @return
     */
    @RequestMapping("/toMerchandiseDetail")
    public String toMerchandiseDetail(){
        return "merchandise/merchandiseDetail";
    }

    /**
     * 查询分页查询商品
     * @param request
     * @return
     */
    //produces统一编码
    @ResponseBody
    @RequestMapping(value = "/getAllMerchandiseInfo",produces = "text/plain;charset=utf-8")
    public String getAllMerchandiseInfo(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        logger.info("商品管理control层......正在查询全部商品......");
        Integer page = Integer.valueOf(request.getParameter("page"));
        Integer rows = Integer.valueOf(request.getParameter("rows"));
        logger.info("page=" + page);
        logger.info("rows=" + rows);
        List<TbMerchandiseInfoPO> totalMerchandiseInfoPOS = merchandiseService.getAllMerchandiseInfo();
        //获取分页数据
        List<Map<String,String>> merchandiseInfoPOS = merchandiseService.getPageMerchandiseInfo((page - 1) * rows,rows);
        logger.info("merchandiseInfoPO=" + merchandiseInfoPOS);
        Map<String, Object> map = new HashMap<String, Object>();
        Gson gson = new Gson();
        int total = totalMerchandiseInfoPOS.size();
        map.put("total", total);
        map.put("rows", merchandiseInfoPOS);
        String jsonMap = gson.toJson(map);
        logger.info("jsonMap=" + jsonMap);
        return jsonMap;
    }
    //获取全部商品
    @ResponseBody
    @RequestMapping(value = "/getAllMerchandise",produces = "text/plain;charset=utf-8")
    public String getAllMerchandise(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        logger.info("商品管理control层......正在查询全部商品......");
        List<TbMerchandiseInfoPO> totalMerchandiseInfoPOS = merchandiseService.getAllMerchandiseInfo();
        //获取分页数据
//        Map<String, Object> map = new HashMap<String, Object>();
        Gson gson = new Gson();
//        map.put("list", totalMerchandiseInfoPOS);
        String jsonMap = gson.toJson(totalMerchandiseInfoPOS);
        logger.info("jsonMap=" + jsonMap);
        return jsonMap;
    }

    /**
     * 新增商品
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/addMerchandiseInfo",produces = "text/plain;charset=utf-8")
    public String addMerchandiseInfo(@RequestParam(value="file_upload2", required=false)MultipartFile file,HttpServletRequest request,HttpServletResponse response) throws Exception {
        //图片上传,返回图片真实路径
        String imageName = merchandiseService.uploadFile(file,request);
        //1、商品的详细信息
        Date date = new Date();
        String merchandiseName = request.getParameter("merchandiseName");
        String modelId = request.getParameter("modelId");
        String salePrice = request.getParameter("salePrice");
        String shortDesc = request.getParameter("shortDesc");
        String detailDesc = request.getParameter("detailDesc");
        String stock = request.getParameter("stock");
        TbMerchandiseInfoPO tbMerchandiseInfoPO = new TbMerchandiseInfoPO();
        String merchandiseCode = UUID.randomUUID().toString();
        tbMerchandiseInfoPO.setMerchandiseCode(merchandiseCode);
        tbMerchandiseInfoPO.setMerchandiseName(merchandiseName);
        tbMerchandiseInfoPO.setModelId(modelId);
        tbMerchandiseInfoPO.setSalePrice(salePrice);
        tbMerchandiseInfoPO.setShortDesc(shortDesc);
        tbMerchandiseInfoPO.setDetailDesc(detailDesc);
        //创建时间
        tbMerchandiseInfoPO.setCreateTime(date);
        //最近修改时间
        tbMerchandiseInfoPO.setLastModifyTime(date);
        //草稿状态
        tbMerchandiseInfoPO.setStatus("0");
        //保存到数据库
        merchandiseService.saveMerchandiseInfo(tbMerchandiseInfoPO);
        logger.info("商品保存成功");
        //2、sku-属性对照表
        //3、库存
        //4、图片(目前只用一张)
        String pre = "/images/";
        TbMerchandiseImagePO tbMerchandiseImagePO = new TbMerchandiseImagePO();
        tbMerchandiseImagePO.setImgId(UUID.randomUUID().toString());
        tbMerchandiseImagePO.setMerchandiseCode(merchandiseCode);
        tbMerchandiseImagePO.setImagePath(pre + imageName);
        //保存图片进数据库
        merchandiseService.insertImagePO(tbMerchandiseImagePO);
        logger.info("图片保存成功");
        //存进库存信息
        TbMerchandiseStockPO tbMerchandiseStockPO = new TbMerchandiseStockPO();
        tbMerchandiseStockPO.setId(UUID.randomUUID().toString());
        tbMerchandiseStockPO.setMerchandiseCode(merchandiseCode);
        tbMerchandiseStockPO.setPrice(salePrice);
        tbMerchandiseStockPO.setStock(stock);
        tbMerchandiseStockPO.setStockId(UUID.randomUUID().toString());
        tbMerchandiseStockPO.setUpdateTime(date);
        merchandiseService.addMerchandiseStock(tbMerchandiseStockPO);
        logger.info("库存保存成功");
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code","001");
        map.put("successMessage","商品保存成功");
        Gson gson = new Gson();
        String result = gson.toJson(map);
        return result;
    }


    /**
     * 更新商品信息
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/editMerchandiseInfo",produces = "text/plain;charset=utf-8")
    public String editMerchandiseInfo(HttpServletRequest request,HttpServletResponse response) throws Exception {
        String merchandiseCode = request.getParameter("merchandiseCode");
        String merchandiseName = request.getParameter("merchandiseName");
        String modelId = request.getParameter("modelId");
        String salePrice = request.getParameter("salePrice");
        String shortDesc = request.getParameter("shortDesc");
        String detailDesc = request.getParameter("detailDesc");
        String stock = request.getParameter("stock");
        logger.info("merchandiseCode=" + merchandiseCode);
        logger.info("merchandiseName=" + merchandiseName);
        logger.info("modelId=" + modelId);
        logger.info("salePrice=" + salePrice);
        logger.info("shortDesc=" + shortDesc);
        logger.info("detailDesc=" + detailDesc);
        TbMerchandiseInfoPO tbMerchandiseInfoPO = new TbMerchandiseInfoPO();
        tbMerchandiseInfoPO.setMerchandiseCode(merchandiseCode);
        tbMerchandiseInfoPO.setMerchandiseName(merchandiseName);
        tbMerchandiseInfoPO.setModelId(modelId);
        tbMerchandiseInfoPO.setSalePrice(salePrice);
        tbMerchandiseInfoPO.setShortDesc(shortDesc);
        tbMerchandiseInfoPO.setDetailDesc(detailDesc);
        tbMerchandiseInfoPO.setStatus("0");
        //更新到数据库
        merchandiseService.updateMerchandiseInfo(tbMerchandiseInfoPO);
        //更新库存到数据库
        Date date = new Date();
        TbMerchandiseStockPO tbMerchandiseStockPO = new TbMerchandiseStockPO();
        tbMerchandiseStockPO.setMerchandiseCode(merchandiseCode);
        tbMerchandiseStockPO.setPrice(salePrice);
        tbMerchandiseStockPO.setStock(stock);
        tbMerchandiseStockPO.setUpdateTime(date);
        merchandiseService.updateMerchandiseStockPO(tbMerchandiseStockPO);
        logger.info("商品更新成功");
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code","002");
        map.put("successMessage","商品更新成功");
        Gson gson = new Gson();
        String result = gson.toJson(map);
        return result;
    }

    /**
     * 删除商品
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/deleteMerchandiseInfo",produces = "text/plain;charset=utf-8")
    public String deleteMerchandiseInfo(HttpServletRequest request,HttpServletResponse response) throws Exception {
        String merchandiseCode = request.getParameter("merchandiseCode");
        logger.info("merchandiseCode=" + merchandiseCode);
        //更新到数据库
        merchandiseService.deleteMerchandiseInfo(merchandiseCode);
        logger.info("商品删除成功");
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code","003");
        map.put("successMessage","商品删除成功");
        Gson gson = new Gson();
        String result = gson.toJson(map);
        return result;
    }

    /**
     * 发布商品
     * @param request
     * @param response
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/publish",produces = "text/plain;charset=utf-8")
    public String publish(HttpServletRequest request,HttpServletResponse response) throws IOException {
        //获取到商品编号
        String merchandiseCode = request.getParameter("merchandiseCode");
        //发布商品
        String result = merchandiseService.publish(request);
        logger.info("商品发布成功，发布的页面=" + result);
        //将商品页面上
        OutputStream os = null;
        String div = "/static/";
        String htmlName = "";
        ServletContext sc = request.getSession().getServletContext();
        try{
            String dir = sc.getRealPath("/merchandise_detail/static");
            String fileName = UUID.randomUUID().toString() + ".html";
            htmlName = fileName;
            File realFile = new File(dir,fileName);
            logger.info("realFilePath=" + realFile.getPath());
            os = new FileOutputStream(realFile);
            IOUtils.write(result, os, "UTF-8");//IOUtils工具类，这个方法可以把数据写入到输出流中
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            IOUtils.closeQuietly(os);//以后就直接在finally里关闭流。也不需要判断条件。
        }
        //更新商品的发布地址
        String publishAddress = div + htmlName;
        logger.info("商品的发布地址为=" + publishAddress);
        merchandiseService.setPublishAddress(merchandiseCode,publishAddress);
        logger.info("商品发布地址更新成功");
        //更新商品的状态为发布状态,3-发布状态
        merchandiseService.updateMerchandiseStatus(merchandiseCode,"3");
        Map<String,Object> map = new HashMap<>();
        map.put("code","0");
        Gson gson = new Gson();
        String jsonMap = gson.toJson(map);
        return jsonMap;
    }

    /**
     * 渲染商品
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @ResponseBody
    @RequestMapping(value = "/paddingContent",produces = "text/plain;charset=utf-8")
    public void paddingContent(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        logger.info("====商品渲染中=====");
        //获取到商品编号
        String merchandiseCode = request.getParameter("merchandiseCode");
        //商品信息
        TbMerchandiseInfoPO tbMerchandiseInfoPO = merchandiseService.getMerchandisePO(merchandiseCode);
        //图片信息
        TbMerchandiseImagePO tbMerchandiseImagePO = merchandiseService.getMerchandiseImagePO(merchandiseCode);
        logger.info("商品信息：" + tbMerchandiseInfoPO);
        logger.info("图片信息：" + tbMerchandiseImagePO);
        request.setAttribute("tbMerchandiseInfoPO",tbMerchandiseInfoPO);
        request.setAttribute("tbMerchandiseImagePO",tbMerchandiseImagePO);
        request.getRequestDispatcher("toMerchandiseDetail")
        .forward(request,response);
    }

    /**
     * 更新商品状态
     */
    @ResponseBody
    @RequestMapping(value = "/updateMerchandiseStatus",produces = "text/plain;charset=utf-8")
    public String  updateMerchandiseStatus(HttpServletRequest request,HttpServletResponse response){
        //获取到商品编号
        String merchandiseCode = request.getParameter("merchandiseCode");
        //获取到商品状态
        String status = request.getParameter("status");
        merchandiseService.updateMerchandiseStatus(merchandiseCode,status);
        Map<String,Object> map = new HashMap<>();
        map.put("code",0);
        Gson gson = new Gson();
        String jsonMap = gson.toJson(map);
        return jsonMap;
    }

    /**
     * 查询商品库存信息
     * @param request
     * @return
     */
    //produces统一编码
    @ResponseBody
    @RequestMapping(value = "/getMerchandiseStock",produces = "text/plain;charset=utf-8")
    public String getMerchandiseStock(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        logger.info("商品库存管理control层......正在查询商品库存......");
        Integer page = Integer.valueOf(request.getParameter("page"));
        Integer rows = Integer.valueOf(request.getParameter("rows"));
        logger.info("page=" + page);
        logger.info("rows=" + rows);
        List<Map<String,String>> totalMerchandiseStockPOS = merchandiseService.getMerchandiseStock();
        logger.info("商品库存信息=" + totalMerchandiseStockPOS);
        //获取分页数据
        List<Map<String,String>> merchandiseStockPOS = merchandiseService.getPagegetMerchandiseStock((page - 1) * rows,rows);
//        logger.info("merchandiseInfoPO=" + merchandiseInfoPOS);
        Map<String, Object> map = new HashMap<String, Object>();
        Gson gson = new Gson();
        int total = totalMerchandiseStockPOS.size();
        map.put("total", total);
        map.put("rows", merchandiseStockPOS);
        String jsonMap = gson.toJson(map);
        logger.info("jsonMap=" + jsonMap);
        return jsonMap;
    }

    //编辑库存
    @ResponseBody
    @RequestMapping(value = "/editMerchandiseStock",produces = "text/plain;charset=utf-8")
    public String editMerchandiseStock(HttpServletRequest request,HttpServletResponse response){
        //获取到商品编号
        String merchandiseCode = request.getParameter("merchandiseCode");
        //获取到库存
        String stock = request.getParameter("stock");
        //获取到价格
        String price = request.getParameter("price");
        //更新价格到商品表
        merchandiseService.updatePrice(merchandiseCode,price);
        //更新价格、库存到商品库存表
        merchandiseService.updateMerchandiseStock(merchandiseCode,stock,price);
        Map<String,Object> map = new HashMap<>();
        map.put("code","0");
        map.put("successMessage","保存库存成功");
        Gson gson = new Gson();
        String josnMap = gson.toJson(map);
        return josnMap;
    }

    //根据商品id获取商品库存
    @ResponseBody
    @RequestMapping(value = "/gainMerchandiseStock",produces = "text/plain;charset=utf-8")
    public String gainMerchandiseStock(HttpServletRequest request,HttpServletResponse response){
        //获取商品编号
        String merchandiseCode = request.getParameter("merchandiseCode");
        TbMerchandiseStockPO tbMerchandiseStockPO = merchandiseService.gainMerchandiseStock(merchandiseCode);
        String stock = tbMerchandiseStockPO.getStock();
        String stockId = tbMerchandiseStockPO.getStockId();
        Map<String,Object> map = new HashMap<>();
        logger.info("库存="+stock);
        map.put("stock",stock);
        map.put("stockId",stockId);
        Gson gson = new Gson();
        String jsonMap = gson.toJson(map);
        return jsonMap;
    }
}
