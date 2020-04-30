package com.gx.marketingtool.coupon.domain;

import java.io.Serializable;
import java.util.Date;

public class TbCouponPO implements Serializable {
    //优惠券id
    private String couponId;
    //商家Id
    private String mechantId;
    //商家名字
    private String merchantName;
    //发放量
    private String couponTotalNum;
    //优惠券库存
    private String couponSku;
    //优惠券状态  0使用中，1已失效，2已过期，3已删除
    private String couponStatus;
    //优惠券名称
    private String couponName;
    //打折类型 0固定面额优惠，1随机面额优惠，2折扣
    private String discountType;
    //打折金额
    private String discountAmount;
    //随机最小值minDiscountAmount
    private String minDiscountAmount;
    //随机最大值
    private String maxDiscountAmount;
    //打几折
    private String discount;
    //是否使用限制（满减）isUseLimit
    private String isUseLimit;
    //满减的金额 limitAmount
    private String limitAmount;
    //领取限制
    private String isNumerLimit;
    //限制的张数
    private String limitNumber;
    //生效时间类型
    private String effectiveTimeType;
    //生效时间
    private Date effectiveTime;
    //过期时间
    private Date expirationTime;
    //优惠券介绍instructions
    private String instructions;
    //创建时间
    private Date createTime;
    //更新时间
    private Date updateTime;
    //备注remark
    private String remark;
    //已使用张数
    private String couponInUse;

    public String getCouponId() {
        return couponId;
    }

    public void setCouponId(String couponId) {
        this.couponId = couponId;
    }

    public String getMechantId() {
        return mechantId;
    }

    public void setMechantId(String mechantId) {
        this.mechantId = mechantId;
    }

    public String getMerchantName() {
        return merchantName;
    }

    public void setMerchantName(String merchantName) {
        this.merchantName = merchantName;
    }

    public String getCouponTotalNum() {
        return couponTotalNum;
    }

    public void setCouponTotalNum(String couponTotalNum) {
        this.couponTotalNum = couponTotalNum;
    }

    public String getCouponSku() {
        return couponSku;
    }

    public void setCouponSku(String couponSku) {
        this.couponSku = couponSku;
    }

    public String getCouponStatus() {
        return couponStatus;
    }

    public void setCouponStatus(String couponStatus) {
        this.couponStatus = couponStatus;
    }

    public String getCouponName() {
        return couponName;
    }

    public void setCouponName(String couponName) {
        this.couponName = couponName;
    }

    public String getDiscountType() {
        return discountType;
    }

    public void setDiscountType(String discountType) {
        this.discountType = discountType;
    }

    public String getDiscountAmount() {
        return discountAmount;
    }

    public void setDiscountAmount(String discountAmount) {
        this.discountAmount = discountAmount;
    }

    public String getMinDiscountAmount() {
        return minDiscountAmount;
    }

    public void setMinDiscountAmount(String minDiscountAmount) {
        this.minDiscountAmount = minDiscountAmount;
    }

    public String getMaxDiscountAmount() {
        return maxDiscountAmount;
    }

    public void setMaxDiscountAmount(String maxDiscountAmount) {
        this.maxDiscountAmount = maxDiscountAmount;
    }

    public String getDiscount() {
        return discount;
    }

    public void setDiscount(String discount) {
        this.discount = discount;
    }

    public String getIsUseLimit() {
        return isUseLimit;
    }

    public void setIsUseLimit(String isUseLimit) {
        this.isUseLimit = isUseLimit;
    }

    public String getLimitAmount() {
        return limitAmount;
    }

    public void setLimitAmount(String limitAmount) {
        this.limitAmount = limitAmount;
    }

    public String getIsNumerLimit() {
        return isNumerLimit;
    }

    public void setIsNumerLimit(String isNumerLimit) {
        this.isNumerLimit = isNumerLimit;
    }

    public String getLimitNumber() {
        return limitNumber;
    }

    public void setLimitNumber(String limitNumber) {
        this.limitNumber = limitNumber;
    }

    public Date getEffectiveTime() {
        return effectiveTime;
    }

    public void setEffectiveTime(Date effectiveTime) {
        this.effectiveTime = effectiveTime;
    }

    public Date getExpirationTime() {
        return expirationTime;
    }

    public void setExpirationTime(Date expirationTime) {
        this.expirationTime = expirationTime;
    }

    public String getInstructions() {
        return instructions;
    }

    public void setInstructions(String instructions) {
        this.instructions = instructions;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getCouponInUse() {
        return couponInUse;
    }

    public void setCouponInUse(String couponInUse) {
        this.couponInUse = couponInUse;
    }

    public String getEffectiveTimeType() {
        return effectiveTimeType;
    }

    public void setEffectiveTimeType(String effectiveTimeType) {
        this.effectiveTimeType = effectiveTimeType;
    }

    @Override
    public String toString() {
        return "TbCouponPO{" +
                "couponId='" + couponId + '\'' +
                ", mechantId='" + mechantId + '\'' +
                ", merchantName='" + merchantName + '\'' +
                ", couponTotalNum='" + couponTotalNum + '\'' +
                ", couponSku='" + couponSku + '\'' +
                ", couponStatus='" + couponStatus + '\'' +
                ", couponName='" + couponName + '\'' +
                ", discountType='" + discountType + '\'' +
                ", discountAmount='" + discountAmount + '\'' +
                ", minDiscountAmount='" + minDiscountAmount + '\'' +
                ", maxDiscountAmount='" + maxDiscountAmount + '\'' +
                ", discount='" + discount + '\'' +
                ", isUseLimit='" + isUseLimit + '\'' +
                ", limitAmount='" + limitAmount + '\'' +
                ", isNumerLimit='" + isNumerLimit + '\'' +
                ", limitNumber='" + limitNumber + '\'' +
                ", effectiveTimeType='" + effectiveTimeType + '\'' +
                ", effectiveTime=" + effectiveTime +
                ", expirationTime=" + expirationTime +
                ", instructions='" + instructions + '\'' +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                ", remark='" + remark + '\'' +
                ", couponInUse='" + couponInUse + '\'' +
                '}';
    }
}
