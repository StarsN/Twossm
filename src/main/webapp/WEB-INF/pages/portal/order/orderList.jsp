<%@ page language="java" import="java.util.*,java.net.URLDecoder" pageEncoding="utf-8"%>
<%@ page import="com.gx.util.SysConstant" %>
<%@ page import="com.gx.member.domain.TbMemberPO" %>
<%
    //获取请求上下文
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String orderStatus = request.getParameter("orderStatus");
    System.out.print("在订单列表页面获取的orderStatus=" + orderStatus);
    TbMemberPO memberPO = (TbMemberPO) request.getSession().getAttribute("tbMemberPO");
    String memberId = memberPO.getMemberId();
    System.out.print("在订单列表中获取的memberId=" + memberId);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="black" name="apple-mobile-web-app-status-bar-style">
    <meta content="telephone=no" name="format-detection">
    <meta content="email=no" name="format-detection">
    <title></title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>portal/css/base.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>portal/css/style.css"/>
    <script src="<%=basePath%>portal/js/adaptive.js"></script>
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
</head>
<body>
<input id="orderStatus" value="<%=orderStatus%>" hidden>
<input id="memberId" value="<%=memberId%>" hidden>
<div class="container">

    <!--
        如果有底部菜单栏：pb98s
    -->
    <div class="content">

        <!--
            订单
        -->
        <div class="all_orderPage" id="all_orderPage">
            <!--
                nav
            -->
            <div class="orderNav">
                <ul>
                    <li id="o1"><a href="<%=basePath%>order/returnOrderListPage">全部</a></li>
                    <li id="o2"><a href="<%=basePath%>order/returnOrderListPage?orderStatus=1">待付款</a></li>
                    <li id="o3"><a href="<%=basePath%>order/returnOrderListPage?orderStatus=2">待发货</a></li>
                    <li id="o4"><a href="<%=basePath%>order/returnOrderListPage?orderStatus=3">配送中</a></li>
                    <li><a href="#">  售后</a></li>
                </ul>
            </div>
            <div class="order_content_item allOrder" id="allOrder" style="display: block;">
                <div id="ul">
                    <!--数据条-->
                </div>
            </div>
