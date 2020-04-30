package com.gx.marketingtool.coupon.controller;

import cn.com.do1.common.util.AssertUtil;
import com.google.gson.Gson;
import com.gx.marketingtool.coupon.domain.TbCouponPO;
import com.gx.marketingtool.coupon.domain.TbCouponPackagePO;
import com.gx.marketingtool.coupon.domain.TbCouponPackageVO;
import com.gx.marketingtool.coupon.domain.TbCouponVO;
import com.gx.marketingtool.coupon.service.CouponService;
import com.gx.member.domain.TbMemberPO;
import com.gx.merchant.domain.TbMerchantPO;
import com.gx.util.SysConstant;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;


@Controller
@RequestMapping("/coupon")
public class CouponController {
    private final static transient Logger logger = LoggerFactory.getLogger(CouponController.class);

    @Autowired
    private CouponService couponService;
    //跳转优惠券列表页面
    @RequestMapping("/returnListPage")
    public String returnListPage(){
        return "markingtool/coupon/list";
    }

    //====================================前台======================================
    @ResponseBody
    @RequestMapping(value = "/getCouponByMerchantId",produces = "text/plain;charset=utf-8")
    private String getCouponByMerchantId(HttpServletRequest request,HttpServletResponse response){
        //获取商家
        TbMerchantPO tbMerchantPO = (TbMerchantPO) request.getSession().getAttribute("tbMerchantPO");
        //获取商家id
        String merchantId = tbMerchantPO.getMerchantId();
        List<TbCouponVO> tbCouponVOS = couponService.getCouponByMerchantId(merchantId);
        logger.info("tbCouponVOS=" + tbCouponVOS);
        if(!AssertUtil.isEmpty(tbCouponVOS)){
            Map<String, Object> map = new HashMap<String, Object>();
            Gson gson = new Gson();
            map.put("code", "0");
            map.put("couponVOList",tbCouponVOS);
            String jsonMap = gson.toJson(map);
            logger.info("jsonMap=" + jsonMap);
            return jsonMap;
        }else{
            Map<String, Object> map = new HashMap<String, Object>();
            Gson gson = new Gson();
            map.put("code", "1");
            String jsonMap = gson.toJson(map);
            logger.info("jsonMap=" + jsonMap);
            return jsonMap;
        }
    }

    //领取优惠券
    @ResponseBody
    @RequestMapping(value = "/getCoupon",produces = "text/plain;charset=utf-8")
    public String getCoupon(HttpServletRequest request,HttpServletResponse response){
        //获取到优惠券id
        String couponId = request.getParameter("couponId");
        //根据优惠券id获取优惠券信息
        TbCouponPO tbCouponPO = couponService.getCouponByCouponId(couponId);
        //生成优惠券
        TbCouponPackagePO tbCouponPackagePO = new TbCouponPackagePO();
        //设置优惠券id
        tbCouponPackagePO.setCouponId(couponId);
        //设置优惠券名字
        tbCouponPackagePO.setCouponName(tbCouponPO.getCouponName());
        //设置优惠券packageid
        tbCouponPackagePO.setCouponPackageId(UUID.randomUUID().toString());
        //设置优惠券使用状态
        tbCouponPackagePO.setCouponUseStatus(SysConstant.couponStatus.COUPON_PACKAGE_AVAILABLE);
        //设置商家信息
        TbMerchantPO tbMerchantPO = (TbMerchantPO) request.getSession().getAttribute("tbMerchantPO");
        tbCouponPackagePO.setMechantId(tbMerchantPO.getMerchantId());
        tbCouponPackagePO.setMerchantName(tbMerchantPO.getMerchantName());
        //设置用户信息
        TbMemberPO tbMemberPO = (TbMemberPO) request.getSession().getAttribute("tbMemberPO");
        tbCouponPackagePO.setMemberId(tbMemberPO.getMemberId());
        //生成过期时间
        if (SysConstant.couponStatus.EFFECTIVE_TIME_TYPE_TIME.equals(tbCouponPO.getEffectiveTimeType())) {
            logger.info("进入固定时间");
            // 固定时间
            tbCouponPackagePO.setEndTime(tbCouponPO.getExpirationTime());
            tbCouponPackagePO.setStartTime(tbCouponPO.getEffectiveTime());
        }else{
            logger.info("不进入固定时间");
        }
        tbCouponPackagePO.setReceiveTime(new Date());
        logger.info("将要插入数据库的优惠券包=" + tbCouponPackagePO);
        //插入数据
        int result1 = couponService.insertCouponPackagePO(tbCouponPackagePO);
        //修改优惠券库存
        if(result1>0){
            TbCouponPO tbCouponPO1 = new TbCouponPO();
            tbCouponPO1.setCouponId(couponId);
            tbCouponPO1.setCouponSku(String.valueOf(Integer.parseInt(tbCouponPO.getCouponSku())-1));
            int result2 = couponService.updateCouponSku(tbCouponPO1);
            if(result2>0){
                Map<String, Object> map = new HashMap<String, Object>();
                Gson gson = new Gson();
                map.put("code", "0");
                String jsonMap = gson.toJson(map);
                logger.info("jsonMap=" + jsonMap);
                return jsonMap;
            }else{
                logger.info("修改优惠券库存异常");
            }
        }else{
            logger.info("优惠券包插入数据库异常");
        }
        Map<String, Object> map = new HashMap<String, Object>();
        Gson gson = new Gson();
        map.put("code", "1");
        String jsonMap = gson.toJson(map);
        logger.info("jsonMap=" + jsonMap);
        return jsonMap;
    }


