<%@ page language="java" import="java.util.*,java.net.URLDecoder" pageEncoding="utf-8"%>
<%@ page import="cn.com.do1.dqdp.core.ConfigMgr" %>
<%
    //获取请求上下文
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    //获取到订单id
    String orderId = request.getParameter("orderId");
    System.out.print("在orderCancel页面获取到的orderId=" + orderId);
    int failureTime = 2;//引入配置管理的失效时间,默认60分钟

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
    <title>交易取消订单详情</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>portal/css/base.css" />
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
<input id="failureTime" value="<%=failureTime%>" hidden>
<input id="orderId" value="<%=orderId%>" hidden>
<div id="allOrder">
</div>
<%--<div class="container">--%>

<%--    <!----%>
<%--        如果有底部菜单栏：pb98s--%>
<%--    -->--%>
<%--    <div class="content">--%>

<%--        <!----%>
<%--            待付款详情--%>
<%--        -->--%>
<%--        <div class="all_orderPage">--%>

<%--            <div class="order_content">--%>

<%--                <!----%>
<%--                    待付款头部用户信息--%>
<%--                -->--%>
<%--                <div class="dpayTop">--%>
<%--                    <dl>--%>
<%--                        <dt>--%>
<%--                            <i class="icon_pay_wait"></i>--%>
<%--                        </dt>--%>
<%--                        <dd>--%>
<%--                            <div class="dpayStatue">--%>
<%--                                <h3>等待买家付款</h3>--%>
<%--                                <p>请于58分钟内付款，超时订单将自动关闭</p>--%>
<%--                            </div>--%>
<%--                        </dd>--%>
<%--                    </dl>--%>
<%--                    <dl>--%>
<%--                        <dt>--%>
<%--                            <i class="icon_pay_position"></i>--%>
<%--                        </dt>--%>
<%--                        <dd>--%>
<%--                            <div class="dpayuserInfo">--%>
<%--                                <h3><span>苏连基</span><span>18556325123</span></h3>--%>
<%--                                <p>广东省广州市天河区员村一横路3号（道一信息）</p>--%>
<%--                            </div>--%>
<%--                        </dd>--%>
<%--                    </dl>--%>
<%--                </div>--%>

<%--                <div class="order_content_item" id="" style="display: block;">--%>
<%--                    <div class="car_menu_list car_menu_listNot">--%>
<%--                        <h3 class="car_menu_top autoHeight">--%>
<%--                            <div class="fl car_menu_top_l">--%>
<%--                                <div class="fl bdName"><i class="icoDp"></i><span>广东省移动分公司</span></div>--%>
<%--                            </div>--%>
<%--                        </h3>--%>
<%--                        <div class="car_menu_list_info">--%>
<%--                            <a class="car_list_dShow" href="#">--%>
<%--                                <div class="fl car_list_dShow_img"><img src="images/mobile/mobile01.png" alt="img"></div>--%>
<%--                                <div class="car_list_dShow_info">--%>
<%--                                    <p class="mobile_db">iPhone X 全面屏手机 灰色256g</p>--%>
<%--                                    <h3>裸机_黑色_128G<span class="fr cNum">x<em>1</em></span></h3>--%>
<%--                                    <h4><span class="fl c_price">¥ 7628</span></h4>--%>
<%--                                    <b class="sawPdPhoto">商品快照</b>--%>
<%--                                </div>--%>
<%--                            </a>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="order_cm_shower">--%>
<%--                        <dl class="cmdl">--%>
<%--                            <dt>商品金额</dt>--%>
<%--                            <dd>¥ 7628</dd>--%>
<%--                        </dl>--%>
<%--                        <dl class="cmdl">--%>
<%--                            <dt>优惠</dt>--%>
<%--                            <dd>- ¥50</dd>--%>
<%--                        </dl>--%>
<%--                        <dl class="cmdl">--%>
<%--                            <dt>运费</dt>--%>
<%--                            <dd>0</dd>--%>
<%--                        </dl>--%>
<%--                        <dl class="cmdl">--%>
<%--                            <dt>实付金额</dt>--%>
<%--                            <dd>--%>
<%--                                <span class="priceOn">¥ 7522</span>--%>
<%--                            </dd>--%>
<%--                        </dl>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="pd_bottom_info">--%>
<%--                    <div class="order_cm_shower">--%>
<%--                        <div class="order_cm_list">--%>
<%--                            <dl class="cmdl">--%>
<%--                                <dt>配送方式  </dt>--%>
<%--                                <dd>免运费 - 快递发货</dd>--%>
<%--                            </dl>--%>
<%--                            <dl class="cmdl">--%>
<%--                                <dt>买家留言</dt>--%>
<%--                                <dd>无</dd>--%>
<%--                            </dl>--%>
<%--                            <dl class="cmdl">--%>
<%--                                <dt>发票抬头</dt>--%>
<%--                                <dd>广东道一信息技术股份有限公司</dd>--%>
<%--                            </dl>--%>
<%--                        </div>--%>
<%--                        <div class="order_cm_list">--%>
<%--                            <dl class="cmdl">--%>
<%--                                <dt>订单状态</dt>--%>
<%--                                <dd>待付款</dd>--%>
<%--                            </dl>--%>
<%--                            <dl class="cmdl">--%>
<%--                                <dt>订单编号</dt>--%>
<%--                                <dd>1545456232326</dd>--%>
<%--                            </dl>--%>
<%--                            <dl class="cmdl">--%>
<%--                                <dt>创建时间</dt>--%>
<%--                                <dd>2018-09-07</dd>--%>
<%--                            </dl>--%>
<%--                        </div>--%>
<%--                        <!----%>
<%--                            底部按钮--%>
<%--                        -->--%>
<%--                        <div class="countBtn countBtn_mg">--%>
<%--                            <a href="javascript:;">取消</a>--%>
<%--                            <a href="javascript:showPayPop()" class="on" style="margin-right: 0;">付款</a>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>

