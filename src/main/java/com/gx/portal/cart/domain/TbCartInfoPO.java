package com.gx.portal.cart.domain;

import java.util.Date;

public class TbCartInfoPO {
    private String cartId;
    private String merchandiseCode;
    private String memberId;
    private String merchantId;
    private String buyNum;
    private String isExpire;
    private Date createTime;
    private String stockId;

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

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getStockId() {
        return stockId;
    }

    public void setStockId(String stockId) {
        this.stockId = stockId;
    }

    public String getMerchantId() {
        return merchantId;
    }

    public void setMerchantId(String merchantId) {
        this.merchantId = merchantId;
    }

    @Override
    public String toString() {
        return "TbCartInfoPO{" +
                "cartId='" + cartId + '\'' +
                ", merchandiseCode='" + merchandiseCode + '\'' +
                ", memberId='" + memberId + '\'' +
                ", merchantId='" + merchantId + '\'' +
                ", buyNum='" + buyNum + '\'' +
                ", isExpire='" + isExpire + '\'' +
                ", createTime=" + createTime +
                ", stockId='" + stockId + '\'' +
                '}';
    }
}
