package com.gx.merchandise.domain;

import java.io.Serializable;
import java.util.Date;

public class TbMerchandiseStockPO implements Serializable {

    //库存Id
    private String id;
    //商品编号
    private String merchandiseCode;
    //库存
    private String stock;
    //更新时间
    private Date updateTime;
    //更新人名字
    private String updateBy;
    //商品价格
    private String price;
    //库存Id
    private String stockId;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getMerchandiseCode() {
        return merchandiseCode;
    }

    public void setMerchandiseCode(String merchandiseCode) {
        this.merchandiseCode = merchandiseCode;
    }

    public String getStock() {
        return stock;
    }

    public void setStock(String stock) {
        this.stock = stock;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getStockId() {
        return stockId;
    }

    public void setStockId(String stockId) {
        this.stockId = stockId;
    }
}