<%--            </div>--%>
<%--        </div>--%>
<%--        <!----%>
<%--            end 订单--%>
<%--        -->--%>
<%--    </div>--%>
<%--</div>--%>

<!--遮罩层-->
<div class="flexBg" style="display: none;"></div>

<!--付款方式 弹窗-->
<div class="yhq_pop payStylePop">
    <h3 class="yhq_title">支付方式</h3>
    <a href="javascript:hidePayPop()" class="closePop"></a>
    <div class="yhq_pop_info">
        <ul id="payStyle_item" class="payStyle_item">
            <li>
                <div class="pay_icon">
                    <img src="<%=basePath%>portal/images/new_pdimg/icon_pay_wx.png" alt="微信支付"/>
                    <span>微信支付</span>
                </div>
                <div class="pay_radio">
                    <input type="radio" name="pay_style" id="" value="" class="form_check">
                </div>
            </li>
            <%--            <li>--%>
            <%--                <div class="pay_icon">--%>
            <%--                    <img src="images/new_pdimg/icon_pay_zfb.png" alt="支付宝支付"/>--%>
            <%--                    <span>支付宝支付</span>--%>
            <%--                </div>--%>
            <%--                <div class="pay_radio">--%>
            <%--                    <input type="radio" name="pay_style" id="" value="" class="form_check">--%>
            <%--                </div>--%>
            <%--            </li>--%>
            <%--            <li>--%>
            <%--                <div class="pay_icon">--%>
            <%--                    <img src="images/new_pdimg/icon_pay_hb.png" alt="和包支付"/>--%>
            <%--                    <span>和包支付</span>--%>
            <%--                </div>--%>
            <%--                <div class="pay_radio">--%>
            <%--                    <input type="radio" name="pay_style" id="" value="" class="form_check">--%>
            <%--                </div>--%>
            <%--            </li>--%>
        </ul>
    </div>
    <div class="mbtn">
        <a href="javascript:;" class="btn_finish" onclick="">去支付</a>
    </div>
</div>



<script type="text/javascript" src="<%=basePath%>portal/js/jquery-3.2.1.min.js" ></script>
<script type="text/javascript" src="<%=basePath%>portal/js/function.js" ></script>
<script type="text/javascript" src="<%=basePath%>portal/js/layer/layer.js"></script>

