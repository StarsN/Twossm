package com.gx.order.domain;

import cn.com.do1.common.annotation.bean.FormatMask;

import java.util.Date;

public class TbOrderItemVO {
    //订单项VO
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
    @FormatMask(type = "date", value = "yyyy-MM-dd HH:mm:ss")
    private String generateTime;
    //订单项状态
    private String orderItemStatus;
    //订单状态描述
    private String orderItemStatusDesc;
    //商品VO

    //商品库存表
    //库存id
    private String stockId;
    private String stock;
    @FormatMask(type = "date", value = "yyyy-MM-dd HH:mm:ss")
    private String updateTime;
    private String updateBy;

    //商品图片信息表
    private String imgId;
    private String imagePath;
    private String type;
    private String idx;

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

    public String getGenerateTime() {
        return generateTime;
    }

    public void setGenerateTime(String generateTime) {
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

    public String getStock() {
        return stock;
    }

    public void setStock(String stock) {
        this.stock = stock;
    }

    public String getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }

    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    public String getImgId() {
        return imgId;
    }

    public void setImgId(String imgId) {
        this.imgId = imgId;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getIdx() {
        return idx;
    }

    public void setIdx(String idx) {
        this.idx = idx;
    }

    @Override
    public String toString() {
        return "TbOrderItemVO{" +
                "orderItemId='" + orderItemId + '\'' +
                ", orderId='" + orderId + '\'' +
                ", merchandiseCode='" + merchandiseCode + '\'' +
                ", merchandiseName='" + merchandiseName + '\'' +
                ", cashPrice='" + cashPrice + '\'' +
                ", buyNum='" + buyNum + '\'' +
                ", subTotal='" + subTotal + '\'' +
                ", generateTime='" + generateTime + '\'' +
                ", orderItemStatus='" + orderItemStatus + '\'' +
                ", stockId='" + stockId + '\'' +
                '}';
    }
}
