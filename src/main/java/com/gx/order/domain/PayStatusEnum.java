package com.gx.order.domain;

public enum PayStatusEnum {
    //0-已取消 1-待付款 2-付款成功 3-退款成功 6-支付中 7-等待支付认证 8-分期支付完成
    /*** 取消*/
    CANCEL("0","取消"),
    /*** 待付款*/
    WAIT_PAYING("1","待付款"),
    /*** 付款成功*/
    PAY_SUCCESS("2","付款成功"),
    /*** 退款成功*/
    REJECTED_SUCCESS("3","付款成功"),
    PAY_ING("6","正在付款中"),
    AWAIT_PAY_AUTH("7","等待支付认证"),
    PAYMENT_BY_INSTALLMENT("8","分期付款"),
    /** 货到付款*/
    CASHONDELIVERY("9","货到付款");

    private String payStatus;
    private String payStatusDesc;

    PayStatusEnum(String payStatus,String payStatusDesc){
        this.payStatus = payStatus;
        this.payStatusDesc = payStatusDesc;
    }
    public java.lang.String getPayStatus() {
        return payStatus;
    }

    public void setPayStatus(java.lang.String payStatus) {
        this.payStatus = payStatus;
    }

    public java.lang.String getPayStatusDesc() {
        return payStatusDesc;
    }

    public void setPayStatusDesc(java.lang.String payStatusDesc) {
        this.payStatusDesc = payStatusDesc;
    }
    /**
     * 根据code获取去name
     * @param code
     * @return
     */
    public static String getNameByCode(String code) {
        for (PayStatusEnum payStatusEnum : PayStatusEnum.values()) {
            if (code.equals(payStatusEnum.getPayStatus())) {
                return payStatusEnum.getPayStatusDesc();
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
        for (PayStatusEnum payStatusEnum : PayStatusEnum.values()) {
            if (name.equals(payStatusEnum.getPayStatusDesc())) {
                return payStatusEnum.getPayStatus();
            }
        }
        return  null;
    }
}
