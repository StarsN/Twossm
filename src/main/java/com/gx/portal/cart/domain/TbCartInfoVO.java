package com.gx.portal.cart.domain;

import cn.com.do1.common.annotation.bean.FormatMask;

import java.util.Date;

public class TbCartInfoVO {
    private String cartId;
    private String merchandiseCode;
    private String memberId;
    private String merchantId;
    private String merchandiseName;
    private String cashPrice;
    private String buyNum;
    private String isExpire;
    @FormatMask(type = "date", value = "yyyy-MM-dd HH:mm:ss")
    private String createTime;
//    private String attributeDesc;
//    private java.lang.String remark;
    private String stockId;
    private String imagePath;
    private String publishAddress;
    private String itemStatus;

    public String getCartId() {
        return cartId;
    }

    public void setCartId(String cartId) {
        this.cartId = cartId;
    }

    public String getMerchandiseCode() {
        return merchandiseCode;
    }

    public void setMerchandiseCode(String merchandiseCode) {
        this.merchandiseCode = merchandiseCode;
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

    public String getIsExpire() {
        return isExpire;
    }

    public void setIsExpire(String isExpire) {
        this.isExpire = isExpire;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getStockId() {
        return stockId;
    }

    public void setStockId(String stockId) {
        this.stockId = stockId;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public String getPublishAddress() {
        return publishAddress;
    }

    public void setPublishAddress(String publishAddress) {
        this.publishAddress = publishAddress;
    }

    public String getItemStatus() {
        return itemStatus;
    }

    public void setItemStatus(String itemStatus) {
        this.itemStatus = itemStatus;
    }

    @Override
    public String toString() {
        return "TbCartInfoVO{" +
                "cartId='" + cartId + '\'' +
                ", merchandiseCode='" + merchandiseCode + '\'' +
                ", memberId='" + memberId + '\'' +
                ", merchantId='" + merchantId + '\'' +
                ", merchandiseName='" + merchandiseName + '\'' +
                ", cashPrice='" + cashPrice + '\'' +
                ", buyNum='" + buyNum + '\'' +
                ", isExpire='" + isExpire + '\'' +
                ", createTime=" + createTime +
                ", stockId='" + stockId + '\'' +
                ", imagePath='" + imagePath + '\'' +
                ", publishAddress='" + publishAddress + '\'' +
                ", itemStatus='" + itemStatus + '\'' +
                '}';
    }
}
