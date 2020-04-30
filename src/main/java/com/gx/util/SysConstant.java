package com.gx.util;

public class SysConstant {
    //订单项状态
    public interface orderItemStatus{
        /*** 正常*/
        String NORMAL = "1";
        /*** 退货*/
        String GOODS_REJECTED = "2";
        /*** 换货*/
        String GOODS_EXCHANGE = "3";
    }

    //订单状态
    public interface orderStatus{
        /*** 取消*/
        String CANCEL = "0";
        /*** 待付款*/
        String WAIT_PAYING = "1";
        /*** 待发货*/
        String GOODS_WAIT_DELIVER = "2";
        /*** 配送中*/
        String GOODS_WAIT_RECEIVE = "3";
        /*** 已完成*/
        String FINISH = "10";
        /*** 退款处理中*/
        String GOODS_REFUNDS = "5";
        /*** 已退款*/
        String REFUNDS = "6";
        /*** 超时关闭  **/
        String TIMEOUT_OFF = "7";
        /*** 已退货 **/
        String RETURN = "8";
        /*** 买家已收货  **/
        String RECEIVE = "9";
        /*** 待拆单*/
        String WAIT_DISCONNECT = "12";
        /*** 已拆单*/
        String DISCONNECT = "13";
        /**支付中*/
        String PAY_ING = "14";
        /**等待支付认证*/
        String AWAIT_PAY_AUTH = "15";
        /** 电子券已发货*/
        String SHIPPED = "16";
        /** 货到付款*/
        String CASHONDELIVERY = "17";
        /** 业务办理失败,已退款*/
        String HANDLEFAILREFUNDS = "33";

    }
    //支付状态
    public interface payStatus{
        //0-已取消 1-待付款 2-付款成功 3-退款成功 6-支付中 7-等待支付认证 8-分期支付完成
        /*** 取消*/
        String CANCEL = "0";
        /*** 待付款*/
        String WAIT_PAYING = "1";
        /*** 付款成功*/
        String PAY_SUCCESS = "2";
        /*** 退款成功*/
        String REJECTED_SUCCESS = "3";
        String PAY_ING = "6";
        String AWAIT_PAY_AUTH = "7";
        String PAYMENT_BY_INSTALLMENT = "8";
        /** 货到付款*/
        String CASHONDELIVERY = "9";
    }

    public interface orderSupplyStatus{//根据物流中心的配送状态进行配置，先配置一个配送中
        String  DELIVERYING = "1";
    }

    //优惠券状态
    public interface couponStatus{
        /**使用中*/
        String STATUS_IN_USE="0";
        /**已失效*/
        String STATUS_OUTOFUSE="1";
        /**已过期*/
        String STATUS_OVER="2";
        /**已删除*/
        String STATUS_DEL="3";

        /**固定面额优惠*/
        String DISCOUNT_TYPE_STATIC="0";
        /**随机面额优惠*/
        String DISCOUNT_TYPE_RANDOM="1";
        /**折扣*/
        String DISCOUNT_TYPE_DISCOUNT="2";
        /**没有使用限制*/
        String IS_USE_LIMIT_NO="0";
        /**有使用限制*/
        String IS_USE_LIMIT_YES="1";
        /**无数量领取限制*/
        String IS_NUMER_LIMIT_NO="0";
        /**有数量领取限制*/
        String IS_NUMER_LIMIT_YES="1";
        /**按时间段区分有效时间*/
        String EFFECTIVE_TIME_TYPE_TIME="0";
        /**当天后N天有效*/
        String EFFECTIVE_TIME_TYPE_THEDAY="1";
        /**次日后N天后有效*/
        String EFFECTIVE_TIME_TYPE_NEXTDAY="2";
        /**部分商品可用*/
        String IS_ALL_ITEM_AVAILABLE_NO="0";
        /**全部商品可用*/
        String IS_ALL_ITEM_AVAILABLE_YES="1";
        /**全部商品可用*/
        String ONLY_ORIGINAL_PRICE_AVAILABLE_NO="0";

        /**该用户当前可以领取优惠券*/
        String GET_COUPON_PASS_YES="1001";
        /**该用户当前不可以领取优惠券*/
        String GET_COUPON_PASS_NO="1002";

        /**卡包中的优惠券可用*/
        String COUPON_PACKAGE_AVAILABLE="0";
        /**卡包中的优惠券过期*/
        String COUPON_PACKAGE_OVER="1";
        /**卡包中的优惠券已用*/
        String COUPON_PACKAGE_USED="2";
        /**卡包中的优惠券已失效*/
        String COUPON_PACKAGE_INVALID="3";

    }
}
