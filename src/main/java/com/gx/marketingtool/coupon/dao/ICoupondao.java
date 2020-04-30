package com.gx.marketingtool.coupon.dao;

import com.gx.marketingtool.coupon.domain.TbCouponPO;
import com.gx.marketingtool.coupon.domain.TbCouponPackagePO;
import com.gx.marketingtool.coupon.domain.TbCouponPackageVO;
import com.gx.marketingtool.coupon.domain.TbCouponVO;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface ICoupondao {
    /**
     * 获取全部优惠券
     * @return
     */
    @Select("select * from tb_coupon c where c.couponStatus in (0,1,2) order by createTime desc")
    List<TbCouponVO> getAllCouponInfo();

    /**
     * 分页查询
     * @param i
     * @param rows
     * @return
     */
    @Select("select * from tb_coupon c where c.couponStatus in (0,1,2) order by createTime desc LIMIT #{start},#{end} ")
    List<TbCouponVO> getPageCouponInfo(@Param("start") int i, @Param("end") Integer rows);

    /**
     * 插入数据库
     * @param tbCouponPO
     * @return
     */
    @Insert("insert into tb_coupon(couponId,mechantId,merchantName,couponTotalNum,couponSku,couponStatus,couponName,discountType,discountAmount,minDiscountAmount,maxDiscountAmount,discount,isUseLimit,limitAmount,isNumerLimit,limitNumber,effectiveTimeType,effectiveTime,expirationTime,instructions,createTime,updateTime,remark,couponInUse)values(" +
            "#{po.couponId},#{po.mechantId},#{po.merchantName},#{po.couponTotalNum},#{po.couponSku},#{po.couponStatus},#{po.couponName},#{po.discountType},#{po.discountAmount},#{po.minDiscountAmount},#{po.maxDiscountAmount},#{po.discount},#{po.isUseLimit},#{po.limitAmount},#{po.isNumerLimit},#{po.limitNumber},#{po.effectiveTimeType},#{po.effectiveTime},#{po.expirationTime},#{po.instructions},#{po.createTime},#{po.updateTime},#{po.remark},#{po.couponInUse})")
    int insertCouponPO(@Param("po") TbCouponPO tbCouponPO);

    /**
     * 根据商家id获取优惠券
     * @param merchantId
     * @return
     */
    @Select("SELECT * from tb_coupon c where c.mechantId=#{merchantId} and c.couponStatus='0' and c.expirationTime > NOW()")
    List<TbCouponVO> getCouponByMerchantId(@Param("merchantId") String merchantId);

    /**
     * 根据优惠券id查询优惠券
     * @param couponId
     * @return
     */
    @Select("select * from tb_coupon c where c.couponId=#{couponId}")
    TbCouponPO getCouponByCouponId(@Param("couponId") String couponId);

    /**
     * 修改优惠券库存
     * @param tbCouponPO1
     * @return
     */
    @Update("update tb_coupon c set c.couponSku=#{po.couponSku} where couponId=#{po.couponId}")
    int updateCouponSku(@Param("po") TbCouponPO tbCouponPO1);

    /**
     * 插入优惠券包
     * @param tbCouponPackagePO
     * @return
     */
    @Insert("insert into tb_coupon_package(couponPackageId,couponId,orderId,couponName,mechantId,merchantName,memberId,couponUseStatus,receiveTime,remark,startTime,endTime,useTime,valueDesc,useLimitDesc,nickName)values(" +
            "#{po.couponPackageId},#{po.couponId},#{po.orderId},#{po.couponName},#{po.mechantId},#{po.merchantName},#{po.memberId},#{po.couponUseStatus},#{po.receiveTime},#{po.remark},#{po.startTime},#{po.endTime},#{po.useTime},#{po.valueDesc},#{po.useLimitDesc},#{po.nickName})")
    int insertCouponPackagePO(@Param("po") TbCouponPackagePO tbCouponPackagePO);

    /**
     * 获取我的优惠券包
     * @param merchantId
     * @param memberId
     * @return
     */
    @Select("SELECT t1.*,t2.discountType,t2.discountAmount,t2.discount,t2.isUseLimit,t2.limitAmount FROM tb_coupon_package t1\n" +
            "LEFT JOIN tb_coupon t2 ON t1.couponId = t2.couponId \n" +
            "WHERE t1.mechantId=#{merchantId} and t1.memberId=memberId ORDER BY t1.receiveTime")
    List<TbCouponPackageVO> getMyCouponPackage(@Param("merchantId") String merchantId, @Param("memberId") String memberId);
}
