<%@ page language="java" import="java.util.*,java.net.URLDecoder" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.gx.merchandise.domain.OrderBillPO" %>
<%@ page import="com.gx.merchandise.domain.TbMerchandiseInfoPO" %>
<%@ page import="com.gx.merchant.domain.TbMerchantPO" %>
<%@ page import="com.gx.address.domian.TbAddressPO" %>
<%
    //获取请求上下文
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    //获取OrderBillPO信息
    OrderBillPO orderBillPO = (OrderBillPO) request.getAttribute("orderBillPO");
    System.out.print("在订单生成页面的orderBillPO为=" + orderBillPO);
    //获取购买数量
    String buyNum = (String) request.getAttribute("buyNum");
    //获取到总金额
    Double totalPrice = (Double) request.getAttribute("totalPrice");
    //获取默认地址
    TbAddressPO tbAddressPO = (TbAddressPO) request.getAttribute("addressPO");
    //获取商家
    TbMerchantPO tbMerchantPO = (TbMerchantPO) request.getAttribute("tbMerchantPO");
    //获取resultDesc
    String resultDesc = (String) request.getAttribute("resultDesc");
%>
<!DOCTYPE html>

<html>
<head>
    <%@include file="../../../../common/dqdp_common.jsp" %>
    <jsp:include page="../../../../common/dqdp_vars.jsp">
        <jsp:param name="dict" value=""></jsp:param>
    </jsp:include>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="black" name="apple-mobile-web-app-status-bar-style">
    <meta content="telephone=no" name="format-detection">
    <meta content="email=no" name="format-detection">
    <title>填写订单</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>portal/css/base.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>portal/css/style.css"/>
    <script src="<%=basePath%>portal/js/adaptive.js"></script>
    <script type="text/javascript"
            src="http://api.map.baidu.com/api?v=2.0&ak=qjcA3MuuDtbeGADDz0i1GVdKtxbKeB6G"></script>
    <script src="https://res.wx.qq.com/open/js/jweixin-1.2.0.js" type="text/javascript"></script>
    <script>
        // 设计图宽度
        window['adaptive'].desinWidth = 750;
        // body 字体大小
        window['adaptive'].baseFont = 18;

        // 显示最大宽度
        window['adaptive'].maxWidth = 750;

        // 初始化
        window['adaptive'].init();
    </script>
    <style>
        .teraEnter {
            font-size: 0.24rem;
            color: #333;
            border: none;
            border-radius: 0;
            -webkit-appearance: none;
            outline: none;
            text-align: right;
            resize: none;
            height: 0.4rem;
            vertical-align: middle;
        }

        .invoice {
            display: block;
            position: relative;
            padding: 0.2rem 0.48rem 0.3rem 0.15rem;
            border-bottom: 1px solid #fff;
            background: #fff;
        }

        .invoice::after {
            content: '';
            position: absolute;
            top: 50%;
            right: 0.15rem;
            background: url(<%=basePath%>portal/images/i_right.png) no-repeat;
            background-size: auto;
            background-size: 100% 100%;
            width: 0.11rem;
            height: 0.2rem;
            margin-top: -0.1rem;
        }
    </style>
</head>
<body>
<form action="" method="post" id="submitForm">
<%--    <input type="hidden" name="refVOsIds" id="refVOsIds" value="${refVOsIds}">--%>
    <input type="hidden" name="addressId" id="addressId" value="<%=tbAddressPO.getAddressId()%>">
    <input type="hidden" name="stockId" id="stockId" value="<%=orderBillPO.getStockId()%>"/>
    <input type="hidden" name="buyNum" id="buyNum" value="<%=buyNum%>"/>
    <input type="hidden" name="resultDesc" id="resultDesc" value="<%=resultDesc%>"/>