    /**
     * 获取我的优惠券
     * @param request
     * @param response
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/getMyCouponPackage",produces = "text/plain;charset=utf-8")
    public String getMyCouponPackage(HttpServletRequest request,HttpServletResponse response){
        //商家信息
        TbMerchantPO tbMerchantPO = (TbMerchantPO) request.getSession().getAttribute("tbMerchantPO");
        //会员信息
        TbMemberPO tbMemberPO = (TbMemberPO) request.getSession().getAttribute("tbMemberPO");
        List<TbCouponPackageVO> tbCouponPackageVOS = couponService.getMyCouponPackage(tbMerchantPO.getMerchantId(),tbMemberPO.getMemberId());
        if(!AssertUtil.isEmpty(tbCouponPackageVOS)){
            Map<String, Object> map = new HashMap<String, Object>();
            Gson gson = new Gson();
            map.put("code", "0");
            map.put("couponPackageVOList",tbCouponPackageVOS);
            String jsonMap = gson.toJson(map);
            logger.info("jsonMap=" + jsonMap);
            return jsonMap;
        }else {
            Map<String, Object> map = new HashMap<String, Object>();
            Gson gson = new Gson();
            map.put("code", "1");
            String jsonMap = gson.toJson(map);
            logger.info("jsonMap=" + jsonMap);
            return jsonMap;
        }
    }







    //===========================后台=============================================

    /**
     * 分页查询优惠券
     * @param request
     * @param response
     * @return
     * @throws
     */
    @ResponseBody
    @RequestMapping(value = "/getAllCouponInfo",produces = "text/plain;charset=utf-8")
    public String getAllCouponInfo(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        logger.info("优惠券管理control层......正在查询全部优惠券......");
        Integer page = Integer.valueOf(request.getParameter("page"));
        Integer rows = Integer.valueOf(request.getParameter("rows"));
        logger.info("page=" + page);
        logger.info("rows=" + rows);
        List<TbCouponVO> totalCouponInfoPOS = couponService.getAllCouponInfo();
        //获取分页数据
        List<TbCouponVO> couponInfoPOS = couponService.getPageCouponInfo((page - 1) * rows,rows);
        logger.info("couponInfoPOS=" + couponInfoPOS);
        Map<String, Object> map = new HashMap<String, Object>();
        Gson gson = new Gson();
        int total = totalCouponInfoPOS.size();
        map.put("total", total);
        map.put("rows", couponInfoPOS);
        String jsonMap = gson.toJson(map);
        logger.info("jsonMap=" + jsonMap);
        return jsonMap;
    }

