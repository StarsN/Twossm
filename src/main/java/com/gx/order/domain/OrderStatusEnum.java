package com.gx.order.domain;

public enum OrderStatusEnum {
    CANCEL("0","买家取消"),
    /*** 待付款*/
    WAIT_PAYING("1","待付款"),
    /*** 待发货*/
    GOODS_WAIT_DELIVER("2","待发货"),
    /*** 配送中*/
    GOODS_WAIT_RECEIVE("3","配送中"),
    /*** 已完成*/
    FINISH("10","已完成"),
    /*** 退款处理中*/
    GOODS_REFUNDS("5","退款处理中"),
    /*** 已退款*/
    REFUNDS("6","已退款"),
    /*** 超时关闭  **/
    TIMEOUT_OFF("7","超时关闭"),
    /*** 已退货 **/
    RETURN("8","已退货"),
    /*** 买家已收货  **/
    RECEIVE("9","买家已收货"),
    /*** 待拆单*/
    WAIT_DISCONNECT("12","待拆单"),
    /*** 已拆单*/
    DISCONNECT("13","已拆单"),
    /**支付中*/
    PAY_ING("14","支付中"),
    /**等待支付认证*/
    AWAIT_PAY_AUTH("15","等待支付认证"),
    /** 电子券已发货*/
    SHIPPED("16","电子卷已发货"),
    /** 货到付款*/
    CASHONDELIVERY("17","货到付款"),
    /** 业务办理失败,已退款*/
    HANDLEFAILREFUNDS("33","业务办理失败，已退款");
    public String orderStatus;
    public String orderStatusDesc;
    OrderStatusEnum(String orderStatus,String orderStatusDesc){
        this.orderStatus = orderStatus;
        this.orderStatusDesc = orderStatusDesc;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public String getOrderStatusDesc() {
        return orderStatusDesc;
    }

    public void setOrderStatusDesc(String orderStatusDesc) {
        this.orderStatusDesc = orderStatusDesc;
    }
    /**
     * 根据code获取去name
     * @param code
     * @return
     */
    public static String getNameByCode(String code) {
        for (OrderStatusEnum orderStatusEnum : OrderStatusEnum.values()) {
            if (code.equals(orderStatusEnum.getOrderStatus())) {
                return orderStatusEnum.getOrderStatusDesc();
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
        for (OrderStatusEnum orderStatusEnum : OrderStatusEnum.values()) {
            if (name.equals(orderStatusEnum.getOrderStatusDesc())) {
                return orderStatusEnum.getOrderStatus();
            }
        }
        return  null;
    }
    //    /*** 取消*/
//    String CANCEL = "0";
//    /*** 待付款*/
//    String WAIT_PAYING = "1";
//    /*** 待发货*/
//    String GOODS_WAIT_DELIVER = "2";
//    /*** 配送中*/
//    String GOODS_WAIT_RECEIVE = "3";
//    /*** 已完成*/
//    String FINISH = "10";
//    /*** 退款处理中*/
//    String GOODS_REFUNDS = "5";
//    /*** 已退款*/
//    String REFUNDS = "6";
//    /*** 超时关闭  **/
//    String TIMEOUT_OFF = "7";
//    /*** 已退货 **/
//    String RETURN = "8";
//    /*** 买家已收货  **/
//    String RECEIVE = "9";
//    /*** 待拆单*/
//    String WAIT_DISCONNECT = "12";
//    /*** 已拆单*/
//    String DISCONNECT = "13";
//    /**支付中*/
//    String PAY_ING = "14";
//    /**等待支付认证*/
//    String AWAIT_PAY_AUTH = "15";
//    /** 电子券已发货*/
//    String SHIPPED = "16";
//    /** 货到付款*/
//    String CASHONDELIVERY = "17";
//    /** 业务办理失败,已退款*/
//    String HANDLEFAILREFUNDS = "33";
}