<%--            <div class="order_content">--%>
<%--                <!----%>
<%--                    全部--%>
<%--                -->--%>
<%--                <div class="order_content_item" id="" style="display: block;">--%>
<%--                    <ul>--%>
<%--                        <li>--%>
<%--                            <div class="car_menu_list">--%>
<%--                                <h3 class="car_menu_top autoHeight">--%>
<%--                                    <div class="fl car_menu_top_l">--%>
<%--                                        <div class="fl bdName"><i class="icoDp"></i><span>广东省移动分公司</span></div>--%>
<%--                                    </div>--%>
<%--                                    <div class="fr buyerState">待付款</div>--%>
<%--                                </h3>--%>
<%--                                <div class="car_menu_list_info">--%>
<%--                                    <a class="car_list_dShow" href="#">--%>
<%--                                        <div class="fl car_list_dShow_img"><img src="<%=basePath%>portal/images/mobile/mobile01.png" alt="img"></div>--%>
<%--                                        <div class="car_list_dShow_info">--%>
<%--                                            <p class="mobile_db">iPhone X 全面屏手机 灰色256g</p>--%>
<%--                                            <h3>裸机_黑色_128G<span class="fr cNum">x<em>1</em></span></h3>--%>
<%--                                            <h4><span class="fl c_price">¥ 7628</span></h4>--%>
<%--                                            <b class="sawPdPhoto">商品快照</b>--%>
<%--                                        </div>--%>
<%--                                    </a>--%>
<%--                                    <div class="countPriceBox">--%>
<%--                                        <p>--%>
<%--                                            <span class="fl odbmums">订单编号<b>1545456232326</b></span>--%>
<%--                                            <b class="fr">实付<span>￥1798.00</span></b>--%>
<%--                                        </p>--%>
<%--                                    </div>--%>
<%--                                    <div class="countBtn">--%>
<%--                                        <a href="javascript:;">取消</a>--%>
<%--                                        <a href="javascript:;" class="on">付款</a>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </li>--%>
<%--                        <li>--%>
<%--                            <div class="car_menu_list">--%>
<%--                                <h3 class="car_menu_top autoHeight">--%>
<%--                                    <div class="fl car_menu_top_l">--%>
<%--                                        <div class="fl bdName"><i class="icoDp"></i><span>广东省移动分公司</span></div>--%>
<%--                                    </div>--%>
<%--                                    <div class="fr buyerState buyerStateOutTimer">超时关闭</div>--%>
<%--                                </h3>--%>
<%--                                <div class="car_menu_list_info">--%>
<%--                                    <a class="car_list_dShow" href="#">--%>
<%--                                        <div class="fl car_list_dShow_img"><img src="<%=basePath%>portal/images/mobile/mobile03.png" alt="img"></div>--%>
<%--                                        <div class="car_list_dShow_info">--%>
<%--                                            <p class="mobile_db">iPhone X 全面屏手机 灰色256g</p>--%>
<%--                                            <h3>裸机_黑色_128G<span class="fr cNum">x<em>1</em></span></h3>--%>
<%--                                            <h4><span class="fl c_price">¥ 7628</span></h4>--%>
<%--                                            <b class="sawPdPhoto">商品快照</b>--%>
<%--                                        </div>--%>
<%--                                    </a>--%>
<%--                                    <div class="countPriceBox">--%>
<%--                                        <p>--%>
<%--                                            <span class="fl odbmums">订单编号<b>1545456232326</b></span>--%>
<%--                                            <b class="fr">实付<span>￥1798.00</span></b>--%>
<%--                                        </p>--%>
<%--                                    </div>--%>
<%--                                    <div class="countBtn">--%>
<%--                                        <a href="javascript:showDelPop()">删除订单</a>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </li>--%>
<%--                    </ul>--%>
<%--                </div>--%>

<%--                <!----%>
<%--                    待付款--%>
<%--                -->--%>
<%--                <div class="order_content_item" id="">--%>
<%--                    <ul>--%>
<%--                        <li>--%>
<%--                            <div class="car_menu_list">--%>
<%--                                <h3 class="car_menu_top autoHeight">--%>
<%--                                    <div class="fl car_menu_top_l">--%>
<%--                                        <div class="fl bdName"><i class="icoDp"></i><span>广东省移动分公司</span></div>--%>
<%--                                    </div>--%>
<%--                                    <div class="fr buyerState">待付款</div>--%>
<%--                                </h3>--%>
<%--                                <div class="car_menu_list_info">--%>
<%--                                    <a class="car_list_dShow" href="#">--%>
<%--                                        <div class="fl car_list_dShow_img"><img src="<%=basePath%>portal/images/mobile/mobile05.png" alt="img"></div>--%>
<%--                                        <div class="car_list_dShow_info">--%>
<%--                                            <p class="mobile_db">iPhone X 全面屏手机 灰色256g</p>--%>
<%--                                            <h3>裸机_黑色_128G<span class="fr cNum">x<em>1</em></span></h3>--%>
<%--                                            <h4><span class="fl c_price">¥ 7628</span></h4>--%>
<%--                                            <b class="sawPdPhoto">商品快照</b>--%>
<%--                                        </div>--%>
<%--                                    </a>--%>
<%--                                    <div class="countPriceBox">--%>
<%--                                        <p>--%>
<%--                                            <span class="fl odbmums">订单编号<b>1545456232326</b></span>--%>
<%--                                            <b class="fr">实付<span>￥1798.00</span></b>--%>
<%--                                        </p>--%>
<%--                                    </div>--%>
<%--                                    <div class="countBtn">--%>
<%--                                        <a href="javascript:;">取消</a>--%>
<%--                                        <a href="javascript:;" class="on">付款</a>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </li>--%>
<%--                    </ul>--%>
<%--                </div>--%>

