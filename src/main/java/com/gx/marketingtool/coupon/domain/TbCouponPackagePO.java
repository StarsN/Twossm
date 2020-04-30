package com.gx.marketingtool.coupon.domain;

import java.io.Serializable;
import java.util.Date;

public class TbCouponPackagePO implements Serializable {
    private java.lang.String couponPackageId;
    private java.lang.String couponId;
    private String orderId;
    private java.lang.String couponName;
    private java.lang.String mechantId;
    private java.lang.String merchantName;
    private java.lang.String memberId;
    private java.lang.String couponUseStatus;
    private java.util.Date receiveTime;
    private java.lang.String remark;
    private java.util.Date endTime;
    private java.util.Date startTime;
    private java.util.Date useTime;
    private java.lang.String valueDesc;
    private java.lang.String useLimitDesc;
    private java.lang.String nickName;

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

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
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

    public String getCouponUseStatus() {
        return couponUseStatus;
    }

    public void setCouponUseStatus(String couponUseStatus) {
        this.couponUseStatus = couponUseStatus;
    }

    public Date getReceiveTime() {
        return receiveTime;
    }

    public void setReceiveTime(Date receiveTime) {
        this.receiveTime = receiveTime;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getUseTime() {
        return useTime;
    }

    public void setUseTime(Date useTime) {
        this.useTime = useTime;
    }

    public String getValueDesc() {
        return valueDesc;
    }

    public void setValueDesc(String valueDesc) {
        this.valueDesc = valueDesc;
    }

    public String getUseLimitDesc() {
        return useLimitDesc;
    }

    public void setUseLimitDesc(String useLimitDesc) {
        this.useLimitDesc = useLimitDesc;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    @Override
    public String toString() {
        return "TbCouponPackagePO{" +
                "couponPackageId='" + couponPackageId + '\'' +
                ", couponId='" + couponId + '\'' +
                ", orderId='" + orderId + '\'' +
                ", couponName='" + couponName + '\'' +
                ", mechantId='" + mechantId + '\'' +
                ", merchantName='" + merchantName + '\'' +
                ", memberId='" + memberId + '\'' +
                ", couponUseStatus='" + couponUseStatus + '\'' +
                ", receiveTime=" + receiveTime +
                ", remark='" + remark + '\'' +
                ", endTime=" + endTime +
                ", startTime=" + startTime +
                ", useTime=" + useTime +
                ", valueDesc='" + valueDesc + '\'' +
                ", useLimitDesc='" + useLimitDesc + '\'' +
                ", nickName='" + nickName + '\'' +
                '}';
    }
}
