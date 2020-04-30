package com.gx.order.domain;

import java.io.Serializable;
import java.util.Date;

public class TbOrderItemPO implements Serializable {
    //订单项id
    private String orderItemId;
    //订单Id
    private String orderId;
    //商品code
    private String merchandiseCode;
    //商品名称
    private String merchandiseName;
    //单价格
    private String cashPrice;
    //购买数量
    private String buyNum;
    //订单项总额
    private String subTotal;
    //生成时间
    private Date generateTime;
    //订单项状态
    private String orderItemStatus;
    //订单项状态描述
    private String orderItemStatusDesc;
    //库存id
    private String stockId;

    public String getOrderItemId() {
        return orderItemId;
    }

    public void setOrderItemId(String orderItemId) {
        this.orderItemId = orderItemId;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getMerchandiseCode() {
        return merchandiseCode;
    }

    public void setMerchandiseCode(String merchandiseCode) {
        this.merchandiseCode = merchandiseCode;
    }

    public String getMerchandiseName() {
        return merchandiseName;
    }

    public void setMerchandiseName(String merchandiseName) {
        this.merchandiseName = merchandiseName;
    }

    public String getCashPrice() {
        return cashPrice;
    }

    public void setCashPrice(String cashPrice) {
        this.cashPrice = cashPrice;
    }

    public String getBuyNum() {
        return buyNum;
    }

    public void setBuyNum(String buyNum) {
        this.buyNum = buyNum;
    }

    public String getSubTotal() {
        return subTotal;
    }

    public void setSubTotal(String subTotal) {
        this.subTotal = subTotal;
    }

    public Date getGenerateTime() {
        return generateTime;
    }

    public void setGenerateTime(Date generateTime) {
        this.generateTime = generateTime;
    }

    public String getOrderItemStatus() {
        return orderItemStatus;
    }

    public void setOrderItemStatus(String orderItemStatus) {
        this.orderItemStatus = orderItemStatus;
    }

    public String getStockId() {
        return stockId;
    }

    public void setStockId(String stockId) {
        this.stockId = stockId;
    }

    public String getOrderItemStatusDesc() {
        return orderItemStatusDesc;
    }

    public void setOrderItemStatusDesc(String orderItemStatusDesc) {
        this.orderItemStatusDesc = orderItemStatusDesc;
    }

    @Override
    public String toString() {
        return "TbOrderItemPO{" +
                "orderItemId='" + orderItemId + '\'' +
                ", orderId='" + orderId + '\'' +
                ", merchandiseCode='" + merchandiseCode + '\'' +
                ", merchandiseName='" + merchandiseName + '\'' +
                ", cashPrice='" + cashPrice + '\'' +
                ", buyNum='" + buyNum + '\'' +
                ", subTotal='" + subTotal + '\'' +
                ", generateTime=" + generateTime +
                ", orderItemStatus='" + orderItemStatus + '\'' +
                ", orderItemStatusDesc='" + orderItemStatusDesc + '\'' +
                ", stockId='" + stockId + '\'' +
                '}';
    }
}
