<%@ page language="java" import="java.util.*,java.net.URLDecoder" pageEncoding="utf-8"%>
<%@ page import="com.gx.member.domain.TbMemberPO" %>
<%
    //获取请求上下文
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    //获取到会员信息
    TbMemberPO tbMemberPO = (TbMemberPO) request.getSession().getAttribute("tbMemberPO");
    System.out.print("个人中心页面，session中的memberPO=" + tbMemberPO);
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

<div class="container bgfff pb98s">

    <!--
        如果有底部菜单栏：pb98s
    -->
    <div class="content">


        <!--
            个人中心
        -->

        <div class="userCenter">

            <div class="userCenter_top">
                <div class="fl atvoitor">
                    <img src="<%=basePath%>portal/images/new_pdimg/newicon_my_default.png" alt="头像"/>
                </div>
                <div class="userCinfo">
                    <h3>手机商城欢迎您！</h3>
                    <p><%=tbMemberPO.getPhoneNumber()%></p>
                </div>
            </div>
            <div class="userCenter_bottom">
                <!--
                    我的订单
                -->
                <div class="userCenter_item">
                    <a href="<%=basePath%>order/returnOrderListPage" class="uitem_link">
                        我的订单
                    </a>
                    <ul class="com_uitemBox">
                        <li>
                            <a href="<%=basePath%>order/returnOrderListPage?orderStatus=1" class="com_uitem_list">
                                <em class="carNums">2</em>
                                <img src="<%=basePath%>portal/images/new_pdimg/newicon_my_order_01.png"/>
                                <p>待付款</p>
                            </a>
                        </li>
                        <li>
                            <a href="<%=basePath%>order/returnOrderListPage?orderStatus=2" class="com_uitem_list">
                                <em class="carNums">20</em>
                                <img src="<%=basePath%>portal/images/new_pdimg/newicon_my_order_02.png"/>
                                <p>待发货</p>
                            </a>
                        </li>
                        <li>
                            <a href="<%=basePath%>order/returnOrderListPage?orderStatus=3" class="com_uitem_list">
                                <img src="<%=basePath%>portal/images/new_pdimg/newicon_my_order_03.png"/>
                                <p>配送中</p>
                            </a>
                        </li>
                        <li>
                            <a href="#" class="com_uitem_list">
                                <img src="<%=basePath%>portal/images/new_pdimg/newicon_my_order_04.png"/>
                                <p>退款/售后</p>
                            </a>
                        </li>
                    </ul>
                </div>

                <!--
                    我的优惠券
                -->
                <div class="userCenter_item">
<%--                    <h3 class="uitem_link uitem_link_nomal">--%>
<%--                        我的优惠券--%>
<%--                    </h3>--%>
                    <a href="${baseURL}/jsp/component/portal/JSP/personalcenter/coupon/MycouponList.jsp" class="uitem_link uitem_link_nomal">
                        我的优惠券
                    </a>
                    <div id="myCoupon">
                    </div>
