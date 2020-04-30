package com.gx.marketingtool.coupon.service;

import com.gx.marketingtool.coupon.domain.TbCouponPO;
import com.gx.marketingtool.coupon.domain.TbCouponPackagePO;
import com.gx.marketingtool.coupon.domain.TbCouponPackageVO;
import com.gx.marketingtool.coupon.domain.TbCouponVO;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface CouponService {
    /**
     * 查找全部优惠券
     * @return
     */
    List<TbCouponVO> getAllCouponInfo();

    /**
     * 获取分页查询
     * @param i
     * @param rows
     * @return
     */
    List<TbCouponVO> getPageCouponInfo(int i, Integer rows);

    /**
     * 插入数据库
     * @param tbCouponPO
     * @return
     */
    int insertCouponPO(TbCouponPO tbCouponPO);

    /**
     * 根据商家id查询优惠券表
     * @param merchantId
     * @return
     */
    List<TbCouponVO> getCouponByMerchantId(String merchantId);

    /**
     * 根据地查找优惠券
     * @param couponId
     * @return
     */
    TbCouponPO getCouponByCouponId(String couponId);

    /**
     * 修改优惠券库存
     * @param tbCouponPO1
     */
    int updateCouponSku(TbCouponPO tbCouponPO1);

    /**
     * 插入优惠券包
     * @param tbCouponPackagePO
     * @return
     */
    int insertCouponPackagePO(TbCouponPackagePO tbCouponPackagePO);

    /**
     * 获取我的优惠券包
     * @param merchantId
     * @param memberId
     * @return
     */
    List<TbCouponPackageVO> getMyCouponPackage(String merchantId, String memberId);
}
