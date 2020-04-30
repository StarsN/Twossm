<%@ page language="java" import="java.util.*,java.net.URLDecoder" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.gx.merchandise.domain.OrderBillPO" %>
<%@ page import="com.gx.merchandise.domain.TbMerchandiseInfoPO" %>
<%@ page import="com.gx.merchant.domain.TbMerchantPO" %>
<%@ page import="com.gx.address.domian.TbAddressPO" %>
<%@ page import="com.gx.portal.cart.domain.TbCartInfoPVO" %>
<%@ page import="com.gx.portal.cart.domain.TbCartInfoVO" %>
<%
    //获取请求上下文
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    //获取到购物车信息
    List<TbCartInfoVO> cartList = (List<TbCartInfoVO>) request.getAttribute("cartList");
    //获取到总金额
    Double totalPrice = (Double) request.getAttribute("totalPrice");
    //获取默认地址
    TbAddressPO tbAddressPO = (TbAddressPO) request.getAttribute("address");
    //获取商家
    TbMerchantPO tbMerchantPO = (TbMerchantPO) request.getAttribute("tbMerchantPO");
    //购物车ids
    String cartIds = request.getParameter("cartIds");

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
    <input type="hidden" name="addressId" id="addressId" value="<%=tbAddressPO.getAddressId()%>">
    <input type="hidden" name="cartIds" id="cartIds" value="<%=cartIds%>">
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
                                    <ul>
                                        <c:forEach items="${cartList}" var="li">
                                        <li>
                                                <div class="car_menu_producter">
                                                    <div class="car_list_dShow" href="#">
                                                        <div class="fl car_list_dShow_img"><img src="${li.imagePath }" alt="img"></div>
                                                        <div class="car_list_dShow_info">
                                                            <p class="mobile_db">${li.merchandiseName }</p>
                                                            <h3><span class="fr cNum">x<em>${li.buyNum }</em></span></h3>
                                                            <h4><span class="fl c_price">¥ ${li.cashPrice }</span></h4>
                                                                <%--<b class="sawPdPhoto">商品快照</b>--%>
                                                        </div>
                                                    </div>
                                                </div>
                                        </li>
                                        </c:forEach>
                                    </ul>
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
<script type="text/javascript" src="<%=basePath%>portal/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>portal/js/function.js"></script>
<script type="text/javascript" src="<%=basePath%>portal/js/layer/layer.js"></script>
<script type="text/javascript">

    function submitOrder() {
        console.log($("#submitForm").serialize())
        var pattern = new RegExp("[@&$|;%'\"<>\'+,]");
        if (pattern.test($("#memberMsg").val())) {
            layer.msg('买家留言不能含有特殊符号', {icon: 0, time: 1000});
            return;
        }
        $(".on").css('background', '#999');
        $.ajax({
            url: '<%=basePath%>order/cartOrderSubmit',
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
