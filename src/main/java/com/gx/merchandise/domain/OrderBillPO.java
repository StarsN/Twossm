package com.gx.merchandise.domain;

import cn.com.do1.common.annotation.bean.FormatMask;

import java.io.Serializable;

public class OrderBillPO implements Serializable {
    private String stockId;
    private String merchandiseCode;
    private String price;
    private String merchandiseName;
    private String imagePath;
    private String status;

    public String getStockId() {
        return stockId;
    }

    public void setStockId(String stockId) {
        this.stockId = stockId;
    }

    public String getMerchandiseCode() {
        return merchandiseCode;
    }

    public void setMerchandiseCode(String merchandiseCode) {
        this.merchandiseCode = merchandiseCode;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getMerchandiseName() {
        return merchandiseName;
    }

    public void setMerchandiseName(String merchandiseName) {
        this.merchandiseName = merchandiseName;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "OrderBillPO{" +
                "stockId='" + stockId + '\'' +
                ", merchandiseCode='" + merchandiseCode + '\'' +
                ", price='" + price + '\'' +
                ", merchandiseName='" + merchandiseName + '\'' +
                ", imagePath='" + imagePath + '\'' +
                ", status='" + status + '\'' +
                '}';
    }
}
