package com.gx.merchant.domain;

import java.util.Date;

/**
 * @author admin
 */
public class TbMerchantPO {
    private String merchantId;
    private String merchantName;
    private String merchantCode;
    private String status;
    private String contactPhone;
    private String contactPerson;
    private String merchantAddr;
    private Date createTime;
    private Date lastUpdateTime;
    private String merchantDesc;
    private String publishAddress;
    private String contactQQ;

    public String getMerchantId() {
        return merchantId;
    }

    public void setMerchantId(String merchantId) {
        this.merchantId = merchantId;
    }

    public String getMerchantName() {
        return merchantName;
    }

    public void setMerchantName(String merchantName) {
        this.merchantName = merchantName;
    }

    public String getMerchantCode() {
        return merchantCode;
    }

    public void setMerchantCode(String merchantCode) {
        this.merchantCode = merchantCode;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getContactPhone() {
        return contactPhone;
    }

    public void setContactPhone(String contactPhone) {
        this.contactPhone = contactPhone;
    }

    public String getContactPerson() {
        return contactPerson;
    }

    public void setContactPerson(String contactPerson) {
        this.contactPerson = contactPerson;
    }

    public String getMerchantAddr() {
        return merchantAddr;
    }

    public void setMerchantAddr(String merchantAddr) {
        this.merchantAddr = merchantAddr;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getLastUpdateTime() {
        return lastUpdateTime;
    }

    public void setLastUpdateTime(Date lastUpdateTime) {
        this.lastUpdateTime = lastUpdateTime;
    }

    public String getMerchantDesc() {
        return merchantDesc;
    }

    public void setMerchantDesc(String merchantDesc) {
        this.merchantDesc = merchantDesc;
    }

    public String getPublishAddress() {
        return publishAddress;
    }

    public void setPublishAddress(String publishAddress) {
        this.publishAddress = publishAddress;
    }

    public String getContactQQ() {
        return contactQQ;
    }

    public void setContactQQ(String contactQQ) {
        this.contactQQ = contactQQ;
    }

    @Override
    public String toString() {
        return "TbMerchantPO{" +
                "merchantId='" + merchantId + '\'' +
                ", merchantName='" + merchantName + '\'' +
                ", merchantCode='" + merchantCode + '\'' +
                ", status='" + status + '\'' +
                ", contactPhone='" + contactPhone + '\'' +
                ", contactPerson='" + contactPerson + '\'' +
                ", merchantAddr='" + merchantAddr + '\'' +
                ", createTime=" + createTime +
                ", lastUpdateTime=" + lastUpdateTime +
                ", merchantDesc='" + merchantDesc + '\'' +
                ", publishAddress='" + publishAddress + '\'' +
                ", contactQQ='" + contactQQ + '\'' +
                '}';
    }
}
