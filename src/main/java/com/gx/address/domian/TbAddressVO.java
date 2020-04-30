package com.gx.address.domian;

import cn.com.do1.common.annotation.bean.FormatMask;

public class TbAddressVO {
    private String addressId;
    private String memberId;
    private String inceptPeople;
    private String inceptPhone;
    private String province;
    private String city;
    private String region;
    private String streetAddress;
    private String provinceCityRegion;
    private String provinceText;
    private String cityText;
    private String regionText;
    private String addressType;
    private String inceptPost;
    @FormatMask(type = "date", value = "yyyy-MM-dd HH:mm:ss")
    private String createTime;
    @FormatMask(type = "date", value = "yyyy-MM-dd HH:mm:ss")
    private String lastUpdateTime;

    public String getAddressId() {
        return addressId;
    }

    public void setAddressId(String addressId) {
        this.addressId = addressId;
    }

    public String getMemberId() {
        return memberId;
    }

    public void setMemberId(String memberId) {
        this.memberId = memberId;
    }

    public String getInceptPeople() {
        return inceptPeople;
    }

    public void setInceptPeople(String inceptPeople) {
        this.inceptPeople = inceptPeople;
    }

    public String getInceptPhone() {
        return inceptPhone;
    }

    public void setInceptPhone(String inceptPhone) {
        this.inceptPhone = inceptPhone;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public String getStreetAddress() {
        return streetAddress;
    }

    public void setStreetAddress(String streetAddress) {
        this.streetAddress = streetAddress;
    }

    public String getProvinceCityRegion() {
        return provinceCityRegion;
    }

    public void setProvinceCityRegion(String provinceCityRegion) {
        this.provinceCityRegion = provinceCityRegion;
    }

    public String getProvinceText() {
        return provinceText;
    }

    public void setProvinceText(String provinceText) {
        this.provinceText = provinceText;
    }

    public String getCityText() {
        return cityText;
    }

    public void setCityText(String cityText) {
        this.cityText = cityText;
    }

    public String getRegionText() {
        return regionText;
    }

    public void setRegionText(String regionText) {
        this.regionText = regionText;
    }

    public String getAddressType() {
        return addressType;
    }

    public void setAddressType(String addressType) {
        this.addressType = addressType;
    }

    public String getInceptPost() {
        return inceptPost;
    }

    public void setInceptPost(String inceptPost) {
        this.inceptPost = inceptPost;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getLastUpdateTime() {
        return lastUpdateTime;
    }

    public void setLastUpdateTime(String lastUpdateTime) {
        this.lastUpdateTime = lastUpdateTime;
    }

    @Override
    public String toString() {
        return "TbAddressVO{" +
                "addressId='" + addressId + '\'' +
                ", memberId='" + memberId + '\'' +
                ", inceptPeople='" + inceptPeople + '\'' +
                ", inceptPhone='" + inceptPhone + '\'' +
                ", province='" + province + '\'' +
                ", city='" + city + '\'' +
                ", region='" + region + '\'' +
                ", streetAddress='" + streetAddress + '\'' +
                ", provinceCityRegion='" + provinceCityRegion + '\'' +
                ", provinceText='" + provinceText + '\'' +
                ", cityText='" + cityText + '\'' +
                ", regionText='" + regionText + '\'' +
                ", addressType='" + addressType + '\'' +
                ", inceptPost='" + inceptPost + '\'' +
                ", createTime='" + createTime + '\'' +
                ", lastUpdateTime='" + lastUpdateTime + '\'' +
                '}';
    }
}