<%--                <!----%>
<%--                    待发货--%>
<%--                -->--%>
<%--                <div class="order_content_item" id="">--%>
<%--                    <ul>--%>
<%--                        <li>--%>
<%--                            <div class="car_menu_list">--%>
<%--                                <h3 class="car_menu_top autoHeight">--%>
<%--                                    <div class="fl car_menu_top_l">--%>
<%--                                        <div class="fl bdName"><i class="icoDp"></i><span>广东省移动分公司</span></div>--%>
<%--                                    </div>--%>
<%--                                    <div class="fr buyerState">待发货</div>--%>
<%--                                </h3>--%>
<%--                                <div class="car_menu_list_info">--%>
<%--                                    <a class="car_list_dShow" href="#">--%>
<%--                                        <div class="fl car_list_dShow_img"><img src="<%=basePath%>portal/images/mobile/mobile01.png" alt="img"></div>--%>
<%--                                        <div class="car_list_dShow_info">--%>
<%--                                            <p class="mobile_db">iPhone X 全面屏手机 灰色256g</p>--%>
<%--                                            <h3>裸机_黑色_128G<span class="fr cNum">x<em>1</em></span></h3>--%>
<%--                                            <h4><span class="fl c_price">¥ 7628</span></h4>--%>
<%--                                            <b class="sawPdPhoto">商品快照</b>--%>
<%--                                        </div>--%>
<%--                                    </a>--%>
<%--                                    <div class="countPriceBox">--%>
<%--                                        <p>--%>
<%--                                            <span class="fl odbmums">订单编号<b>1545456232326</b></span>--%>
<%--                                            <b class="fr">实付<span>￥1798.00</span></b>--%>
<%--                                        </p>--%>
<%--                                    </div>--%>
<%--                                    <div class="countBtn">--%>
<%--                                        <a href="javascript:;">取消</a>--%>
<%--                                        <a href="javascript:;" class="on">付款</a>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </li>--%>
<%--                    </ul>--%>
<%--                </div>--%>

<%--                <!----%>
<%--                    配送中--%>
<%--                -->--%>
<%--                <div class="order_content_item" id="">--%>
<%--                    <ul>--%>
<%--                        <li>--%>
<%--                            <div class="car_menu_list">--%>
<%--                                <h3 class="car_menu_top autoHeight">--%>
<%--                                    <div class="fl car_menu_top_l">--%>
<%--                                        <div class="fl bdName"><i class="icoDp"></i><span>广东省移动分公司</span></div>--%>
<%--                                    </div>--%>
<%--                                    <div class="fr buyerState">配送中</div>--%>
<%--                                </h3>--%>
<%--                                <div class="car_menu_list_info">--%>
<%--                                    <a class="car_list_dShow" href="#">--%>
<%--                                        <div class="fl car_list_dShow_img"><img src="<%=basePath%>portal/images/mobile/mobile01.png" alt="img"></div>--%>
<%--                                        <div class="car_list_dShow_info">--%>
<%--                                            <p class="mobile_db">iPhone X 全面屏手机 灰色256g</p>--%>
<%--                                            <h3>裸机_黑色_128G<span class="fr cNum">x<em>1</em></span></h3>--%>
<%--                                            <h4><span class="fl c_price">¥ 7628</span></h4>--%>
<%--                                            <b class="sawPdPhoto">商品快照</b>--%>
<%--                                        </div>--%>
<%--                                    </a>--%>
<%--                                    <div class="countPriceBox">--%>
<%--                                        <p>--%>
<%--                                            <span class="fl odbmums">订单编号<b>1545456232326</b></span>--%>
<%--                                            <b class="fr">实付<span>￥1798.00</span></b>--%>
<%--                                        </p>--%>
<%--                                    </div>--%>
<%--                                    <div class="countBtn">--%>
<%--                                        <a href="javascript:;">售后服务</a>--%>
<%--                                        <a href="javascript:;">查看物流</a>--%>
<%--                                        <a href="javascript:;" class="on">确认售后</a>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </li>--%>
<%--                    </ul>--%>
<%--                </div>--%>

