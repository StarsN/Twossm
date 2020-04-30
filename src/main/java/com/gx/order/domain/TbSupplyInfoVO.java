package com.gx.order.domain;

import cn.com.do1.common.annotation.bean.FormatMask;

public class TbSupplyInfoVO {

    //配送订单号
    private String supplyId;
    //订单号
    private String orderId;
    //物流公司
    private String logistcsCompany;
    //物流单号
    private String logistcsId;
    //配送方式1-自提，2-配送上门
    private String supplyType;
    //配送状态
//    配送状态，0-缺货，1-待发货，2-配送中，3-配送结束
    private String supplyStatus;
    //付款金额
    private String payAmount;
    //配送时间
    @FormatMask(type = "date", value = "yyyy-MM-dd HH:mm:ss")
    private String supplyTime;
    //配送结束时间
    @FormatMask(type = "date", value = "yyyy-MM-dd HH:mm:ss")
    private String overTime;
    //联系人名称
    private String inceptPeople;
    //联系人电话
    private String inceptTel;
    //联系人邮政编码
    private String inceptPost;
    //省份编码
    private String province;
    //市编码
    private String city;
    //区域编码
    private String region;
    //配送地址完整
    private String supplyAddress;
    //配送备注
    private String supplyRemark;
    //省份中文
    private String provinceName;
    //市中文
    private String cityName;
    //区域中文
    private String regionName;
    //街道地址
    private String streetAddress;
    //预约自提时间
    @FormatMask(type = "date", value = "yyyy-MM-dd HH:mm:ss")
    private String appointmentTime;

    public String getSupplyId() {
        return supplyId;
    }

    public void setSupplyId(String supplyId) {
        this.supplyId = supplyId;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getLogistcsCompany() {
        return logistcsCompany;
    }

    public void setLogistcsCompany(String logistcsCompany) {
        this.logistcsCompany = logistcsCompany;
    }

    public String getLogistcsId() {
        return logistcsId;
    }

    public void setLogistcsId(String logistcsId) {
        this.logistcsId = logistcsId;
    }

    public String getSupplyType() {
        return supplyType;
    }

    public void setSupplyType(String supplyType) {
        this.supplyType = supplyType;
    }

    public String getSupplyStatus() {
        return supplyStatus;
    }

    public void setSupplyStatus(String supplyStatus) {
        this.supplyStatus = supplyStatus;
    }

    public String getPayAmount() {
        return payAmount;
    }

    public void setPayAmount(String payAmount) {
        this.payAmount = payAmount;
    }

    public String getSupplyTime() {
        return supplyTime;
    }

    public void setSupplyTime(String supplyTime) {
        this.supplyTime = supplyTime;
    }

    public String getOverTime() {
        return overTime;
    }

    public void setOverTime(String overTime) {
        this.overTime = overTime;
    }

    public String getInceptPeople() {
        return inceptPeople;
    }

    public void setInceptPeople(String inceptPeople) {
        this.inceptPeople = inceptPeople;
    }

    public String getInceptTel() {
        return inceptTel;
    }

    public void setInceptTel(String inceptTel) {
        this.inceptTel = inceptTel;
    }

    public String getInceptPost() {
        return inceptPost;
    }

    public void setInceptPost(String inceptPost) {
        this.inceptPost = inceptPost;
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

    public String getSupplyAddress() {
        return supplyAddress;
    }

    public void setSupplyAddress(String supplyAddress) {
        this.supplyAddress = supplyAddress;
    }

    public String getSupplyRemark() {
        return supplyRemark;
    }

    public void setSupplyRemark(String supplyRemark) {
        this.supplyRemark = supplyRemark;
    }

    public String getProvinceName() {
        return provinceName;
    }

    public void setProvinceName(String provinceName) {
        this.provinceName = provinceName;
    }

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    public String getRegionName() {
        return regionName;
    }

    public void setRegionName(String regionName) {
        this.regionName = regionName;
    }

    public String getStreetAddress() {
        return streetAddress;
    }

    public void setStreetAddress(String streetAddress) {
        this.streetAddress = streetAddress;
    }

    public String getAppointmentTime() {
        return appointmentTime;
    }

    public void setAppointmentTime(String appointmentTime) {
        this.appointmentTime = appointmentTime;
    }

    @Override
    public String toString() {
        return "TbSupplyInfoVO{" +
                "supplyId='" + supplyId + '\'' +
                ", orderId='" + orderId + '\'' +
                ", logistcsCompany='" + logistcsCompany + '\'' +
                ", logistcsId='" + logistcsId + '\'' +
                ", supplyType='" + supplyType + '\'' +
                ", supplyStatus='" + supplyStatus + '\'' +
                ", payAmount='" + payAmount + '\'' +
                ", supplyTime='" + supplyTime + '\'' +
                ", overTime='" + overTime + '\'' +
                ", inceptPeople='" + inceptPeople + '\'' +
                ", inceptTel='" + inceptTel + '\'' +
                ", inceptPost='" + inceptPost + '\'' +
                ", province='" + province + '\'' +
                ", city='" + city + '\'' +
                ", region='" + region + '\'' +
                ", supplyAddress='" + supplyAddress + '\'' +
                ", supplyRemark='" + supplyRemark + '\'' +
                ", provinceName='" + provinceName + '\'' +
                ", cityName='" + cityName + '\'' +
                ", regionName='" + regionName + '\'' +
                ", streetAddress='" + streetAddress + '\'' +
                ", appointmentTime='" + appointmentTime + '\'' +
                '}';
    }
}
