package com.gx.order.domain;

public enum OrderItemStatus {

    /*** 正常*/
    NORMAL("1","正常"),
    /*** 退货*/
    GOODS_REJECTED("2","退货"),
    /*** 换货*/
    GOODS_EXCHANGE("3","换货");
    private String orderItemStatus;
    private String orderItemStatusDesc;
    OrderItemStatus(String orderItemStatus,String orderItemStatusDesc){
        this.orderItemStatus = orderItemStatus;
        this.orderItemStatusDesc = orderItemStatusDesc;
    }

    public String getOrderItemStatus() {
        return orderItemStatus;
    }

    public void setOrderItemStatus(String orderItemStatus) {
        this.orderItemStatus = orderItemStatus;
    }

    public String getOrderItemStatusDesc() {
        return orderItemStatusDesc;
    }

    public void setOrderItemStatusDesc(String orderItemStatusDesc) {
        this.orderItemStatusDesc = orderItemStatusDesc;
    }

    /**
     * 根据code获取去name
     * @param code
     * @return
     */
    public static String getNameByCode(String code) {
        for (OrderItemStatus orderItemStatus : OrderItemStatus.values()) {
            if (code.equals(orderItemStatus.getOrderItemStatus())) {
                return orderItemStatus.getOrderItemStatusDesc();
            }
        }
        return  null;
    }

    /**
     * 根据name获取去code
     * @param name
     * @return
     */
    public static String getCodeByName(String name) {
        for (OrderItemStatus orderItemStatus : OrderItemStatus.values()) {
            if (name.equals(orderItemStatus.getOrderItemStatusDesc())) {
                return orderItemStatus.getOrderItemStatus();
            }
        }
        return  null;
    }
}
