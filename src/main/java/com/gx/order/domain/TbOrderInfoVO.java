package com.gx.order.domain;

import cn.com.do1.common.annotation.bean.FormatMask;

import java.util.Date;

public class TbOrderInfoVO {
    private String orderId;
    private String memberId;
    private String merchantId;
    //订单状态 0-买家取消1-待付款 2-代发货 3-代收货 4-待定 5-退款处理中 6-已退款7-超时关闭8-已退货 9-买家已收货 10-已完成 11-订单异常
    private String orderStatus;
    //订单状态描述
    private String orderStatusDesc;
    //支付状态 0-已取消 1-待付款 2-付款成功 3-退款成功 4-待退款 5-退款失败 6-支付中 7-等待支付认证 8-分期支付成功
    private String payStatus;
    //已经支付，有编号
    private String payId;
    //支付订单状态描述
    private String payStatusDesc;
    //支付时间
    @FormatMask(type = "date", value = "yyyy-MM-dd HH:mm:ss")
    private String payTime;
    //确认收货时间
    @FormatMask(type = "date", value = "yyyy-MM-dd HH:mm:ss")
    private String endTime;
    //新增  给商家留言
    private String  memberMsg;
    //新增 生成订单时间
    @FormatMask(type = "date", value = "yyyy-MM-dd HH:mm:ss")
    private String generateTime;
    //订单更新时间
    @FormatMask(type = "date", value = "yyyy-MM-dd HH:mm:ss")
    private String updateTime;
    //订单发货时间
    @FormatMask(type = "date", value = "yyyy-MM-dd HH:mm:ss")
    private String sendTime;
    //成交时间
    @FormatMask(type = "date", value = "yyyy-MM-dd HH:mm:ss")
    private String completeTime;
    //新增 优惠之后的价格
    private String cashAmount;
    //订单总金额
    private String totalAmount;
    //新增 优惠券优惠金额
    private String discountAmount;
    //新增 发票抬头金额
    private String invoiceAmount;
    //商家名称
    private String merchantName;//商家名称

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getMemberId() {
        return memberId;
    }

    public void setMemberId(String memberId) {
        this.memberId = memberId;
    }

    public String getMerchantId() {
        return merchantId;
    }

    public void setMerchantId(String merchantId) {
        this.merchantId = merchantId;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public String getPayStatus() {
        return payStatus;
    }

    public void setPayStatus(String payStatus) {
        this.payStatus = payStatus;
    }

    public String getPayTime() {
        return payTime;
    }

    public void setPayTime(String payTime) {
        this.payTime = payTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getGenerateTime() {
        return generateTime;
    }

    public void setGenerateTime(String generateTime) {
        this.generateTime = generateTime;
    }

    public String getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }

    public String getSendTime() {
        return sendTime;
    }

    public void setSendTime(String sendTime) {
        this.sendTime = sendTime;
    }

    public String getCompleteTime() {
        return completeTime;
    }

    public void setCompleteTime(String completeTime) {
        this.completeTime = completeTime;
    }

    public String getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(String totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getMemberMsg() {
        return memberMsg;
    }

    public void setMemberMsg(String memberMsg) {
        this.memberMsg = memberMsg;
    }

    public String getCashAmount() {
        return cashAmount;
    }

    public void setCashAmount(String cashAmount) {
        this.cashAmount = cashAmount;
    }

    public String getDiscountAmount() {
        return discountAmount;
    }

    public void setDiscountAmount(String discountAmount) {
        this.discountAmount = discountAmount;
    }

    public String getInvoiceAmount() {
        return invoiceAmount;
    }

    public void setInvoiceAmount(String invoiceAmount) {
        this.invoiceAmount = invoiceAmount;
    }

    public String getMerchantName() {
        return merchantName;
    }

    public void setMerchantName(String merchantName) {
        this.merchantName = merchantName;
    }

    public String getOrderStatusDesc() {
        return orderStatusDesc;
    }

    public void setOrderStatusDesc(String orderStatusDesc) {
        this.orderStatusDesc = orderStatusDesc;
    }

    public String getPayStatusDesc() {
        return payStatusDesc;
    }

    public void setPayStatusDesc(String payStatusDesc) {
        this.payStatusDesc = payStatusDesc;
    }

    public String getPayId() {
        return payId;
    }

    public void setPayId(String payId) {
        this.payId = payId;
    }

    @Override
    public String toString() {
        return "TbOrderInfoVO{" +
                "orderId='" + orderId + '\'' +
                ", memberId='" + memberId + '\'' +
                ", merchantId='" + merchantId + '\'' +
                ", orderStatus='" + orderStatus + '\'' +
                ", orderStatusDesc='" + orderStatusDesc + '\'' +
                ", payStatus='" + payStatus + '\'' +
                ", payId='" + payId + '\'' +
                ", payStatusDesc='" + payStatusDesc + '\'' +
                ", payTime='" + payTime + '\'' +
                ", endTime='" + endTime + '\'' +
                ", memberMsg='" + memberMsg + '\'' +
                ", generateTime='" + generateTime + '\'' +
                ", updateTime='" + updateTime + '\'' +
                ", sendTime='" + sendTime + '\'' +
                ", completeTime='" + completeTime + '\'' +
                ", cashAmount='" + cashAmount + '\'' +
                ", totalAmount='" + totalAmount + '\'' +
                ", discountAmount='" + discountAmount + '\'' +
                ", invoiceAmount='" + invoiceAmount + '\'' +
                ", merchantName='" + merchantName + '\'' +
                '}';
    }
}
