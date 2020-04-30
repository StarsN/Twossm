package com.gx.portal.item.domain;

public class ItemPO {

    private java.lang.String merchandiseCode;

    private java.lang.String merchandiseName;

    private java.lang.String merchantCode;

    private java.lang.String modelId;

    private java.lang.String salePrice;

    private java.lang.String shortDesc;

    private java.lang.String detailDesc;

    private java.lang.String status;

    private java.lang.String createTime;

    private java.lang.String lastModifyTime;

    private java.lang.String imagePath;

    private java.lang.String publishAddress;

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

    public String getMerchantCode() {
        return merchantCode;
    }

    public void setMerchantCode(String merchantCode) {
        this.merchantCode = merchantCode;
    }

    public String getModelId() {
        return modelId;
    }

    public void setModelId(String modelId) {
        this.modelId = modelId;
    }

    public String getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(String salePrice) {
        this.salePrice = salePrice;
    }

    public String getShortDesc() {
        return shortDesc;
    }

    public void setShortDesc(String shortDesc) {
        this.shortDesc = shortDesc;
    }

    public String getDetailDesc() {
        return detailDesc;
    }

    public void setDetailDesc(String detailDesc) {
        this.detailDesc = detailDesc;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getLastModifyTime() {
        return lastModifyTime;
    }

    public void setLastModifyTime(String lastModifyTime) {
        this.lastModifyTime = lastModifyTime;
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

    @Override
    public String toString() {
        return "ItemPO{" +
                "merchandiseCode='" + merchandiseCode + '\'' +
                ", merchandiseName='" + merchandiseName + '\'' +
                ", merchantCode='" + merchantCode + '\'' +
                ", modelId='" + modelId + '\'' +
                ", salePrice='" + salePrice + '\'' +
                ", shortDesc='" + shortDesc + '\'' +
                ", detailDesc='" + detailDesc + '\'' +
                ", status='" + status + '\'' +
                ", createTime='" + createTime + '\'' +
                ", lastModifyTime='" + lastModifyTime + '\'' +
                ", imagePath='" + imagePath + '\'' +
                ", publishAddress='" + publishAddress + '\'' +
                '}';
    }
}