<%--    <input type="hidden" name="goodsId" id="goodsId" value="${goodsId }"/>--%>
<%--    <input type="hidden" name="number" id="number" value="${number}"/>--%>
<%--    &lt;%&ndash;新增合约渠道（集团或福建）&ndash;%&gt;--%>
<%--    <input type="hidden" name="contractChannel" id="contractChannel" value="${contractChannel}"/>--%>
<%--    <input type="hidden" name="token" id="token" value="${param.token}"/>--%>
<%--    <input type="hidden" name="limitToken" id="limitToken" value="${param.limitToken }">--%>
<%--    <input type="hidden" name="purchase_token" id="purchase_token" value="${purchase_token}"/>--%>
<%--    <input type="hidden" name="tbOrderInfoPO.invoiceType" id="invoiceType" value="">--%>
<%--    <input type="hidden" name="tbOrderInfoPO.invoiceTitle" id="invoiceTitle" value="">--%>
<%--    <input type="hidden" name="tbOrderInfoPO.invoiceTel" id="invoiceTel" value="">--%>
<%--    <input type="hidden" name="tbOrderInfoPO.taxyerNum" id="invoiceIdentityNum" value="">--%>
<%--    <input type="hidden" name="tbOrderInfoPO.invoiceEmail" id="invoiceEmail" value="">--%>
<%--    <input type="hidden" name="tbOrderInfoPO.isNeedInvoice" id="isNeedInvoice" value="0">--%>
<%--    <input type="hidden" name="titleType" id="titleType" value="">--%>
<%--    <input type="hidden" name="tbOrderInfoPO.couponPackageId" id="couponPackageId" value="">--%>
<%--    <input type="hidden" name="tbOrderInfoPO.orderSupplyType" id="orderSupplyType" value="2">--%>
<%--    <input type="hidden" name="tbOrderInfoPO.storeId" id="storeId" value="">--%>
<%--    <input type="hidden" name="tbOrderInfoPO.appointmentTime" id="appointmentTime" value="">--%>
    <div class="container pb98s">

        <!--
            如果有底部菜单栏：pb98s
        -->
        <div class="content">

            <!--
                待付款详情
            -->
            <div class="all_orderPage">

                <div class="order_content">

                    <!--
                        待付款头部用户信息
                    -->
                    <div class="dpayTop">
                        <%--<dl>--%>
                        <%--<dt>--%>
                        <%--<i class="icon_pay_wait"></i>--%>
                        <%--</dt>--%>
                        <%--<dd>--%>
                        <%--<div class="dpayStatue">--%>
                        <%--<h3>等待买家付款</h3>--%>
                        <%--<p>请于58分钟内付款，超时订单将自动关闭</p>--%>
                        <%--</div>--%>
                        <%--</dd>--%>
                        <%--</dl>--%>
<%--                        <c:if test="${'<%=orderBillPO%>'== null}">--%>
                            <c:choose>
                                <c:when test="${'<%=tbAddressPO%>'==null}">
                                    <!--新增收货地址-->
                                    <a href="${baseURL}/jsp/component/portal/JSP/order/order_address_add.jsp?type=firstAdd" class="addDeFaultAddress">
                                        <i></i>
                                        <p>新增默认地址</p>
                                    </a>
                                    <!--
                                    end 没有默认地址时显示
                                    -->
                                </c:when>
                                <c:otherwise>
                                    <!--收货信息-->
                                    <dl onclick="editInceptInfo()" style="display: block;">
                                        <dt>
                                            <i class="icon_pay_position"></i>
                                        </dt>
                                        <dd>
                                            <div class="dpayuserInfo">
                                                <h3>
                                                    <span id="inceptPeople">收货人：<%=tbAddressPO.getInceptPeople()%></span><span id="inceptTel">  <%=tbAddressPO.getInceptPhone()%></span>
                                                </h3>
                                                <p>收货地址：<%=tbAddressPO.getProvinceCityRegion()%><%=tbAddressPO.getStreetAddress()%></p>
                                            </div>
                                        </dd>
                                    </dl>
                                </c:otherwise>
                            </c:choose>
