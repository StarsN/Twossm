package com.gx.member.domain;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class TbMemberPO {

    private String memberId;
    private String nickName;
    private String account;
    private String password;
    private String oauthId;
    private String registerType;
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date registerTime;
    private String memberStatus;
    private String phoneNumber;
    private String wechatNumber;//分销员id
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date lastTime;
    private String loginCount;//登录次数
    private String verificationCode;//验证码
    private String openId;
    private String unionId;
    /**
     * pkr
     * 小程序opendid
     */
    private String miniOpenid;
    private String agentUser;//分销代理人
    private String changePwd;//是否修改密码
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date changeTime;//密码修改时间
    private String  agreeDisProtocol;//是否同意分销协议（0-是，1-否默认）

    private String isVerification;

    public String getMemberId() {
        return memberId;
    }

    public void setMemberId(String memberId) {
        this.memberId = memberId;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getOauthId() {
        return oauthId;
    }

    public void setOauthId(String oauthId) {
        this.oauthId = oauthId;
    }

    public String getRegisterType() {
        return registerType;
    }

    public void setRegisterType(String registerType) {
        this.registerType = registerType;
    }

    public Date getRegisterTime() {
        return registerTime;
    }

    public void setRegisterTime(Date registerTime) {
        this.registerTime = registerTime;
    }

    public String getMemberStatus() {
        return memberStatus;
    }

    public void setMemberStatus(String memberStatus) {
        this.memberStatus = memberStatus;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getWechatNumber() {
        return wechatNumber;
    }

    public void setWechatNumber(String wechatNumber) {
        this.wechatNumber = wechatNumber;
    }

    public Date getLastTime() {
        return lastTime;
    }

    public void setLastTime(Date lastTime) {
        this.lastTime = lastTime;
    }

    public String getLoginCount() {
        return loginCount;
    }

    public void setLoginCount(String loginCount) {
        this.loginCount = loginCount;
    }

    public String getVerificationCode() {
        return verificationCode;
    }

    public void setVerificationCode(String verificationCode) {
        this.verificationCode = verificationCode;
    }

    public String getOpenId() {
        return openId;
    }

    public void setOpenId(String openId) {
        this.openId = openId;
    }

    public String getUnionId() {
        return unionId;
    }

    public void setUnionId(String unionId) {
        this.unionId = unionId;
    }

    public String getMiniOpenid() {
        return miniOpenid;
    }

    public void setMiniOpenid(String miniOpenid) {
        this.miniOpenid = miniOpenid;
    }

    public String getAgentUser() {
        return agentUser;
    }

    public void setAgentUser(String agentUser) {
        this.agentUser = agentUser;
    }

    public String getChangePwd() {
        return changePwd;
    }

    public void setChangePwd(String changePwd) {
        this.changePwd = changePwd;
    }

    public Date getChangeTime() {
        return changeTime;
    }

    public void setChangeTime(Date changeTime) {
        this.changeTime = changeTime;
    }

    public String getAgreeDisProtocol() {
        return agreeDisProtocol;
    }

    public void setAgreeDisProtocol(String agreeDisProtocol) {
        this.agreeDisProtocol = agreeDisProtocol;
    }

    public String getIsVerification() {
        return isVerification;
    }

    public void setIsVerification(String isVerification) {
        this.isVerification = isVerification;
    }

    @Override
    public String toString() {
        return "TbMemberPO{" +
                "memberId='" + memberId + '\'' +
                ", nickName='" + nickName + '\'' +
                ", account='" + account + '\'' +
                ", password='" + password + '\'' +
                ", oauthId='" + oauthId + '\'' +
                ", registerType='" + registerType + '\'' +
                ", registerTime=" + registerTime +
                ", memberStatus='" + memberStatus + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", wechatNumber='" + wechatNumber + '\'' +
                ", lastTime=" + lastTime +
                ", loginCount='" + loginCount + '\'' +
                ", verificationCode='" + verificationCode + '\'' +
                ", openId='" + openId + '\'' +
                ", unionId='" + unionId + '\'' +
                ", miniOpenid='" + miniOpenid + '\'' +
                ", agentUser='" + agentUser + '\'' +
                ", changePwd='" + changePwd + '\'' +
                ", changeTime=" + changeTime +
                ", agreeDisProtocol='" + agreeDisProtocol + '\'' +
                ", isVerification='" + isVerification + '\'' +
                '}';
    }
}
