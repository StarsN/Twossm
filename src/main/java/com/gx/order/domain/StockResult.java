package com.gx.order.domain;

public class StockResult {
    //插入订单、订单项返回封装
    private boolean status;
    private String orderId;

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    @Override
    public String toString() {
        return "StockResult{" +
                "status=" + status +
                ", orderId='" + orderId + '\'' +
                '}';
    }
}