<%--                        </c:if>--%>

                    </div>

                    <div class="order_content_item" id="" style="display: block;">
                        <div class="car_menu_list car_menu_listNot">
                            <h3 class="car_menu_top autoHeight">
                                <div class="fl car_menu_top_l">
                                    <div class="fl bdName"><i
                                            class="icoDp"></i><span><%=tbMerchantPO.getMerchantName()%></span>
                                    </div>
                                </div>
                            </h3>
                            <div class="car_menu_list_info">
                                <a class="car_list_dShow" href="#">
                                    <div class="fl car_list_dShow_img"><img src="<%=orderBillPO.getImagePath()%>" alt="img"></div>
                                    <div class="car_list_dShow_info">
                                        <p class="mobile_db"><%=orderBillPO.getMerchandiseName()%></p>
                                        <h3>${billVO.attrDesc }<span class="fr cNum">x<em><%=buyNum%></em></span></h3>
                                        <h4><span class="fl c_price">¥ <%=orderBillPO.getPrice()%></span></h4>
                                        <%--<b class="sawPdPhoto">商品快照</b>--%>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="order_cm_shower">
                            <dl class="cmdl">
                                <dt>商品金额</dt>
                                <dd>¥ <b id="total"><%=totalPrice%></b></dd>
                            </dl>
                            <dl class="cmdl">
                                <dt>优惠</dt>
                                <dd id="realSaveMoney">¥0</dd>
                            </dl>
                            <dl class="cmdl">
                                <dt>运费</dt>
                                <dd>0</dd>
                            </dl>
                            <dl class="cmdl">
                                <dt>实付金额</dt>
                                <dd>
                                    <span class="priceOn" >¥ <b id="final_total">${totalPrice - discountActivity.discountedAmount}</b></span>
                                </dd>
<%--                                <c:if test="${discountActivity != null}">--%>
<%--                                    <dt>实付金额</dt>--%>
<%--                                    <dd>--%>
<%--                                        <span class="priceOn" >¥ <b id="final_total">${totalPrice - discountActivity.discountedAmount}</b></span>--%>
<%--                                    </dd>--%>
<%--                                </c:if>--%>
<%--                                <c:if test="${discountActivity == null}">--%>
<%--                                    <dt>实付金额</dt>--%>
<%--                                    <dd>--%>
<%--                                        <span class="priceOn">¥<b id="final_total">${totalPrice }</b></span>--%>
<%--                                    </dd>--%>
<%--                                </c:if>--%>
                            </dl>
                        </div>
                    </div>
                    <div class="pd_bottom_info">
                        <div class="order_cm_shower">
                            <div class="order_cm_list">
                                <c:if test="${billVO == null || billVO.isEvoucher != 1}">
                                    <dl class="cmdl">
                                        <dt>配送方式</dt>
                                        <dd>免运费 - 快递发货</dd>
                                    </dl>
                                </c:if>
                                <dl class="cmdl">
                                    <dt>买家留言</dt>
                                    <dd><textarea name="memberMsg" id="memberMsg" rows="" cols=""
                                                  placeholder="给商家留言"
                                                  class="teraEnter"></textarea></dd>
                                </dl>
                                <dl onclick="selectCoupon()" class="cmdl">
                                    <dt>选择优惠券</dt>
                                    <dd>
                                        <p id="couponName"></p>

                                        <a href="javascript:void(0)" class="invoice" style="color:#E61E1E;"><p id="saveMoney"></p></a>
                                    </dd>
                                </dl>
                                <dl class="cmdl" onclick="selectInvoice();">
                                    <dt>发票抬头</dt>
                                    <dd class="invoice fp" style="color:#E61E1E;"></dd>
                                </dl>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <!--
                end 订单
            -->
        </div>
    </div>
    <div class="countBtn countBtn_mg fixedBox" style="text-align: center">
        <%--<a href="javascript:;">取消</a>--%>
        <a href="javascript:void(0);" onclick="submitOrder();" class="on" style="width: 6.6rem;height:0.8rem;line-height: 0.8rem;">提交订单</a>
    </div>
</form>
<!--遮罩层-->
<div class="flexBg" style="display: none;"></div>


<!--自提地址的透明背景-->
<%--<div class="pop-mask" onclick="Hidewlay_pop();" style="display: none;"><p>点击此处返回<span></span></p></div>--%>

<!--自提时间的透明背景-->
<%--<div class="pop-mask-ng" style="display: none;"></div>--%>

<!--自提地址-->
<%--<div class="pop-box">--%>
<%--<div class="vadress">--%>
<%--<h3 class="ad_title">为您推荐附近以下自提点</h3>--%>
<%--<div class="vadress_list">--%>
<%--<ul id="storeAddress_ul">--%>

<%--</ul>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>

<!--自提时间-->
<%--<div class="pop-box-timer">--%>
<%--<div class="vadress">--%>
<%--<h3 class="ad_title">自提时间<a href="javascript:HideDate_pop()" class="closePop"></a></h3>--%>
<%--<div class="vad_timer">--%>
<%--<ul id="date_ul">--%>

<%--</ul>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>