<%--                <!----%>
<%--                      售后--%>
<%--                -->--%>
<%--                <div class="order_content_item" id="">--%>
<%--                    <ul>--%>
<%--                        <li>--%>
<%--                            <div class="car_menu_list">--%>
<%--                                <h3 class="car_menu_top autoHeight">--%>
<%--                                    <div class="fl car_menu_top_l">--%>
<%--                                        <div class="fl bdName"><i class="icoDp"></i><span>广东省移动分公司</span></div>--%>
<%--                                    </div>--%>
<%--                                    <div class="fr buyerState">售后</div>--%>
<%--                                </h3>--%>
<%--                                <div class="car_menu_list_info">--%>
<%--                                    <a class="car_list_dShow" href="#">--%>
<%--                                        <div class="fl car_list_dShow_img"><img src="<%=basePath%>portal/images/mobile/mobile01.png" alt="img"></div>--%>
<%--                                        <div class="car_list_dShow_info">--%>
<%--                                            <p class="mobile_db">iPhone X 全面屏手机 灰色256g</p>--%>
<%--                                            <h3>裸机_黑色_128G<span class="fr cNum">x<em>1</em></span></h3>--%>
<%--                                            <h4><span class="fl c_price">退款金额<b>¥ 7628</b></span></h4>--%>
<%--                                        </div>--%>
<%--                                    </a>--%>
<%--                                    <div class="countPriceBox">--%>
<%--                                        <p>--%>
<%--                                            <span class="fl odbmums">订单编号<b>1545456232326</b></span>--%>
<%--                                            <b class="fr">仅退款  待商家确认</b>--%>
<%--                                        </p>--%>
<%--                                    </div>--%>
<%--                                    <div class="sale_count">--%>
<%--                                        共计<b>¥ 7628</b>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </li>--%>
<%--                        <li>--%>
<%--                            <div class="car_menu_list">--%>
<%--                                <h3 class="car_menu_top autoHeight">--%>
<%--                                    <div class="fl car_menu_top_l">--%>
<%--                                        <div class="fl bdName"><i class="icoDp"></i><span>广东省</span></div>--%>
<%--                                    </div>--%>
<%--                                    <div class="fr buyerState">售后</div>--%>
<%--                                </h3>--%>
<%--                                <div class="car_menu_list_info">--%>
<%--                                    <a class="car_list_dShow" href="#">--%>
<%--                                        <div class="fl car_list_dShow_img"><img src="<%=basePath%>portal/images/mobile/mobile01.png" alt="img"></div>--%>
<%--                                        <div class="car_list_dShow_info">--%>
<%--                                            <p class="mobile_db">iPhone X 全面屏手机 灰色256g</p>--%>
<%--                                            <h3>裸机_黑色_128G<span class="fr cNum">x<em>1</em></span></h3>--%>
<%--                                            <h4><span class="fl c_price">退款金额<b>¥ 7628</b></span></h4>--%>
<%--                                        </div>--%>
<%--                                    </a>--%>
<%--                                    <div class="countPriceBox">--%>
<%--                                        <p>--%>
<%--                                            <span class="fl odbmums">订单编号<b>1545456232326</b></span>--%>
<%--                                            <b class="fr">仅退款  待商家确认</b>--%>
<%--                                        </p>--%>
<%--                                    </div>--%>
<%--                                    <div class="sale_count">--%>
<%--                                        共计<b>¥ 7628</b>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </li>--%>
<%--                    </ul>--%>
<%--                </div>--%>

<%--            </div>--%>

        </div>
        <!--
            end 订单
        -->
    </div>
</div>


<!--透明背景-->
<div class="flexBg" style="display:none"></div>

<!--
     删除订单弹窗
-->
<div class="popMod commonPopLayer" id="delOrderPop" style="display:none">
    <div class="popMain">
        <div class="popInfo">
            <img src="<%=basePath%>portal/images/new_pdimg/icon_ero.png" class="eroImg"/>
            <p>您确定要删除订单吗？</p>
        </div>
    </div>
    <div class="bBtn">
        <a href="javascript:;" class="popCancel">取 消</a>
        <a href="javascript:;" class="popSure">确 定</a>
    </div>