    /**
     * 新增优惠券
     * @param request
     * @param response
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/ajaxAdd",produces = "text/plain;charset=utf-8")
    public String ajaxAdd(HttpServletRequest request,HttpServletResponse response) throws ParseException {
        //商家
        TbMerchantPO tbMerchantPO = (TbMerchantPO) request.getSession().getAttribute("tbMerchantPO");
        //商家id
        String merchantId = tbMerchantPO.getMerchantId();
        String merchantName = tbMerchantPO.getMerchantName();
        //获取到优惠券名称
        String couponName = request.getParameter("couponName");
        //获取到优惠券发放总量
        String couponTotalNum = request.getParameter("couponTotalNum");
        //优惠金额
        String discountAmount = request.getParameter("discountAmount");
        //获取到满多少使用
        String limitAmount = request.getParameter("limitAmount");
        //获取到生效时间
        String effectiveTimeStr = request.getParameter("effectiveTime");
        //将文本转化为日期
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date effectiveTime = simpleDateFormat.parse(effectiveTimeStr);
        //获取到过期时间
        String expirationTimeStr = request.getParameter("expirationTime");
        Date expirationTime = simpleDateFormat.parse(expirationTimeStr);
        //获取到使用说明
        String instructions = request.getParameter("instructions");
        //创建优惠券对象
        TbCouponPO tbCouponPO = new TbCouponPO();
        tbCouponPO.setCouponId(UUID.randomUUID().toString());
        tbCouponPO.setCouponName(couponName);
        tbCouponPO.setCouponTotalNum(couponTotalNum);
        tbCouponPO.setCouponSku(couponTotalNum);
        //有优惠限制
        tbCouponPO.setIsUseLimit(SysConstant.couponStatus.IS_USE_LIMIT_YES);
        tbCouponPO.setLimitAmount(limitAmount);
        //领取时间
        tbCouponPO.setEffectiveTimeType(SysConstant.couponStatus.EFFECTIVE_TIME_TYPE_TIME);
        tbCouponPO.setEffectiveTime(effectiveTime);
        tbCouponPO.setExpirationTime(expirationTime);
        tbCouponPO.setInstructions(instructions);
        //优惠方式0-固定金额1-随机金额2-折数
        tbCouponPO.setDiscountType("0");
        //优惠金额
        tbCouponPO.setDiscountAmount(discountAmount);
        //是否有领取限制,无
        tbCouponPO.setIsNumerLimit(SysConstant.couponStatus.IS_NUMER_LIMIT_NO);
        //0张使用
        tbCouponPO.setCouponInUse("0");
        //优惠券状态
        tbCouponPO.setCouponStatus(SysConstant.couponStatus.STATUS_IN_USE);
        //创建时间
        tbCouponPO.setCreateTime(new Date());
        tbCouponPO.setUpdateTime(new Date());
        //商家Id
        tbCouponPO.setMechantId(merchantId);
        tbCouponPO.setMerchantName(merchantName);
        logger.info("优惠券名称" + couponName);
        logger.info("发放总量" + couponTotalNum);
        logger.info("满" + limitAmount + "使用");
        logger.info("生效时间" + effectiveTime);
        logger.info("过期时间" + expirationTime);
        logger.info("优惠券详情=" + tbCouponPO);
        //插入数据库
        int result = couponService.insertCouponPO(tbCouponPO);
        if(result > 0){
            Map<String, Object> map = new HashMap<String, Object>();
            Gson gson = new Gson();
            map.put("code", "0");
            map.put("successMessage","保存优惠券成功");
            String jsonMap = gson.toJson(map);
            return jsonMap;
        }else{
            Map<String, Object> map = new HashMap<String, Object>();
            Gson gson = new Gson();
            map.put("code", "1");
            String jsonMap = gson.toJson(map);
            return jsonMap;
        }
    }
}
