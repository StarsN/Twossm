package com.gx.user.domain;

import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * @author admin
 */
public class TbUserInfo implements Serializable {

    private String userId;
    private String userName;
    private String password;
    @DateTimeFormat(pattern = "yy-MM-dd HH:mm:ss")
    private Date createTime;
    private String status;
    @DateTimeFormat(pattern = "yy-MM-dd HH:mm:ss")
    private Date lastLoginTime;
    private String merchant;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getLastLoginTime() {
        return lastLoginTime;
    }

    public void setLastLoginTime(Date lastLoginTime) {
        this.lastLoginTime = lastLoginTime;
    }

    public String getMerchant() {
        return merchant;
    }

    public void setMerchant(String merchant) {
        this.merchant = merchant;
    }

    @Override
    public String toString() {
        return "TbUserInfo{" +
                "userId='" + userId + '\'' +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", createTime=" + createTime +
                ", status='" + status + '\'' +
                ", lastLoginTime=" + lastLoginTime +
                ", merchant='" + merchant + '\'' +
                '}';
    }
}
