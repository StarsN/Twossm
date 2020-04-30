package com.gx.merchandise.domain;

import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * @author admin
 */
public class TbMerchandiseInfoPO implements Serializable {
    private String merchandiseCode;
    private String merchandiseName;
    private String merchantCode;
    private String brandId;
    private String modelId;
    private String salePrice;
    private String shortDesc;
    private String totalStock;
    //商品状态0-草稿1-上架2-下架3-发布
    private String status;
    private String publishAddress;
    private String detailDesc;
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date createTime;
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date lastModifyTime;

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getLastModifyTime() {
        return lastModifyTime;
    }

    public void setLastModifyTime(Date lastModifyTime) {
        this.lastModifyTime = lastModifyTime;
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

    public String getMerchantCode() {
        return merchantCode;
    }

    public void setMerchantCode(String merchantCode) {
        this.merchantCode = merchantCode;
    }

    public String getBrandId() {
        return brandId;
    }

    public void setBrandId(String brandId) {
        this.brandId = brandId;
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

    public String getTotalStock() {
        return totalStock;
    }

    public void setTotalStock(String totalStock) {
        this.totalStock = totalStock;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPublishAddress() {
        return publishAddress;
    }

    public void setPublishAddress(String publishAddress) {
        this.publishAddress = publishAddress;
    }

    public String getDetailDesc() {
        return detailDesc;
    }

    public void setDetailDesc(String detailDesc) {
        this.detailDesc = detailDesc;
    }

    @Override
    public String toString() {
        return "TbMerchandiseInfoPO{" +
                "merchandiseCode='" + merchandiseCode + '\'' +
                ", merchandiseName='" + merchandiseName + '\'' +
                ", merchantCode='" + merchantCode + '\'' +
                ", brandId='" + brandId + '\'' +
                ", modelId='" + modelId + '\'' +
                ", salePrice='" + salePrice + '\'' +
                ", shortDesc='" + shortDesc + '\'' +
                ", totalStock='" + totalStock + '\'' +
                ", status='" + status + '\'' +
                ", publishAddress='" + publishAddress + '\'' +
                ", detailDesc='" + detailDesc + '\'' +
                ", createTime=" + createTime +
                ", lastModifyTime=" + lastModifyTime +
                '}';
    }
}