<%--                    <ul class="myYhq_card">--%>
<%--                        <li>--%>
<%--                            <div class="coupons_item">--%>
<%--                                <div class="fl coupons_left">--%>
<%--                                    <h3>¥50</h3>--%>
<%--                                    <p>满999可用</p>--%>
<%--                                </div>--%>
<%--                                <div class="coupons_right">--%>
<%--                                    <h3>50元代金券</h3>--%>
<%--                                    <p>2019-07-10至2019-12-30</p>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </li>--%>
<%--                        <li>--%>
<%--                            <div class="coupons_item">--%>
<%--                                <div class="fl coupons_left">--%>
<%--                                    <h3>¥50</h3>--%>
<%--                                    <p>满999可用</p>--%>
<%--                                </div>--%>
<%--                                <div class="coupons_right">--%>
<%--                                    <h3>50元代金券</h3>--%>
<%--                                    <p>2019-07-10至2019-12-30</p>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </li>--%>
<%--                    </ul>--%>
                </div>

                <!--
                    常用工具
                -->
                <div class="userCenter_item tools">
                    <h3 class="uitem_link uitem_link_nomal">
                        常用工具
                    </h3>
                    <ul class="com_uitemBox">
                        <li>
                            <a href="#" class="com_uitem_list">
                                <img src="<%=basePath%>portal/images/new_pdimg/newicon_my_tool_01.png"/>
                                <p>我的分销中心</p>
                            </a>
                        </li>
                        <li>
                            <a href="<%=basePath%>address/returnAddressPage" class="com_uitem_list">
                                <img src="<%=basePath%>portal/images/new_pdimg/newicon_my_tool_02.png"/>
                                <p>我的地址</p>
                            </a>
                        </li>
                        <li>
                            <a href="<%=basePath%>member/returnAccountMgrPage" class="com_uitem_list">
                                <img src="<%=basePath%>portal/images/new_pdimg/newicon_my_tool_03.png"/>
                                <p>账号管理</p>
                            </a>
                        </li>
                        <li>
                            <a href="#" class="com_uitem_list">
                                <img src="<%=basePath%>portal/images/new_pdimg/newicon_my_tool_04.png"/>
                                <p>退出</p>
                            </a>
                        </li>
                    </ul>
                </div>

            </div>
        </div>

        <!--
            end 个人中心
        -->
    </div>
</div>



<!--
    底部四大入口
-->
<div class="footer fourMenu">
    <ul>
        <div class="dUserSet">
            <li>
                <a href="<%=basePath%>personalCenter/returnIndexPage">
                    <img src="<%=basePath%>portal/images/menu/menu01.png" class="comIcon"/>
                    <img src="<%=basePath%>portal/images/menu/newmenu01_on.png" class="onIcon"/>
                    <p>首页</p>
                </a>
            </li>
            <li>
                <a href="<%=basePath%>personalCenter/returnItemListPage">
                    <img src="<%=basePath%>portal/images/menu/newmenu02.png" class="comIcon"/>
                    <img src="<%=basePath%>portal/images/menu/newmenu03_on.png" class="onIcon"/>
                    <p>全部商品</p>
                </a>
            </li>
            <li>
                <a href="<%=basePath%>personalCenter/returnDIYmodulePage">
                    <img src="<%=basePath%>portal/images/menu/newmenu03.png" class="comIcon"/>
                    <img src="<%=basePath%>portal/images/menu/menu03_on.png" class="onIcon"/>
                    <p>优惠购机</p>
                </a>
            </li>
        </div>
        <li class="fCurr">
            <a href="<%=basePath%>personalCenter/returnPersonalCenterPage">
                <img src="<%=basePath%>portal/images/menu/menu04.png" class="comIcon"/>
                <img src="<%=basePath%>portal/images/menu/newmenu04_on.png" class="onIcon"/>
                <p>我的</p>
            </a>
        </li>
    </ul>
</div>


