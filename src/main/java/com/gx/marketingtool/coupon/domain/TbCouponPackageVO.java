package com.gx.marketingtool.coupon.domain;

import cn.com.do1.common.annotation.bean.FormatMask;

public class TbCouponPackageVO {
    private java.lang.String couponPackageId;
    private java.lang.String couponId;
    private java.lang.String couponName;
    private java.lang.String mechantId;
    private java.lang.String merchantName;
    private java.lang.String memberId;
    private java.lang.String orderId;
    private java.lang.String couponUseStatus;
    private String couponUseStatusDesc;
    @FormatMask(type = "date", value = "yyyy-MM-dd HH:mm")
    private java.lang.String receiveTime;
    private java.lang.String remark;
    private java.lang.String randomValue;
    @FormatMask(type = "date", value = "yyyy-MM-dd HH:mm")
    private java.lang.String endTime;
    @FormatMask(type = "date", value = "yyyy-MM-dd HH:mm")
    private java.lang.String startTime;
    @FormatMask(type = "date", value = "yyyy-MM-dd HH:mm")
    private java.lang.String useTime;
    //冗余字段,减少查询
    private java.lang.String discountType;
    private java.lang.String discountAmount;
    private java.lang.String discount;
    private java.lang.String isUseLimit;
    private java.lang.String limitAmount;
    //生成订单时是否可用
    private java.lang.String isUseable;
    //生成该订单省多少钱
    private java.lang.String saveMoney;
    private java.lang.String instructions;
    private java.lang.String value;
    private java.lang.String nickName;
    private String phoneNumber;

    public String getCouponPackageId() {
        return couponPackageId;
    }

    public void setCouponPackageId(String couponPackageId) {
        this.couponPackageId = couponPackageId;
    }

    public String getCouponId() {
        return couponId;
    }

    public void setCouponId(String couponId) {
        this.couponId = couponId;
    }

    public String getCouponName() {
        return couponName;
    }

    public void setCouponName(String couponName) {
        this.couponName = couponName;
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

    public String getMemberId() {
        return memberId;
    }

    public void setMemberId(String memberId) {
        this.memberId = memberId;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getCouponUseStatus() {
        return couponUseStatus;
    }

    public void setCouponUseStatus(String couponUseStatus) {
        this.couponUseStatus = couponUseStatus;
    }

    public String getCouponUseStatusDesc() {
        return couponUseStatusDesc;
    }

    public void setCouponUseStatusDesc(String couponUseStatusDesc) {
        this.couponUseStatusDesc = couponUseStatusDesc;
    }

    public String getReceiveTime() {
        return receiveTime;
    }

    public void setReceiveTime(String receiveTime) {
        this.receiveTime = receiveTime;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getRandomValue() {
        return randomValue;
    }

    public void setRandomValue(String randomValue) {
        this.randomValue = randomValue;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getUseTime() {
        return useTime;
    }

    public void setUseTime(String useTime) {
        this.useTime = useTime;
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

    public String getIsUseable() {
        return isUseable;
    }

    public void setIsUseable(String isUseable) {
        this.isUseable = isUseable;
    }

    public String getSaveMoney() {
        return saveMoney;
    }

    public void setSaveMoney(String saveMoney) {
        this.saveMoney = saveMoney;
    }

    public String getInstructions() {
        return instructions;
    }

    public void setInstructions(String instructions) {
        this.instructions = instructions;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    @Override
    public String toString() {
        return "TbCouponPackageVO{" +
                "couponPackageId='" + couponPackageId + '\'' +
                ", couponId='" + couponId + '\'' +
                ", couponName='" + couponName + '\'' +
                ", mechantId='" + mechantId + '\'' +
                ", merchantName='" + merchantName + '\'' +
                ", memberId='" + memberId + '\'' +
                ", orderId='" + orderId + '\'' +
                ", couponUseStatus='" + couponUseStatus + '\'' +
                ", couponUseStatusDesc='" + couponUseStatusDesc + '\'' +
                ", receiveTime='" + receiveTime + '\'' +
                ", remark='" + remark + '\'' +
                ", randomValue='" + randomValue + '\'' +
                ", endTime='" + endTime + '\'' +
                ", startTime='" + startTime + '\'' +
                ", useTime='" + useTime + '\'' +
                ", discountType='" + discountType + '\'' +
                ", discountAmount='" + discountAmount + '\'' +
                ", discount='" + discount + '\'' +
                ", isUseLimit='" + isUseLimit + '\'' +
                ", limitAmount='" + limitAmount + '\'' +
                ", isUseable='" + isUseable + '\'' +
                ", saveMoney='" + saveMoney + '\'' +
                ", instructions='" + instructions + '\'' +
                ", value='" + value + '\'' +
                ", nickName='" + nickName + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                '}';
    }
}
