package com.gx.whiteList.domain;

import java.io.Serializable;

public class TbWhiteListBindRefPO implements Serializable {
    /**
     * 白名单库与商品中间表id
     */
    private String whiteListBindRefId;
    /**
     * 白名单库id
     */
    private String whiteListId;
    /**
     * 相关id
     */
    private String linkId;

    /**
     * 白名单类型
     */
    private String whiteListType;

    public String getWhiteListBindRefId() {
        return whiteListBindRefId;
    }

    public void setWhiteListBindRefId(String whiteListBindRefId) {
        this.whiteListBindRefId = whiteListBindRefId;
    }

    public String getWhiteListId() {
        return whiteListId;
    }

    public void setWhiteListId(String whiteListId) {
        this.whiteListId = whiteListId;
    }

    public String getLinkId() {
        return linkId;
    }

    public void setLinkId(String linkId) {
        this.linkId = linkId;
    }

    public String getWhiteListType() {
        return whiteListType;
    }

    public void setWhiteListType(String whiteListType) {
        this.whiteListType = whiteListType;
    }

    @Override
    public String toString() {
        return "TbWhiteListBindRefPO{" +
                "whiteListBindRefId='" + whiteListBindRefId + '\'' +
                ", whiteListId='" + whiteListId + '\'' +
                ", linkId='" + linkId + '\'' +
                ", whiteListType='" + whiteListType + '\'' +
                '}';
    }
}