<script type="text/javascript">
    $(function () {
        //初始化订单信息
        getOrder();
    })
    //超时订单，取消订单。
    function order_cancel() {
        $.ajax({
            url: '<%=basePath%>order/cancelOrder',
            data: {orderId: $("#orderId").val(), orderStatus: "7"},
            dataType: 'json',
            type: 'post',
            success: function (result) {
                if (result.code == "0") {
                    var index = layer.open({
                        content: '订单已超时关闭！'
                        , time: 2
                        , skin: 'msg'
                    });
                    setTimeout(function () {
                        window.location.href = "<%=basePath%>order/returnOrderCancelPage";
                    }, 1000)
                }
            }
        })
    }
    /*支付方式单选*/
    $('.payStyle_item').on('click','li',function() {
        var el = $(this);
        el.find('.form_check').addClass('form_checkOn').parents().siblings().find('.form_check').removeClass('form_checkOn');
    });


    /*付款方式弹窗*/
    function showPayPop(){
        $('.flexBg').show();
        $('.payStylePop').css("height","5.8rem");
    }

    /*隐藏付款方式弹窗*/
    function hidePayPop(){
        $('.flexBg').hide();
        $('.payStylePop').css("height","0");
    }

    //获取订单信息
    function getOrder() {
        $.ajax({
            url: '<%=basePath%>order/ajaxView?orderId=<%=orderId%>',
            type: 'post',
            async: false,
            dataType: 'json',
            success: function (result) {
                if(result.code=="0"){
                    console.log("获取订单成功")
                    //获取订单信息
                    var OrderPagerVO = result.orderPagePO;
                    var DIV = '';
                    //订单项信息
                    var item = '';
                    for (var i = 0; i < OrderPagerVO.tbOrderItemVOList.length; i++) {
                        var itemList =
                            '<ul>' +
                            '<li>' +
                            '<a class="car_list_dShow" href="' + OrderPagerVO.tbOrderItemVOList[i].publishAddress + "?merchandiseCode=" + OrderPagerVO.tbOrderItemVOList[i].merchandiseCode  + '">' +
                            '<div class="fl car_list_dShow_img" ><img src="' + OrderPagerVO.tbOrderItemVOList[i].imagePath + '"/></div>' +
                            '<div class="car_list_dShow_info">' +
                            '       <p class="mobile_db" name="merchandiseName">' + OrderPagerVO.tbOrderItemVOList[i].merchandiseName + '</p>' +
                            '       <h3>' + OrderPagerVO.tbOrderItemVOList[i].attributeDesc + '<span class="fr cNum">x<em >' + OrderPagerVO.tbOrderItemVOList[i].buyNum + '</em></span></h3>' +
                            '       <h4>￥' + OrderPagerVO.tbOrderItemVOList[i].cashPrice + '</h4>' + (
                                (OrderPagerVO.tbOrderItemVOList[i].isScreenshot == "1" && OrderPagerVO.tbOrderItemVOList[i].screenshot == "1") ?
                                    ('<label class="sawPdPhoto"' +
                                        ' onclick=\"toScreenshotPage(\'' + OrderPagerVO.tbOrderItemVOList[i].orderItemId +
                                        '\')\">商品快照</label>') : (""))+
                            '   </div>' +
                            '</a>' +
                            '</li>' +
                            '</ul>';
                        item += itemList; //订单项信息
                    }
                    //查看是否有合约套餐
                    var contractHTML = "";
                    //O2O是否订单
                    var O2OHTML = '';
                    //加头部
                    var divOrder =
                        '<div class="container">' +
                        '<div class="content">' +
                        '<div class="all_orderPage">' +
                        '<div class="order_content">' +
                        '<div class="dpayTop">' +
                        '<dl>' +
                        '<dt>' +
                        '<i class="icon_pay_wait"></i>' +
                        '</dt>' +
                        '<dd>' +
                        '<div class="dpayStatue">' +
                        '<h3>交易关闭('+ OrderPagerVO.tbOrderInfoVO.orderStatusDesc + ')</h3>' +
                        '</div>' +
                        '</dd>' +
                        '</dl>';
                    // if(OrderPagerVO.tbOrderInfoVO.isEvoucher != "1"){
                    //加收货地址
                    divOrder +=
                        '<dl>' +
                        '<dt>' +
                        '<i class="icon_pay_position"></i>' +
                        '</dt>' +
                        '<dd>' +
                        '<div class="dpayuserInfo">' +
                        '<h3><span>' + OrderPagerVO.tbSupplyInfoVO.inceptPeople + '</span><span>   ' + OrderPagerVO.tbSupplyInfoVO.inceptTel + '</span></h3>' +
                        '<p>' + OrderPagerVO.tbSupplyInfoVO.supplyAddress + '</p>' +
                        '</div>' +
                        '</dd>' +
                        '</dl>';
                    // }
                    divOrder +=                     '</div>';
                    //加店铺
                    divOrder +=
                        '<div class="order_content_item" id="" style="display: block;">' +
                        '<div class="car_menu_list car_menu_listNot">' +
                        '<h3 class="car_menu_top autoHeight">' +
                        '<div class="fl car_menu_top_l">' +
                        '<div class="fl bdName"><i class="icoDp"></i><span>' + OrderPagerVO.tbOrderInfoVO.merchantName + '</span></div>' +
                        '</div>' +
                        '</h3>' +
                        '<div class="car_menu_list_info">' +
                        item +
                        '</div>' +
                        '</div>' ;
                    //加订单金额
                    divOrder +=
                        '<div class="order_cm_shower">' +
                        '<dl class="cmdl">' +
                        '<dt>商品金额</dt>' +
                        '<dd>¥ ' + OrderPagerVO.tbOrderInfoVO.totalAmount + '</dd>' +
                        '</dl>' +
                        '<dl class="cmdl">' +
                        '<dt>优惠</dt>' +
                        // '<dd>- ¥' + OrderPagerVO.tbOrderInfoVO.discountAmount + '</dd>' +
                        '<dd>- ¥' + "00.00" + '</dd>' +
                        '</dl>' +
                        '<dl class="cmdl">' +
                        '<dt>运费</dt>' +
                        // '<dd>' + OrderPagerVO.tbSupplyInfoVO.payAmount + '</dd>' +
                        '<dd>' + 0 + '</dd>' +
                        '</dl>' +
                        '<dl class="cmdl">' +
                        '<dt>实付金额</dt>' +
                        '<dd>' +
                        '<span class="priceOn">¥ ' + OrderPagerVO.tbOrderInfoVO.cashAmount + '</span>' +
                        '</dd>' +
                        '</dl>' +
                        '</div>' +
                        '</div>';
                    //加配送方式
                    divOrder +=
                        '<div class="pd_bottom_info">' +
                        '<div class="order_cm_shower">' +
                        '<div class="order_cm_list">' +
                        O2OHTML +
                        contractHTML +
                        '<dl class="cmdl">' +
                        '<dt>买家留言</dt>' +
                        '<dd>' + OrderPagerVO.tbOrderInfoVO.memberMsg +'</dd>' +
                        '</dl>';
                    divOrder +=
                        '<dl class="cmdl">' +
                        '<dt>发票抬头</dt>' +
                        // '<dd>' +OrderPagerVO.tbOrderInfoVO.invoiceTitle + '</dd>' +
                        '<dd>' + "暂时无" + '</dd>' +
                        '</dl>' +
                        '</div>' +
                        '<div class="order_cm_list">' +
                        '<dl class="cmdl">' +
                        '<dt>订单状态</dt>' +
                        '<dd>' + OrderPagerVO.tbOrderInfoVO.orderStatusDesc + '</dd>' +
                        '</dl>' +
                        '<dl class="cmdl">' +
                        '<dt>订单编号</dt>' +
                        '<dd>' + OrderPagerVO.tbOrderInfoVO.orderId.substring(0,13) + '</dd>' +
                        '</dl>' +
                        '<dl class="cmdl">' +
                        '<dt>创建时间</dt>' +
                        '<dd>' + OrderPagerVO.tbOrderInfoVO.generateTime +'</dd>' +
                        '</dl>' +
                        '<dl class="cmdl">' +
                        '<dt>关闭时间</dt>' +
                        '<dd>' + OrderPagerVO.tbOrderInfoVO.updateTime +'</dd>' +
                        '</dl>' +
                        '</div>' +
                        '<div class="countBtn countBtn_mg">' +
                        '<a href="javascript:;" class="on" style="margin-right: 0;">客服</a>' +
                        '</div>' +
                        '</div>' +
                        '</div>' +
                        '</div>' +
                        '</div>' +
                        '</div>' +
                        '</div>';
                    DIV += divOrder;
                    $("#allOrder").html(DIV);
                }
                <%--var storeVo = result.data.storeVo;--%>
                <%--var OrderPagerVO = result.data.OrderPagerVO;--%>
                <%--var tbSupplyInfoVO = OrderPagerVO.tbSupplyInfoVO;--%>

                <%--if (tbSupplyInfoVO == null) {--%>
                <%--    layer.open({--%>
                <%--        content: '获取配送信息异常，请重新下单！'--%>
                <%--        , time: 2--%>
                <%--        , skin: 'msg'--%>
                <%--    });--%>
                <%--    return;--%>
                <%--}--%>
                <%--var orderStatus = OrderPagerVO.tbOrderInfoVO.orderStatus;//订单状态--%>
                <%--flag = orderStatus;--%>
                <%--var generateTime = OrderPagerVO.tbOrderInfoVO.generateTime.replace(/-/g, "/");//下单时间转为  "2017/08/04 10:03:03"--%>
                <%--generateTime = new Date(generateTime);//将字符串转化为时间--%>
                <%--var day1 = new Date();//当前时间  Fri Aug 04 2017 09:53:56 GMT+0800--%>
                <%--var timeDifference = Math.ceil((day1 - generateTime) / (1000 * 60));//当前时间与下单时间差 ,分钟--%>
                <%--var failureTime = '${failureTime}';//失效时间--%>
                <%--if (timeDifference < failureTime) {--%>
                <%--    var Countdown = failureTime - timeDifference;//倒计时--%>
                <%--} else {--%>
                <%--    Countdown = 0;//倒计时置为0--%>
                <%--    //7-超时关闭,1-待付款,0-买家取消--%>
                <%--    if (orderStatus == 7 || orderStatus == 0) {//如果订单已经关闭，则跳转到交易关闭页面--%>
                <%--        var index = layer.open({--%>
                <%--            content: '订单已超时关闭！'--%>
                <%--            , time: 2--%>
                <%--            , skin: 'msg'--%>
                <%--        });--%>
                <%--        setTimeout(function () {--%>
                <%--            window.location.href = "${baseURL}/jsp/component/portal/JSP/personalcenter/order/order_cancel.jsp?orderId=${param.orderId}";--%>
                <%--        }, 1000)--%>
                <%--    } else {//如果没关闭，则关闭订单。--%>
                <%--        order_cancel();--%>
                <%--    }--%>
                <%--}--%>
                <%--//payWay：微信支付方式：0为公众号支付，1,线下支付，2为和包支付，3为H5支付,4为扫码支付,5微信小程序支付--%>
                <%--var payWayBtn = '<a href="javascript:popPayWay();" id="getJsapiAndPay" class="joint jointOn">去支付</a>';--%>
                <%--var DIV = '';--%>
                <%--//订单信息--%>

                <%--/*&lt;%&ndash;//订单项信息&ndash;%&gt;--%>
                <%--&lt;%&ndash;var item = '';&ndash;%&gt;--%>
                <%--&lt;%&ndash;for (var i = 0; i < OrderPagerVO.itemList.length; i++) {&ndash;%&gt;--%>
                <%--&lt;%&ndash;    var itemList =&ndash;%&gt;--%>
                <%--&lt;%&ndash;        '<ul>' +&ndash;%&gt;--%>
                <%--&lt;%&ndash;        '<li>' +&ndash;%&gt;--%>
                <%--&lt;%&ndash;        '<a class="car_list_dShow" href="' + OrderPagerVO.itemList[i].publishAddress + "?merchandiseCode=" + OrderPagerVO.itemList[i].merchandiseCode + '">' +&ndash;%&gt;--%>
                <%--&lt;%&ndash;        '<div class="car_list_dShow">' +&ndash;%&gt;--%>
                <%--&lt;%&ndash;        '<div class="fl car_list_dShow_img"  > <img src="' + OrderPagerVO.itemList[i].imagePath + '"/></div> </a>' +&ndash;%&gt;--%>
                <%--&lt;%&ndash;        '<div class="car_list_dShow_info" >' +&ndash;%&gt;--%>
                <%--&lt;%&ndash;        '<a class="car_list_dShow" href="' + OrderPagerVO.itemList[i].publishAddress + "?merchandiseCode=" + OrderPagerVO.itemList[i].merchandiseCode + '">' +&ndash;%&gt;--%>
                <%--&lt;%&ndash;        '<p class="mobile_db" >' + OrderPagerVO.itemList[i].merchandiseName + '</p></a>' +&ndash;%&gt;--%>
                <%--&lt;%&ndash;        '<h3 >' + OrderPagerVO.itemList[i].attributeDesc + '' + (&ndash;%&gt;--%>
                <%--&lt;%&ndash;            (OrderPagerVO.itemList[i].isScreenshot == "1" && OrderPagerVO.itemList[i].screenshot == "1") ?&ndash;%&gt;--%>
                <%--&lt;%&ndash;                ('<label style="  margin-left: 20px;color: blue;" ' +&ndash;%&gt;--%>
                <%--&lt;%&ndash;                    ' onclick=\"toScreenshotPage(\'' + OrderPagerVO.itemList[i].orderItemId +&ndash;%&gt;--%>
                <%--&lt;%&ndash;                    '\')\">[商品快照]</label>') : ("")) + '</h3>' +&ndash;%&gt;--%>
                <%--&lt;%&ndash;        '<h4><span class="fl c_price" >' + OrderPagerVO.itemList[i].cashPrice + '</span><span class="fr cNum">x<em >' + OrderPagerVO.itemList[i].buyNum + '</em></span></h4>' +&ndash;%&gt;--%>
                <%--&lt;%&ndash;        '</div>' +&ndash;%&gt;--%>
                <%--&lt;%&ndash;        '</div>' +&ndash;%&gt;--%>
                <%--&lt;%&ndash;        // '</a >' +&ndash;%&gt;--%>
                <%--&lt;%&ndash;        '</li>' +&ndash;%&gt;--%>
                <%--&lt;%&ndash;        '</ul> '&ndash;%&gt;--%>
                <%--&lt;%&ndash;    item += itemList; //订单项信息&ndash;%&gt;--%>
                <%--&lt;%&ndash;}&ndash;%&gt;--%>

                <%--&lt;%&ndash;//查看是否有合约套餐&ndash;%&gt;--%>
                <%--&lt;%&ndash;var contractHTML = "";&ndash;%&gt;--%>
                <%--&lt;%&ndash;if (3 == OrderPagerVO.tbOrderInfoVO.orderType) {&ndash;%&gt;--%>
                <%--&lt;%&ndash;    contractHTML = '  	    		<dl onclick=\"ajaxSearchContract(\'${param.orderId}\')\">'&ndash;%&gt;--%>
                <%--&lt;%&ndash;        + '  	    			<dt>合约套餐信息</dt>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;        + ' 	    			<dd>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;        + ' 	    				<dd><span style="font-size:1.2em;">点击查看详情</span></dd>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;        + '  	    			</dd>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;        + '  	    		</dl>';&ndash;%&gt;--%>
                <%--&lt;%&ndash;}&ndash;%&gt;--%>


                <%--&lt;%&ndash;//O2O是否订单&ndash;%&gt;--%>
                <%--&lt;%&ndash;var O2OHTML = '<p >免运费</p>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + '<p >快递发货</p>';&ndash;%&gt;--%>
                <%--&lt;%&ndash;if (OrderPagerVO.tbOrderInfoVO.orderSupplyType + "" == "1") {&ndash;%&gt;--%>
                <%--&lt;%&ndash;    O2OHTML = '<p >门店电话:' + storeVo.linkPhone + '</p>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;        + '<p >预约时间:' + OrderPagerVO.tbOrderInfoVO.appointmentTime + '</p>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;        + '<p >自提地址:' + storeVo.storeAddress + '</p>';&ndash;%&gt;--%>
                <%--&lt;%&ndash;}&ndash;%&gt;--%>

                <%--&lt;%&ndash;var divOrder =&ndash;%&gt;--%>

                <%--&lt;%&ndash;    '	 <div class="index_wrap bgf3" style="padding-bottom: 0.8rem;">'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + '<div class="container" >'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    <!--信息-->&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + ' 	   <div class="order_msg">'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + ' 	   	  <div class="order_item">'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + ' 	   	  	<div class="fl order_item_l"><i class="icon_waitBuy"></i></div>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + ' 	   	  	<div class="order_item_r">'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + ' 	    	   	  		<h3>等待买家付款</h3>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + ' 	   	  		<p style="color:#F00">请于 ' + Countdown + '分钟 内付款，超时订单将自动关闭</p>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + '	   	  	</div>  '&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + ' 	   	  </div>';&ndash;%&gt;--%>
                <%--&lt;%&ndash;if(OrderPagerVO.tbOrderInfoVO.isEvoucher != "1"){&ndash;%&gt;--%>
                <%--&lt;%&ndash;    divOrder += ' 	   	   <div class="order_item">'&ndash;%&gt;--%>
                <%--&lt;%&ndash;        + ' 	   	  	<div class="fl order_item_l"><i class="icon_ads"></i></div>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;        + ' 	   	  	<div class="order_item_r">'&ndash;%&gt;--%>
                <%--&lt;%&ndash;        + ' 	   	  		<h4><span class="fl oBuyer">收货人：<em >' + OrderPagerVO.tbSupplyInfoVO.inceptPeople + '</em></span><span class="fr oTel" >' + OrderPagerVO.tbSupplyInfoVO.inceptTel + '</span></h4>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;        + ' 	   	  		<p >收货地址：' + OrderPagerVO.tbSupplyInfoVO.supplyAddress + '</p>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;        + ' 	   	  	</div>  '&ndash;%&gt;--%>
                <%--&lt;%&ndash;        + ' 	   	  </div>';&ndash;%&gt;--%>
                <%--&lt;%&ndash;}&ndash;%&gt;--%>
                <%--&lt;%&ndash;divOrder += ' 	   </div>'&ndash;%&gt;--%>

                <%--&lt;%&ndash;    <!--购物车-->&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + '  	    <div class="car_menu">'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    <!--数据条-->&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + '  	    	<div class="car_menu_list">'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + '  	    		<h3 class="car_menu_top">'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + '  	    			<div class="fl car_menu_top_l">   	 '&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + '  	    				<div class="fl bdName"><i class="icoDp"></i><span >' + OrderPagerVO.tbOrderInfoVO.merchantName + '</span></div>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + '  	    				  	    			</div>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + '  	    		</h3>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + '  	    		<div class="car_menu_list_info"  id ="itemList">'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + item&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + '  	    		</div>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + '  	    	</div>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + '  	    	<div class="pd_ctol">'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + '  	    		<dl>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + '  	    			<dt style="margin-top: 0.1rem;">配送方式</dt>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + ' 	    			<dd>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + O2OHTML&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + '  	    			</dd>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + '  	    		</dl>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + contractHTML&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + '  	    		<dl>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + '  	    			<dt>买家留言</dt>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + '  	    			<dd><p >' + OrderPagerVO.tbOrderInfoVO.memberMsg + '</p></dd>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + '  	    		</dl>';&ndash;%&gt;--%>

                <%--&lt;%&ndash;if(OrderPagerVO.tbOrderInfoVO.isEvoucher == "1"){&ndash;%&gt;--%>
                <%--&lt;%&ndash;    divOrder += '  	    		<dl>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;        + '  	    			<dt>身份证号</dt>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;        + '  	    			<dd><p >' + result.data.orderEvoucherInfoPO.conditional + '</p></dd>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;        + '  	    		</dl>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;}&ndash;%&gt;--%>
                <%--&lt;%&ndash;divOrder += '  	    		<dl>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + '  	    			<dt>发票抬头</dt>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + '  	    			<dd><p >' + OrderPagerVO.tbOrderInfoVO.invoiceTitle + '</p></dd>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + '  	    		</dl>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + '  	    	</div>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    /* +'   	    	<div class="pd_ctol mt18">'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    +'   	    		<dl style="border-bottom: 0;">'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    +'	   	    			<dt>短信通知收件人</dt>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    +'   	    			<dd>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    +'   	    				<span class="Btnswitch"></span>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    +'  	    			</dd>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    +'  	    		</dl>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    +'   	    	</div>'	 */&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + '   	    	<div class="pd_ctol pd_ctolWhole mt18">'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + '			   	    		<dl>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + '   	    			<dt >商品金额</dt>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + '   	    			<dd><span class="jmoney">￥<em >' + OrderPagerVO.tbOrderInfoVO.totalAmount + '</em></span></dd>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + '   	    		</dl>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + '   	    		<dl>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + '   	    			<dt >优惠</dt>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + '   	    			<dd><span class="jmoney">-￥<em >' + OrderPagerVO.tbOrderInfoVO.discountAmount + '</em></span></dd>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + '   	    		</dl>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + '   	    		<dl>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + '   	    			<dt >运费</dt>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + '   	    			<dd><span class="jmoney">￥<em >' + OrderPagerVO.tbSupplyInfoVO.payAmount + '</em></span></dd>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + '   	    		</dl>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + '   	    	</div>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + '				<div class="oder_question mt18">'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + '   	    		<dl>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + '   	    			<dt>订单状态：</dt>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + '   	    			<dd>' + OrderPagerVO.tbOrderInfoVO.orderStatusDes + '</dd>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + '   	    		</dl>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + '   	    		<dl>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + '   	    			<dt>订单编号：</dt>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + '   	    			<dd>${param.orderId}</dd>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + '   	    		</dl>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + '  	    		<dl>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + '   	    			<dt>创建时间：</dt>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + '   	    			<dd>' + OrderPagerVO.tbOrderInfoVO.generateTime + '</dd>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + '   	    		</dl>'&ndash;%&gt;--%>

                <%--&lt;%&ndash;    + '   	    </div>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + '   	    </div>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + '  	 </div>	'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + '  </div>'&ndash;%&gt;--%>


                <%--&lt;%&ndash;    + '<div class="fixed_bottom">'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + '  	<div class="fl car_jl">'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + '  		<div class="fr car_jl_fr" style="margin-top: 0.18rem;">'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + '   			<p>实付金额：¥ <em >' + OrderPagerVO.tbOrderInfoVO.cashAmount + '</em></p>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + '   		</div>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + '</div>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + '   	<div class="fr car_jr">'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + payWayBtn +&ndash;%&gt;--%>
                <%--&lt;%&ndash;    +'  	</div>'&ndash;%&gt;--%>
                <%--&lt;%&ndash;    + '</div>';&ndash;%&gt;*/--%>


                <%--//订单项信息--%>
                <%--var item = '';--%>
                <%--for (var i = 0; i < OrderPagerVO.itemList.length; i++) {--%>
                <%--    var itemList =--%>
                <%--        '<ul>' +--%>
                <%--        '<li>' +--%>
                <%--        '<a class="car_list_dShow" href="' + OrderPagerVO.itemList[i].publishAddress + "?merchandiseCode=" + OrderPagerVO.itemList[i].merchandiseCode  + '">' +--%>
                <%--        '<div class="fl car_list_dShow_img" ><img src="' + OrderPagerVO.itemList[i].imagePath + '"/></div>' +--%>
                <%--        '<div class="car_list_dShow_info">' +--%>
                <%--        '       <p class="mobile_db" name="merchandiseName">' + OrderPagerVO.itemList[i].merchandiseName + '</p>' +--%>
                <%--        '       <h3>' + OrderPagerVO.itemList[i].attributeDesc + '<span class="fr cNum">x<em >' + OrderPagerVO.itemList[i].buyNum + '</em></span></h3>' +--%>
                <%--        '       <h4>￥' + OrderPagerVO.itemList[i].cashPrice + '</h4>' + (--%>
                <%--            (OrderPagerVO.itemList[i].isScreenshot == "1" && OrderPagerVO.itemList[i].screenshot == "1") ?--%>
                <%--                ('<label class="sawPdPhoto"' +--%>
                <%--                    ' onclick=\"toScreenshotPage(\'' + OrderPagerVO.itemList[i].orderItemId +--%>
                <%--                    '\')\">商品快照</label>') : (""))+--%>
                <%--        '   </div>' +--%>
                <%--        '</a>' +--%>
                <%--        '</li>' +--%>
                <%--        '</ul>';--%>
                <%--    item += itemList; //订单项信息--%>
                <%--}--%>

                <%--//查看是否有合约套餐--%>
                <%--var contractHTML = "";--%>
                <%--if (3 == OrderPagerVO.tbOrderInfoVO.orderType) {--%>
                <%--    contractHTML =--%>
                <%--        '<dl onclick=\"ajaxSearchContract(\'${param.orderId}\')\">' +--%>
                <%--        '<dt>' +--%>
                <%--        '合约套餐信息' +--%>
                <%--        '</dt>' +--%>
                <%--        '<dd>' +--%>
                <%--        '<dd>' +--%>
                <%--        '<span style="font-size:1.2em;">点击查看详情</span>' +--%>
                <%--        '</dd>' +--%>
                <%--        '</dd>' +--%>
                <%--        '</dl>' ;--%>
                <%--}--%>

                <%--//O2O是否订单--%>
                <%--var O2OHTML = '';--%>
                <%--O2OHTML =--%>
                <%--    '<dl class="cmdl">' +--%>
                <%--    '<dt>配送方式  </dt>' +--%>
                <%--    '<dd>免运费 - 快递发货</dd>' +--%>
                <%--    '</dl>';--%>
                <%--if(OrderPagerVO.tbOrderInfoVO.orderSupplyType + "" == "1"){--%>
                <%--    O2OHTML =--%>
                <%--        '<dl class="cmdl">' +--%>
                <%--        '<dt>' +--%>
                <%--        '门店电话' +--%>
                <%--        '</dt>' +--%>
                <%--        '<dd>' +--%>
                <%--        storeVo.linkPhone +--%>
                <%--        '</dd>' +--%>
                <%--        '</dl>' +--%>
                <%--        '<dl class="cmdl">' +--%>
                <%--        '<dt>' +--%>
                <%--        '预约时间' +--%>
                <%--        '</dt>' +--%>
                <%--        '<dd>' +--%>
                <%--        OrderPagerVO.tbOrderInfoVO.appointmentTime +--%>
                <%--        '</dd>' +--%>
                <%--        '</dl>' +--%>
                <%--        '<dl class="cmdl">' +--%>
                <%--        '<dt>' +--%>
                <%--        '自提地址' +--%>
                <%--        '</dt>' +--%>
                <%--        '<dd>' +--%>
                <%--        storeVo.storeAddress +--%>
                <%--        '</dd>' +--%>
                <%--        '</dl>';--%>
                <%--}--%>

                <%--//加头部--%>
                <%--var divOrder =--%>
                <%--    '<div class="container">' +--%>
                <%--    '<div class="content">' +--%>
                <%--    '<div class="all_orderPage">' +--%>
                <%--    '<div class="order_content">' +--%>
                <%--    '<div class="dpayTop">' +--%>
                <%--    '<dl>' +--%>
                <%--    '<dt>' +--%>
                <%--    '<i class="icon_pay_wait"></i>' +--%>
                <%--    '</dt>' +--%>
                <%--    '<dd>' +--%>
                <%--    '<div class="dpayStatue">' +--%>
                <%--    '<h3>等待买家付款</h3>' +--%>
                <%--    '<p>请于' + Countdown + '分钟内付款，超时订单将自动关闭</p>' +--%>
                <%--    '</div>' +--%>
                <%--    '</dd>' +--%>
                <%--    '</dl>';--%>
                <%--if(OrderPagerVO.tbOrderInfoVO.isEvoucher != "1"){--%>
                <%--    divOrder +=--%>
                <%--        '<dl>' +--%>
                <%--        '<dt>' +--%>
                <%--        '<i class="icon_pay_position"></i>' +--%>
                <%--        '</dt>' +--%>
                <%--        '<dd>' +--%>
                <%--        '<div class="dpayuserInfo">' +--%>
                <%--        '<h3><span>' + OrderPagerVO.tbSupplyInfoVO.inceptPeople + '</span><span>' + OrderPagerVO.tbSupplyInfoVO.inceptTel + '</span></h3>' +--%>
                <%--        '<p>' + OrderPagerVO.tbSupplyInfoVO.supplyAddress + '</p>' +--%>
                <%--        '</div>' +--%>
                <%--        '</dd>' +--%>
                <%--        '</dl>';--%>
                <%--}--%>
                <%--divOrder +=                     '</div>';--%>
                <%--//加店铺--%>
                <%--divOrder +=--%>
                <%--    '<div class="order_content_item" id="" style="display: block;">' +--%>
                <%--    '<div class="car_menu_list car_menu_listNot">' +--%>
                <%--    '<h3 class="car_menu_top autoHeight">' +--%>
                <%--    '<div class="fl car_menu_top_l">' +--%>
                <%--    '<div class="fl bdName"><i class="icoDp"></i><span>' + OrderPagerVO.tbOrderInfoVO.merchantName + '</span></div>' +--%>
                <%--    '</div>' +--%>
                <%--    '</h3>' +--%>
                <%--    '<div class="car_menu_list_info">' +--%>
                <%--    item +--%>
                <%--    '</div>' +--%>
                <%--    '</div>' ;--%>
                <%--//加订单金额--%>
                <%--divOrder +=--%>
                <%--    '<div class="order_cm_shower">' +--%>
                <%--    '<dl class="cmdl">' +--%>
                <%--    '<dt>商品金额</dt>' +--%>
                <%--    '<dd>¥ ' + OrderPagerVO.tbOrderInfoVO.totalAmount + '</dd>' +--%>
                <%--    '</dl>' +--%>
                <%--    '<dl class="cmdl">' +--%>
                <%--    '<dt>优惠</dt>' +--%>
                <%--    '<dd>- ¥' + OrderPagerVO.tbOrderInfoVO.discountAmount + '</dd>' +--%>
                <%--    '</dl>' +--%>
                <%--    '<dl class="cmdl">' +--%>
                <%--    '<dt>运费</dt>' +--%>
                <%--    '<dd>' + OrderPagerVO.tbSupplyInfoVO.payAmount + '</dd>' +--%>
                <%--    '</dl>' +--%>
                <%--    '<dl class="cmdl">' +--%>
                <%--    '<dt>实付金额</dt>' +--%>
                <%--    '<dd>' +--%>
                <%--    '<span class="priceOn">¥ ' + OrderPagerVO.tbOrderInfoVO.cashAmount + '</span>' +--%>
                <%--    '</dd>' +--%>
                <%--    '</dl>' +--%>
                <%--    '</div>' +--%>
                <%--    '</div>';--%>
                <%--//加配送方式--%>
                <%--divOrder +=--%>
                <%--    '<div class="pd_bottom_info">' +--%>
                <%--    '<div class="order_cm_shower">' +--%>
                <%--    '<div class="order_cm_list">' +--%>
                <%--    O2OHTML +--%>
                <%--    contractHTML +--%>
                <%--    '<dl class="cmdl">' +--%>
                <%--    '<dt>买家留言</dt>' +--%>
                <%--    '<dd>' + OrderPagerVO.tbOrderInfoVO.memberMsg +'</dd>' +--%>
                <%--    '</dl>';--%>
                <%--//加身份证--%>
                <%--if(OrderPagerVO.tbOrderInfoVO.isEvoucher == "1"){--%>
                <%--    divOrder +=--%>
                <%--        '<dl>' +--%>
                <%--        '<dt>身份证号</dt>' +--%>
                <%--        '<dd>' +--%>
                <%--        result.data.orderEvoucherInfoPO.conditional +--%>
                <%--        '</dd>' +--%>
                <%--        '</dl>';--%>
                <%--}--%>
                <%--divOrder +=--%>
                <%--    '<dl class="cmdl">' +--%>
                <%--    '<dt>发票抬头</dt>' +--%>
                <%--    '<dd>' +OrderPagerVO.tbOrderInfoVO.invoiceTitle + '</dd>' +--%>
                <%--    '</dl>' +--%>
                <%--    '</div>' +--%>
                <%--    '<div class="order_cm_list">' +--%>
                <%--    '<dl class="cmdl">' +--%>
                <%--    '<dt>订单状态</dt>' +--%>
                <%--    '<dd>' + OrderPagerVO.tbOrderInfoVO.orderStatusDes + '</dd>' +--%>
                <%--    '</dl>' +--%>
                <%--    '<dl class="cmdl">' +--%>
                <%--    '<dt>订单编号</dt>' +--%>
                <%--    '<dd>${param.orderId}</dd>' +--%>
                <%--    '</dl>' +--%>
                <%--    '<dl class="cmdl">' +--%>
                <%--    '<dt>创建时间</dt>' +--%>
                <%--    '<dd>' + OrderPagerVO.tbOrderInfoVO.generateTime +'</dd>' +--%>
                <%--    '</dl>' +--%>
                <%--    '</div>' +--%>
                <%--    '<div class="countBtn countBtn_mg">' +--%>
                <%--    '<a href="javascript:;">取消</a>' +--%>
                <%--    '<a href="javascript:showPayPop()" class="on" style="margin-right: 0;">付款</a>' +--%>
                <%--    '</div>' +--%>
                <%--    '</div>' +--%>
                <%--    '</div>' +--%>
                <%--    '</div>' +--%>
                <%--    '</div>' +--%>
                <%--    '</div>' +--%>
                <%--    '</div>';--%>
                <%--DIV += divOrder;--%>
                <%--$("#allOrder").html(DIV);--%>
            }
        })
    }

    //立即支付
    function rightPay() {
        //payWay：微信支付方式：0为公众号支付，1,线下支付，2为和包支付，3为微信H5支付,4为微信扫码支付，5为支付宝支付 6为分期支付
        // var payWay = $("#payWay .payWayOn").attr("data-value");
        // if (payWay == "0") {
        //     getJsapiAndPay();
        // } else if (payWay == "2") {
        //     ebPay();
        // } else if (payWay == "3") {
        //     h5Pay();
        // } else if (payWay == "5") {
        //     aliPay(0);
        // } else if (payWay == "6") {
        //     pbiPay()
        // } else if (payWay == "7") {
        //     miniprogramPay();
        // } else if (payWay == "9" || payWay == "10" || payWay == "11" || payWay == "12") {
        //     pufaPolyPay(payWay);//9-浦发支付宝，10-浦发微信，11-浦发银联在线无卡，12-浦发云闪付
        // } else if (payWay == "13"){
        //     sytPay();
        // }
        // else {
        //     layer.open({
        //         content: '请选择支付方式再立即付款'
        //         , time: 4
        //         , skin: 'msg'
        //     });
        // }

        closePayWay();
    }
</script>

</body>
</html>
