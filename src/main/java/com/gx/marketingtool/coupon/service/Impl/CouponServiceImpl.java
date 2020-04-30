package com.gx.marketingtool.coupon.service.Impl;

import cn.com.do1.common.util.AssertUtil;
import com.gx.marketingtool.coupon.dao.ICoupondao;
import com.gx.marketingtool.coupon.domain.TbCouponPO;
import com.gx.marketingtool.coupon.domain.TbCouponPackagePO;
import com.gx.marketingtool.coupon.domain.TbCouponPackageVO;
import com.gx.marketingtool.coupon.domain.TbCouponVO;
import com.gx.marketingtool.coupon.service.CouponService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author admin
 */
@Service("couponService")
public class CouponServiceImpl implements CouponService {

    private final static transient Logger logger = LoggerFactory.getLogger(CouponServiceImpl.class);
    @Autowired
    private ICoupondao coupondao;
    /**
     * 查找全部优惠券
     * @return
     */
    @Override
    public List<TbCouponVO> getAllCouponInfo() {
        List<TbCouponVO> tbCouponVOS = coupondao.getAllCouponInfo();
        logger.info("查询到的优惠券=" + tbCouponVOS);
        if(!AssertUtil.isEmpty(tbCouponVOS)){
            List<TbCouponVO> tbCouponVOS1 = new ArrayList<TbCouponVO>();
            for (TbCouponVO tbCouponVO:tbCouponVOS) {
                //设置有效期描述
                tbCouponVO.setEffectiveTimedescByEffectiveTimeType(tbCouponVO.getEffectiveTimeType());
                //设置价值描述
                tbCouponVO.setValueByDiscountType(tbCouponVO.getDiscountType());
                //设置领取数量限制描述
                tbCouponVO.setNumerLimitDescByIsNumerLimit(tbCouponVO.getIsNumerLimit());
                //设置库存/总发放量
                tbCouponVO.setCouponNumAndSku(tbCouponVO.getCouponTotalNum(),tbCouponVO.getCouponSku());
                tbCouponVOS1.add(tbCouponVO);
            }
            return tbCouponVOS1;
        }
        return tbCouponVOS;
    }

    /**
     * 获取分页查询
     * @param i
     * @param rows
     * @return
     */
    @Override
    public List<TbCouponVO> getPageCouponInfo(int i, Integer rows) {
        List<TbCouponVO> tbCouponVOS = coupondao.getPageCouponInfo(i,rows);
        logger.info("查询到的优惠券=" + tbCouponVOS);
        if(!AssertUtil.isEmpty(tbCouponVOS)){
            List<TbCouponVO> tbCouponVOS1 = new ArrayList<TbCouponVO>();
            for (TbCouponVO tbCouponVO:tbCouponVOS) {
                //设置有效期描述
                tbCouponVO.setEffectiveTimedescByEffectiveTimeType(tbCouponVO.getEffectiveTimeType());
                //设置价值描述
                tbCouponVO.setValueByDiscountType(tbCouponVO.getDiscountType());
                //设置领取数量限制描述
                tbCouponVO.setNumerLimitDescByIsNumerLimit(tbCouponVO.getIsNumerLimit());
                //设置库存/总发放量
                tbCouponVO.setCouponNumAndSku(tbCouponVO.getCouponTotalNum(),tbCouponVO.getCouponSku());
                tbCouponVOS1.add(tbCouponVO);
            }
            return tbCouponVOS1;
        }
        return tbCouponVOS;
    }

    /**
     * 插入数据库
     * @param tbCouponPO
     * @return
     */
    @Override
    public int insertCouponPO(TbCouponPO tbCouponPO) {
        return coupondao.insertCouponPO(tbCouponPO);
    }

    /**
     * 查询优惠券表
     * @param merchantId
     * @return
     */
    @Override
    public List<TbCouponVO> getCouponByMerchantId(String merchantId) {
        return coupondao.getCouponByMerchantId(merchantId);
    }

    /**
     * 根据id获取优惠券
     * @param couponId
     * @return
     */
    @Override
    public TbCouponPO getCouponByCouponId(String couponId) {
        return coupondao.getCouponByCouponId(couponId);
    }

    /**
     * 修改优惠券库存
     * @param tbCouponPO1
     */
    @Override
    public int updateCouponSku(TbCouponPO tbCouponPO1) {
        return coupondao.updateCouponSku(tbCouponPO1);
    }

    /**
     * 插入优惠券包
     * @param tbCouponPackagePO
     * @return
     */
    @Override
    public int insertCouponPackagePO(TbCouponPackagePO tbCouponPackagePO) {
        return coupondao.insertCouponPackagePO(tbCouponPackagePO);
    }

    /**
     * 获取我的优惠券包
     * @param merchantId
     * @param memberId
     * @return
     */
    @Override
    public List<TbCouponPackageVO> getMyCouponPackage(String merchantId, String memberId) {
        return coupondao.getMyCouponPackage(merchantId,memberId);
    }
}
