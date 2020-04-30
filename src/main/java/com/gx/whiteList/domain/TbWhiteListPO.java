package com.gx.whiteList.domain;

import java.io.Serializable;
import java.util.Date;

/**
 * @author admin
 */
public class TbWhiteListPO implements Serializable {
    private String whiteListId;
    private String whiteListName;
    private String whiteListDesc;
    private String whiteListTips;
    private Date createTime;
    private Date updateTime;
    private String whiteListMember;
    private String merchantId;
    private String merchantName;
    private String fileName;
    private String memberNum;
    private String createdBy;
    private String updateBy;

    public String getWhiteListId() {
        return whiteListId;
    }

    public void setWhiteListId(String whiteListId) {
        this.whiteListId = whiteListId;
    }

    public String getWhiteListName() {
        return whiteListName;
    }

    public void setWhiteListName(String whiteListName) {
        this.whiteListName = whiteListName;
    }

    public String getWhiteListDesc() {
        return whiteListDesc;
    }

    public void setWhiteListDesc(String whiteListDesc) {
        this.whiteListDesc = whiteListDesc;
    }

    public String getWhiteListTips() {
        return whiteListTips;
    }

    public void setWhiteListTips(String whiteListTips) {
        this.whiteListTips = whiteListTips;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getWhiteListMember() {
        return whiteListMember;
    }

    public void setWhiteListMember(String whiteListMember) {
        this.whiteListMember = whiteListMember;
    }

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

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getMemberNum() {
        return memberNum;
    }

    public void setMemberNum(String memberNum) {
        this.memberNum = memberNum;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    @Override
    public String toString() {
        return "TbWhiteListPO{" +
                "whiteListId='" + whiteListId + '\'' +
                ", whiteListName='" + whiteListName + '\'' +
                ", whiteListDesc='" + whiteListDesc + '\'' +
                ", whiteListTips='" + whiteListTips + '\'' +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                ", whiteListMember='" + whiteListMember + '\'' +
                ", merchantId='" + merchantId + '\'' +
                ", merchantName='" + merchantName + '\'' +
                ", fileName='" + fileName + '\'' +
                ", memberNum='" + memberNum + '\'' +
                ", createdBy='" + createdBy + '\'' +
                ", updateBy='" + updateBy + '\'' +
                '}';
    }
}
