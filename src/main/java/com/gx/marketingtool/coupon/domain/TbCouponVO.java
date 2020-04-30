package com.gx.marketingtool.coupon.domain;

import cn.com.do1.common.annotation.bean.FormatMask;
import com.gx.util.SysConstant;

public class TbCouponVO {
    private java.lang.String couponId;
    private java.lang.String mechantId;
    private java.lang.String merchantName;
    private java.lang.String couponTotalNum;
    private java.lang.String couponSku;
    //已使用张数
    private java.lang.String couponInUse;
    private java.lang.String couponStatus;
    private java.lang.String couponStatusDesc;
    private java.lang.String couponName;
    private java.lang.String discountType;
    private java.lang.String discountAmount;
    private java.lang.String minDiscountAmount;
    private java.lang.String maxDiscountAmount;
    private java.lang.String discount;
    //使用门槛，0不限制，1限制满减
    private java.lang.String isUseLimit;
    private java.lang.String limitAmount;
    private java.lang.String isNumerLimit;
    private java.lang.String limitNumber;
    //生效时间的类型 0-***至*** 1-当天起几天内有效 2-次日次几天内有效
    private java.lang.String effectiveTimeType;
    @FormatMask(type = "date", value = "yyyy-MM-dd HH:mm:ss")
    private java.lang.String effectiveTime;
    @FormatMask(type = "date", value = "yyyy-MM-dd HH:mm:ss")
    private java.lang.String expirationTime;
    private java.lang.String instructions;
    private java.lang.String createTime;
    private java.lang.String updateTime;
    private java.lang.String remark;
    private java.lang.String effectiveTimedesc;//有效期描述
    private java.lang.String value;//价值
    private java.lang.String numerLimitDesc;//领取限制
    private java.lang.String couponNumAndSku;//库存/总量
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

    public String getCouponInUse() {
        return couponInUse;
    }

    public void setCouponInUse(String couponInUse) {
        this.couponInUse = couponInUse;
    }

    public String getCouponStatus() {
        return couponStatus;
    }

    public void setCouponStatus(String couponStatus) {
        this.couponStatus = couponStatus;
    }

    public String getCouponStatusDesc() {
        return couponStatusDesc;
    }

    public void setCouponStatusDesc(String couponStatusDesc) {
        this.couponStatusDesc = couponStatusDesc;
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

    public String getEffectiveTime() {
        return effectiveTime;
    }

    public void setEffectiveTime(String effectiveTime) {
        this.effectiveTime = effectiveTime;
    }

    public String getExpirationTime() {
        return expirationTime;
    }

    public void setExpirationTime(String expirationTime) {
        this.expirationTime = expirationTime;
    }

    public String getInstructions() {
        return instructions;
    }

    public void setInstructions(String instructions) {
        this.instructions = instructions;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getEffectiveTimedesc() {
        return effectiveTimedesc;
    }

    public void setEffectiveTimedesc(String effectiveTimedesc) {
        this.effectiveTimedesc = effectiveTimedesc;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getNumerLimitDesc() {
        return numerLimitDesc;
    }

    public void setNumerLimitDesc(String numerLimitDesc) {
        this.numerLimitDesc = numerLimitDesc;
    }

    public String getCouponNumAndSku() {
        return couponNumAndSku;
    }

    public String getEffectiveTimeType() {
        return effectiveTimeType;
    }

    public void setEffectiveTimeType(String effectiveTimeType) {
        this.effectiveTimeType = effectiveTimeType;
    }

    //设置有效期描述
    public void setEffectiveTimedescByEffectiveTimeType(java.lang.String effectiveTimeType) {
        //时间段有效期
        if((SysConstant.couponStatus.EFFECTIVE_TIME_TYPE_TIME+"").equals(effectiveTimeType)){
            System.out.println(1);
            this.effectiveTimedesc = this.effectiveTime+"至"+expirationTime;
            return;
        }
    }
    //设置优惠券价值
    public void setValueByDiscountType(java.lang.String discountType) {
        //固定面额
        if((SysConstant.couponStatus.DISCOUNT_TYPE_STATIC+"").equals(discountType)){
            this.value = this.discountAmount;
        }
    }
    //设置是否与领取显示描述
    public void setNumerLimitDescByIsNumerLimit(java.lang.String isNumerLimit) {
        System.out.println("isNumerLimit"+isNumerLimit);
        //不限制
        if((SysConstant.couponStatus.IS_NUMER_LIMIT_NO+"").equals(isNumerLimit)){
            System.out.println(1);
            this.numerLimitDesc = "不限张数";
            return;
        }
        //每人限领
        if((SysConstant.couponStatus.IS_NUMER_LIMIT_YES+"").equals(isNumerLimit)){
            System.out.println(2);
            this.numerLimitDesc="一人"+this.limitNumber+"张";
        }
    }
    //设置库存、总发放量
    public void setCouponNumAndSku(java.lang.String couponTotalNum,java.lang.String couponSku) {
        this.couponNumAndSku = couponSku+"/"+couponTotalNum;
    }
    @Override
    public String toString() {
        return "TbCouponVO{" +
                "couponId='" + couponId + '\'' +
                ", mechantId='" + mechantId + '\'' +
                ", merchantName='" + merchantName + '\'' +
                ", couponTotalNum='" + couponTotalNum + '\'' +
                ", couponSku='" + couponSku + '\'' +
                ", couponInUse='" + couponInUse + '\'' +
                ", couponStatus='" + couponStatus + '\'' +
                ", couponStatusDesc='" + couponStatusDesc + '\'' +
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
                ", effectiveTime='" + effectiveTime + '\'' +
                ", expirationTime='" + expirationTime + '\'' +
                ", instructions='" + instructions + '\'' +
                ", createTime='" + createTime + '\'' +
                ", updateTime='" + updateTime + '\'' +
                ", remark='" + remark + '\'' +
                ", effectiveTimedesc='" + effectiveTimedesc + '\'' +
                ", value='" + value + '\'' +
                ", numerLimitDesc='" + numerLimitDesc + '\'' +
                ", couponNumAndSku='" + couponNumAndSku + '\'' +
                '}';
    }
}