<script type="text/javascript" src="<%=basePath%>portal/js/jquery-3.2.1.min.js" ></script>
<script type="text/javascript" src="<%=basePath%>portal/js/function.js" ></script>
<script type="text/javascript">
    $(function () {
        getMycouponList();
    })
    //获取我的优惠券
    function getMycouponList(){
        $.ajax({
            url:'<%=basePath%>coupon/getMyCouponPackage',
            dataType:'json',
            type:'post',
            success:function(result){
                if(result.code=="0"){
                    var list=result.couponPackageVOList;
                    var availability="";
                    var lapse="";
                    for(var i=0;i<list.length;i++){
                        if(list[i].couponUseStatus=="0"){
                            //可用---------------------
                            var value='';
                            if(list[i].discountType=="0"){
                                //固定金额
                                fontSize = getFontSize2(list[i].discountAmount);
                                // value='				<span class="use_des_unit">￥</span>'
                                //     +'				<span class="use_des_num" '+fontSize+'>'+list[i].discountAmount+'</span>';
                                value =
                                    '<h3>￥' + list[i].discountAmount + '</h3>';
                            }
                            //满减-----------------------------
                            var useLimit='';
                            if(list[i].isUseLimit=="1"){
                                useLimit='满'+list[i].limitAmount+'可用';
                            }
                            var name = list[i].couponName;
                            var cName;
                            if(name.length > 7){
                                name1 = name.substring(0,7);
                                cName = "<h3>" + name1 + "***" +"</h3>";
                            }else{
                                cName = "<h3>" + name + "</h3>";
                            }
                            var coupon =
                                '<li>' +
                                '<a href="${baseURL}/jsp/component/portal/JSP/personalcenter/coupon/CouponDetail.jsp?couponPackageId='+list[i].couponPackageId+'&endTime='+list[i].endTime+'">' +
                                '<div class="coupons_item">' +
                                '<div class="fl coupons_left">' +
                                value +
                                '<p>' +
                                useLimit +
                                '</p>' +
                                '</div>' +
                                '<div class="coupons_right">' +
                                // '<h3>' + list[i].couponName + '</h3>' +
                                cName +
                                '<p>' + (list[i].startTime).substring(0, 10) + ' 至 ' + (list[i].endTime).substring(0, 10) + '</p>' +
                                '</div>' +
                                '</div>' +
                                '</a>' +
                                '</li>';
                            availability += coupon;
                        }else{
                            //状态---------------------
                            var status='';
                            if(list[i].couponUseStatus=="1"){
                                status='已过期';
                            }else if(list[i].couponUseStatus=="2"){
                                status='已使用';
                            }else if(list[i].couponUseStatus=="3"){
                                status='已失效';
                            }

                            var value='';
                            if(list[i].discountType=="0"){
                                //固定金额
                                fontSize = getFontSize2(list[i].discountAmount);
                                // value='				<span class="use_des_unit">￥</span>'
                                //     +'				<span class="use_des_num" '+fontSize+'>'+list[i].discountAmount+'</span>';
                                value =
                                    '<h3>￥' + list[i].discountAmount + '</h3>';
                            }
                            //满减-----------------------------
                            var useLimit='';
                            if(list[i].isUseLimit=="1"){
                                useLimit='满'+list[i].limitAmount+'可用';
                            }
                            var coupon=
                                '<li>' +
                                '<div class="coupons_item">' +
                                '<div class="fl coupons_left">' +
                                value +
                                '<p>' +
                                useLimit +
                                '</p>' +
                                '</div>' +
                                '<div class="coupons_right">' +
                                '<h3>' + list[i].couponName + '</h3>' +
                                '<p>' + (list[i].startTime).substring(0, 10) + ' 至 ' + (list[i].endTime).substring(0, 10) + '</p>' +
                                '</div>' +
                                '</div>' +
                                '</li>';
                            lapse+=coupon;

                        }
                    }
                    if(availability==""){
                        availability="<div align='center'><h3 class='uitem_link uitem_link_nomal'>- - 还没有可用的优惠券 - -</h3></div>";
                    }
                    availability =
                        '<ul class="myYhq_card">' +
                        availability +
                        '</ul>';
                    $("#myCoupon").html(availability);
                }else{
                    layer.msg("查询异常!");
                }
            },
            error:function(result){
                layer.msg("查询异常!");
            }
        })
    }

    /* 根据金额长度，控制字体大小 */
    function getFontSize2(value){
        var fontSize = '';
        if(value.length>0&&value.length<=5){
            fontSize = 'style="font-size: 0.52rem;"'
        }
        else if(value.length==6){
            fontSize = 'style="font-size: 0.42rem;"'
        }
        else if(value.length>=7){
            fontSize = 'style="font-size: 0.38rem;"'
        }
        return fontSize;
    }
</script>
</body>
<link rel="stylesheet" type="text/css" href="<%=basePath%>portal/js/layer/mobile/need/layer.css">
<script type="text/javascript" src="https://res.wx.qq.com/open/js/jweixin-1.3.2.js"></script>
<script type="text/javascript" src="<%=basePath%>portal/js/layer/mobile/layer.js"></script>
<script src="<%=basePath%>portal/js/jquery/jquery.form.js"></script>
<script src="<%=basePath%>portal/js/main.js" type="text/javascript"></script>
<script src="<%=basePath%>portal/js/md5.js" type="text/javascript"></script>
<script src="<%=basePath%>portal/js/itlogin-jssdk.js" type="text/javascript"></script>
</html>