</div>


<script type="text/javascript" src="<%=basePath%>portal/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>portal/js/function.js"></script>
<script type="text/javascript" src="<%=basePath%>portal/js/layer/layer.js"></script>
<script type="text/javascript">
    var memberId;
    var orderStatus;
    //初始化
    $(function () {
        memberId = $("#memberId").val();
        orderStatus = $("#orderStatus").val();
        console.log("初始化memberId=" + memberId +",orderStatus=" + orderStatus)
        initTabCss();
        getOrder();
    })
    //tab样式
    function initTabCss() {
        var orderStatus = $("#orderStatus").val();
        console.log("在在initTabCss获取orderStatus=" + orderStatus)
        if (orderStatus == 1) {
            $("#o2").addClass("active");
        }else if (orderStatus == 2) {
            console.log("进来渲染")
            $("#o3").addClass("active");
        }else if (orderStatus == 3) {
            $("#o4").addClass("active");
        }else{
            $("#o1").addClass("active");
        }
    }

    function getOrder() {
        var flag = true;//先查看是否有订单
        $.ajax({
            url: '<%=basePath%>order/getOrderIds?orderStatus=' + orderStatus,
            type: 'post',
            async: false,//ajax同步。
            dataType: 'json',
            success: function (result) {
                var tbOrderInfoPOs = result.tbOrderInfoPOs;
                console.log(tbOrderInfoPOs)
                if (tbOrderInfoPOs.length == 0) {//若没有订单。
                    var DIV = '';
                    var divOrder = '<br/> <p style="text-align: center;color: #666;font-size: 0.24rem;">居然还没有订单~</p> <br/>'
                        + '<a onclick="goIndex()"><p style="text-align: center;color: #0080ff;font-size: 0.24rem;"><u>去逛逛</u></p></a>';
                    DIV += divOrder;//拼接每一条订单的信息
                    $("#allOrder").html(DIV);
                    // $("#order_content_item").html(DIV);
                    flag = false;
                }
            }
        });
        if (!flag) return;//没有订单则跳出

        //渲染
        // 拼接HTML
        var DIV = '';
        $.ajax({
            url: '<%=basePath%>order/getOrder?orderStatus=' + orderStatus,
            type: 'post',
            dataType: 'json',
            success: function (result) {
                var OrderPageVO = result.OrderPagerVO;
                if (OrderPageVO.length > 0) {
                    //订单信息
                    for (var i = 0; i < OrderPageVO.length; i++) {
                        //查看订单状态,在每条订单下面拼接相应的按钮
                        var orderStatus = OrderPageVO[i].tbOrderInfoVO.orderStatus;
                        var payStatus = OrderPageVO[i].tbOrderInfoVO.payStatus;
                        var status = '';//按钮
                        var status0 = '';//订单项跳转链接
                        var orderId = OrderPageVO[i].tbOrderInfoVO.orderId;
                        var payId = OrderPageVO[i].tbOrderInfoVO.payId;
                        //orderStatus: 0-买家取消1-待付款 2-待发货 3-待收货 10-已完成 5-退款处理中 6-已退款7-超时关闭8-已退货9-买家已收货 12-待拆单 13已拆单
                        if (orderStatus == "0" || orderStatus == "7") {
                            status0 = '${baseURL}/jsp/component/portal/JSP/personalcenter/order/order_cancel.jsp?orderId=' + orderId + '';
                            <%--status = '<a href="javascript:void(0);" onclick="order_delete(\'' + orderId + '\',\'${param.memberId}\')" class="countBtn">删除订单</a>' +--%>
                            <%--status = '<a href="javascript:void(0);" onclick="order_delete(\'' + orderId + '\',\'${param.memberId}\')">删除订单</a>' +--%>
                            status = '<a href="javascript:void(0);" onclick="showDelPop(\'' + orderId + '\',\'${param.memberId}\')">删除订单</a>' +
                                '<a href="' + status0 + '">查看详情 </a>'
                        }
                        var confirmReceive = "", waitPay = "";
                        if (orderStatus == "3") {
                            confirmReceive = '<a href="javascript:void(0);" onclick="confirmGoods(\'' + orderStatus + '\',\'' + orderId + '\')" class="on">确认收货</a>';
                            status = confirmReceive + waitPay + '<a href="javascript:void(0);" onclick="rm_order_deal(\'' + orderId + '\')">订单详情</a>';
                            status0 = '${baseURL}/orderManage/rentMerchandiseAction!rentOrderInfo.action?orderId=' + orderId;
                        }
                        if (orderStatus == "20") {
                            waitPay = '<a href="javascript:void(0);" onclick="rm_order_deal(\'' + orderId + '\')">去支付</a>';
                            status = confirmReceive + waitPay + '<a href="javascript:void(0);" onclick="rm_order_deal(\'' + orderId + '\')">订单详情</a>';
                            status0 = '${baseURL}/orderManage/rentMerchandiseAction!rentOrderInfo.action?orderId=' + orderId;
                        }
                        if (orderStatus == "1") {
                            <%--status0 = '${baseURL}/jsp/component/portal/JSP/personalcenter/order/order_pay2.jsp?orderId=' + orderId + '';--%>
                            <%--status0 = '${baseURL}/jsp/component/newPortal/detail/order_pay.jsp?orderId=' + orderId + '';--%>
                            status0 = '${baseURL}/jsp/component/newPortal/JSP/personalcenter/order/order_pay2.jsp?orderId=' + orderId + '';
                            status = '<a href="javascript:void(0);" onclick="_cancel(\'' + orderId + '\',\'${param.memberId}\')">取消</a>' +
                                '<a href="' + status0 + 'class="on">付款</a>';
                        }
                        if (orderStatus == "3") {
                            status0 = '${baseURL}/jsp/component/portal/JSP/personalcenter/order/order_waitConfirm2.jsp?orderId=' + orderId + '';
                            // if (payStatus == 8) {
                            //     status += '<a href="javascript:void(0);" onclick="replay(\'' + payId + '\')" >还款</a>'
                            // }
                            status +=
                                '<a href="javascript:void(0);" onclick="confirmGoods(\'' + orderStatus + '\',\'' + orderId + '\')" class="on">确认收货</a>'
                                + '<a href="${baseURL}/jsp/component/portal/JSP/personalcenter/order/order_route.jsp?orderId=' + orderId + '">查看物流</a>'
                                <%--+ '<a href="${baseURL}/jsp/component/portal/JSP/afterSale/drawback_nextStept.jsp?orderId=' + orderId + '">售后服务</a>'--%>
                                + '<a href="${baseURL}/jsp/component/newPortal/JSP/afterSale/drawback_nextStept.jsp?orderId=' + orderId + '">售后服务</a>'
                                + '<a href="' + status0 + '">查看详情</a>';
                        }
                        if (orderStatus == "2") {
                            status0 = '${baseURL}/jsp/component/portal/JSP/personalcenter/order/order_waitSend2.jsp?orderId=' + orderId + '';
                            // if (payStatus == 8) {
                            //     status += '<a href="javascript:void(0);" onclick="replay(\'' + payId + '\')" >还款</a>'
                            // }
                            status +=
                                <%--'<a href="${baseURL}/jsp/component/portal/JSP/afterSale/drawback_nextStept.jsp?orderId=' + orderId + '">售后服务</a>'--%>
                                '<a href="${baseURL}/jsp/component/newPortal/JSP/afterSale/drawback_nextStept.jsp?orderId=' + orderId + '">售后服务</a>'
                                + '<a href="' + status0 + '">查看详情</a>';
                        }
                        <%--if (orderStatus == "10") {--%>
                        <%--    status0 = '${baseURL}/jsp/component/portal/JSP/personalcenter/order/order_complete.jsp?orderId=' + orderId + '';--%>

                        <%--    // if (payStatus == 8) {--%>
                        <%--    //     status += '<a href="javascript:void(0);" onclick="replay(\'' + payId + '\')" >还款</a>'--%>
                        <%--    // }--%>
                        <%--    if(OrderPageVO[i].tbOrderInfoVO.isEvoucher == 1){--%>
                        <%--        status += '<a href="' + status0 + '">查看详情 </a>'--%>
                        <%--    }else{--%>
                        <%--        status += '<a href="${baseURL}/jsp/component/portal/JSP/personalcenter/order/order_route.jsp?orderId=' + orderId + '">查看物流</a>'--%>
                        <%--            + '<a href="' + status0 + '">查看详情 </a>';--%>
                        <%--    }--%>
                        <%--}--%>
                        if (orderStatus == "9") {
                            status0 = '${baseURL}/jsp/component/portal/JSP/personalcenter/order/order_waitConfirm3.jsp?orderId=' + orderId + '';
                            <%--status = '<a href="${baseURL}/jsp/component/portal/JSP/afterSale/drawback_nextStept.jsp?orderId=' + orderId + '">售后服务</a>'--%>
                            status = '<a href="${baseURL}/jsp/component/newPortal/JSP/afterSale/drawback_nextStept.jsp?orderId=' + orderId + '">售后服务</a>'
                                + '<a href="' + status0 + '">查看详情 </a>'
                        }

                        <%--if (orderStatus == "15") {--%>
                        <%--    status0 = '${baseURL}/jsp/component/portal/JSP/personalcenter/order/order_wait_continue_pay.jsp?orderId=' + orderId + '';--%>
                        <%--    status =--%>
                        <%--        '<a href="javascript:void(0);" onclick="continuePay(\'' + orderId + '\')" >继续支付</a>'--%>
                        <%--        + '<a href="' + status0 + '">查看详情 </a>';--%>
                        <%--}--%>
                        <%--if (orderStatus == 14) {--%>
                        <%--    status0 = '${baseURL}/jsp/component/portal/JSP/personalcenter/order/order_wait_paying.jsp?orderId=' + orderId + '';--%>
                        <%--    status =--%>
                        <%--        '<a href="javascript:void(0);" onclick="payAgain(\'' + payId + '\',\'' + orderId + '\')" >重新支付</a>';--%>
                        <%--}--%>
                        //订单异常
                        if (orderStatus == "11") {
                            status0 = '##';
                            status = '';
                        }
                        //待拆单
                        <%--if (orderStatus == 12) {--%>
                        <%--    status0 = '${baseURL}/jsp/component/portal/JSP/personalcenter/order/order_waitSend2.jsp?orderId=' + orderId + '';--%>
                        <%--    status =--%>
                        <%--        &lt;%&ndash;'<a href="${baseURL}/jsp/component/portal/JSP/afterSale/drawback_nextStept.jsp?orderId=' + orderId + '">售后服务</a>'&ndash;%&gt;--%>
                        <%--        '<a href="${baseURL}/jsp/component/newPortal/JSP/afterSale/drawback_nextStept.jsp?orderId=' + orderId + '">售后服务</a>'--%>
                        <%--        + '<a href="' + status0 + '">查看详情</a>';--%>
                        <%--}--%>

                        //订单项信息
                        var item = '';
                        // var rentSupplier = OrderPageVO[i].tbOrderInfoVO.rentSupplier;
                        for (var j = 0; j < OrderPageVO[i].tbOrderItemVOList.length; j++) {
                            // var assessmentId = OrderPageVO[i].itemList[j].assessmentId;
                            //添加评价入口
                            var itemList =
                                '<ul>' +
                                '<li>' +
                                // '<a class="car_list_dShow" href="' + status0 + '">' +
                                // '<div class="fl car_list_dShow_img" ><img src="' + OrderPageVO[i].itemList[j].imagePath + '"/></div></a>' +
                                '<a class="car_list_dShow" href="' + status0 + '">' +
                                '<div class="fl car_list_dShow_img" ><img src="' + OrderPageVO[i].tbOrderItemVOList[j].imagePath + '"/></div>' +
                                '<div class="car_list_dShow_info">';
                            //图片
                            // if ((orderStatus == "9" || orderStatus == "10")) {
                            //     if (assessmentId && assessmentId != '') {//已评论
                            //         itemList += '<div class="fr mypinglun" style="margin: 0 0.2rem 0.rem 0.2rem;font-size:0.22rem" onclick=\"toAssessmentPage(\'' + OrderPageVO[i].tbOrderItemVOList[j].orderItemId + '\')\">我的评价</div>';
                            //     } else {//待评论
                            //         itemList += '<div class="fr buyerState pinglun" style="margin: 0 0.2rem 0.1rem 0.2rem;" onclick=\"toAssessmentPage(\'' + OrderPageVO[i].tbOrderItemVOList[j].orderItemId + '\')\">评价</div>';
                            //     }
                            // }
                            itemList +=
                                //订单项
                                '       <p class="mobile_db" name="merchandiseName">' + OrderPageVO[i].tbOrderItemVOList[j].merchandiseName + '</p>' +
                                '       <h3>' + OrderPageVO[i].tbOrderItemVOList[j].attributeDesc + '<span class="fr cNum">x<em >' + OrderPageVO[i].tbOrderItemVOList[j].buyNum + '</em></span></h3>' +
                                '       <h4>￥' + OrderPageVO[i].tbOrderItemVOList[j].cashPrice + '</h4>' + (
                                    (OrderPageVO[i].tbOrderItemVOList[j].isScreenshot == "1" && OrderPageVO[i].tbOrderItemVOList[j].screenshot == "1") ?
                                        ('<label class="sawPdPhoto"' +
                                            ' onclick=\"toScreenshotPage(\'' + OrderPageVO[i].tbOrderItemVOList[j].orderItemId +
                                            '\')\">商品快照</label>') : (""))+
                                '   </div>' +
                                '</a>' +
                                '</li>' +
                                '</ul>';
                            item += itemList; //订单项信息
                        }
                        var divOrder =
                            '<div class="car_menu_list" >' +
                            '   <h3 class="car_menu_top autoHeight">' +
                            '       <div class="fl car_menu_top_l">' +
                            '           <div class="fl bdName"><i class="icoDp"></i><span >' + OrderPageVO[i].tbOrderInfoVO.merchantName + '</span></div>' +
                            '       </div>' +
                            '       <div class="fr buyerState" >' + OrderPageVO[i].tbOrderInfoVO.orderStatusDesc + '</div>' +
                            '   </h3>' +
                            '   <div class="car_menu_list_info " >' +
                            item +  //添加订单项信息
                            '   <div class="countPriceBox">'+
                            '       <p>' +
                            '           <span class="fl odbmums">订单编号：<b>' + OrderPageVO[i].tbOrderInfoVO.orderId + '</b></span>'+
                            '<b class="fr">' + "实付" +
                            '           <span > ￥'  + OrderPageVO[i].tbOrderInfoVO.cashAmount + '</span></b></p></div>' +
                            '   <div class="countBtn" id="countBut">' +
                            status +   //添加对应按钮
                            '   </div>' +
                            '   </div>' +
                            '</div>';
                        DIV += divOrder;//拼接每一条订单的信息
                    }
                    // 如果没有数据
                    $('#ul').html(DIV);
                }
            },
            error: function (xhr, type) {
                // alert('Ajax error!');
                // 即使加载出错，也得重置
            }
        })
    }
    /*切换*/
    $('.orderNav').on('click','li',function(){
        var el=$(this);
        var curIndex=0;
        var order_content_item=$('.order_content_item');
        curIndex = $('.orderNav li').index(this);
        el.addClass('active').siblings().removeClass('active');
        order_content_item.siblings().eq(curIndex).show().siblings().hide();
    });

    /*
  * 显示弹窗
  */
    function showDelPop(){
        $('.flexBg,#delOrderPop').show();
    }

    /*
     * 关闭弹窗
     */
    $('.popSure,.popCancel').on('click',function(){
        $('#delOrderPop,.flexBg').hide();
    });


</script>
</body>
</html>
