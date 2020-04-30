package com.gx.order.domain;

import java.util.Date;

public class TbOrderInfoPO {
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
    private Date payTime;
    //确认收货时间
    private Date endTime;
    //新增  给商家留言
    private String  memberMsg;
    //新增 生成订单时间
    private Date generateTime;
    //订单更新时间
    private Date updateTime;
    //订单发货时间
    private Date sendTime;
    //成交时间
    private Date completeTime;
    //新增 优惠之后的价格
    private String cashAmount;
    //订单总金额
    private String totalAmount;
    //新增 优惠券优惠金额
    private String discountAmount;
    //新增 发票抬头金额
    private String invoiceAmount;
    //订单的配送类型
    private String orderSupplyType;
    //预约自提上门时间
    private Date appointmentTime;

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

    public Date getPayTime() {
        return payTime;
    }

    public void setPayTime(Date payTime) {
        this.payTime = payTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Date getGenerateTime() {
        return generateTime;
    }

    public void setGenerateTime(Date generateTime) {
        this.generateTime = generateTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Date getSendTime() {
        return sendTime;
    }

    public void setSendTime(Date sendTime) {
        this.sendTime = sendTime;
    }

    public Date getCompleteTime() {
        return completeTime;
    }

    public void setCompleteTime(Date completeTime) {
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

    public String getOrderSupplyType() {
        return orderSupplyType;
    }

    public void setOrderSupplyType(String orderSupplyType) {
        this.orderSupplyType = orderSupplyType;
    }

    public Date getAppointmentTime() {
        return appointmentTime;
    }

    public void setAppointmentTime(Date appointmentTime) {
        this.appointmentTime = appointmentTime;
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
        return "TbOrderInfoPO{" +
                "orderId='" + orderId + '\'' +
                ", memberId='" + memberId + '\'' +
                ", merchantId='" + merchantId + '\'' +
                ", orderStatus='" + orderStatus + '\'' +
                ", orderStatusDesc='" + orderStatusDesc + '\'' +
                ", payStatus='" + payStatus + '\'' +
                ", payId='" + payId + '\'' +
                ", payStatusDesc='" + payStatusDesc + '\'' +
                ", payTime=" + payTime +
                ", endTime=" + endTime +
                ", memberMsg='" + memberMsg + '\'' +
                ", generateTime=" + generateTime +
                ", updateTime=" + updateTime +
                ", sendTime=" + sendTime +
                ", completeTime=" + completeTime +
                ", cashAmount='" + cashAmount + '\'' +
                ", totalAmount='" + totalAmount + '\'' +
                ", discountAmount='" + discountAmount + '\'' +
                ", invoiceAmount='" + invoiceAmount + '\'' +
                ", orderSupplyType='" + orderSupplyType + '\'' +
                ", appointmentTime=" + appointmentTime +
                '}';
    }
}
