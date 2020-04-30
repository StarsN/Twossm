package com.gx.person.domain;

import java.io.Serializable;
import java.util.Date;

public class TbPersonInfo implements Serializable {

    private String personId;
    private String personName;
    private String age;
    private String sex;
    private String merchant;
    //是否修改密码，null或0-未修改，1-已修改
    private String changePwd;
    //修改时间
    private Date changeTime;
    //省份
    private String province;

    public String getPersonId() {
        return personId;
    }

    public void setPersonId(String personId) {
        this.personId = personId;
    }

    public String getPersonName() {
        return personName;
    }

    public void setPersonName(String personName) {
        this.personName = personName;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getMerchant() {
        return merchant;
    }

    public void setMerchant(String merchant) {
        this.merchant = merchant;
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

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    @Override
    public String toString() {
        return "TbPersonInfo{" +
                "personId='" + personId + '\'' +
                ", personName='" + personName + '\'' +
                ", age='" + age + '\'' +
                ", sex='" + sex + '\'' +
                ", merchant='" + merchant + '\'' +
                ", changePwd='" + changePwd + '\'' +
                ", changeTime=" + changeTime +
                ", province='" + province + '\'' +
                '}';
    }
}