<script type="text/javascript" src="<%=basePath%>portal/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>portal/js/function.js"></script>
<script type="text/javascript" src="<%=basePath%>portal/js/layer/layer.js"></script>
<script type="text/javascript">
    $(function () {
        //白名单检验
        var resultDesc = $("#resultDesc").val()
        console.log(resultDesc)
        console.log(resultDesc.length)
        if (resultDesc == "null"){
        }else{
            layer.msg(resultDesc, {icon: 5, time: 1000, offset: 'auto'}, function () {
                window.history.back();
            })
        }
    })
    function submitOrder() {
        console.log($("#submitForm").serialize())
        var pattern = new RegExp("[@&$|;%'\"<>\'+,]");
        if (pattern.test($("#memberMsg").val())) {
            layer.msg('买家留言不能含有特殊符号', {icon: 0, time: 1000});
            return;
        }
        $(".on").css('background', '#999');
        $.ajax({
            url: '<%=basePath%>order/orderSubmit',
            type: 'post',
            dataType: 'json',
            data: $("#submitForm").serialize(),
            success: function (result) {
                if("0" == result.code){
                    console.log("订单提交成功")
                    //订单id
                    var orderId = result.orderId;
                    window.location.href="<%=basePath%>order/returnOrderPayPage?orderId=" + orderId;
                }
                <%--var submitStatus = result.data.submitStatus;--%>
                <%--if ("1" == submitStatus) {--%>
                <%--    //重新登录 -> 登录界面--%>
                <%--    layer.msg('请先登录', {icon: 0, time: 1000}, function () {--%>
                <%--        window.location.href = "${baseURL}/jsp/component/portal/JSP/login/login.jsp?isBack=ajaxBack";--%>
                <%--    });--%>
                <%--} else if ("2" == submitStatus) {--%>
                <%--    //获取下单信息失败--%>
                <%--    layer.msg('下单失败', {icon: 0, time: 1000}, function () {--%>
                <%--        window.location.href = result.data.domain;--%>
                <%--    });--%>
                <%--} else if ("3" == submitStatus) {--%>
                <%--    //库存不足 -> 首页--%>
                <%--    layer.msg('下单失败，请尝试重新下单', {icon: 5, time: 1000}, function () {--%>
                <%--        window.location.href = result.data.domain;--%>
                <%--    });--%>
                <%--} else if ("5" == submitStatus) {--%>
                <%--    //库存不足 -> 首页--%>
                <%--    layer.msg('购买的商品数量超过限购数量', {icon: 5, time: 3000}, function () {--%>
                <%--        window.location.href = result.data.domain;--%>
                <%--    });--%>
                <%--} else if ("6" == submitStatus) {--%>
                <%--    //库存不足 -> 首页--%>
                <%--    layer.msg('下单失效，请重新下单', {icon: 5, time: 3000}, function () {--%>
                <%--        window.location.href = result.data.domain;--%>
                <%--    });--%>
                <%--} else if ("4" == submitStatus) {--%>
                <%--    //调起支付接口--%>
                <%--    var orderNum = result.data.orderNum;--%>

                <%--    &lt;%&ndash;window.location.href = "${baseURL}/jsp/component/portal/JSP/personalcenter/order/order_pay2.jsp?orderId=" + orderNum;&ndash;%&gt;--%>
                <%--    &lt;%&ndash;window.location.href = "${baseURL}/jsp/component/newPortal/detail/order_pay.jsp?orderId=" + orderNum;&ndash;%&gt;--%>
                <%--    window.location.href = "${baseURL}/jsp/component/newPortal/JSP/personalcenter/order/order_pay2.jsp?orderId=" + orderNum;--%>
                <%--} else if ("7" == submitStatus) {--%>
                <%--    layer.msg('获取优惠劵出错,请重新选择优惠券', {time: 1000}, function () {--%>
                <%--        document.location.reload();--%>
                <%--    })--%>
                <%--} else if ("8" == submitStatus) {--%>
                <%--    layer.msg(result.data.resultDesc, {icon: 5, time: 1000, offset: 'auto'}, function () {--%>
                <%--        document.location.reload();--%>
                <%--    })--%>
                <%--}--%>
            },
            error: function (result) {
                //跳转到购物车
                layer.msg('通讯异常，请稍后再试', {icon: 0, time: 1000}, function () {
                    <%--window.location.href = "${baseURL}/jsp/component/portal/JSP/cart/cartList.jsp";--%>
                });
            }
        });

    }
</script>
</body>
</html>
