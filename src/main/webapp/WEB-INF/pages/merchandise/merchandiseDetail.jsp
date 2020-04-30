<%@ page language="java" import="java.util.*,java.net.URLDecoder" pageEncoding="utf-8"%>
<%@ page import="com.gx.merchandise.domain.TbMerchandiseInfoPO" %>
<%@ page import="com.gx.merchandise.domain.TbMerchandiseImagePO" %>
<%
    //获取请求上下文
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    //商品编号
    String merchandiseCode = request.getParameter("merchandiseCode");
    System.out.print("在商品详情页中，商品编码=" + merchandiseCode);
    //商品信息
    TbMerchandiseInfoPO tbMerchandiseInfoPO = (TbMerchandiseInfoPO) request.getAttribute("tbMerchandiseInfoPO");
    System.out.print("在商品详情页中获取到的商品信息=" + tbMerchandiseInfoPO);
    //图片信息
    TbMerchandiseImagePO tbMerchandiseImagePO = (TbMerchandiseImagePO) request.getAttribute("tbMerchandiseImagePO");
    System.out.print("在商品详情页中获取到的商品图片信息=" + tbMerchandiseImagePO);
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

<div class="container pb98s">
    <input id="merchandiseCode" value="<%=tbMerchandiseInfoPO.getMerchandiseCode()%>" hidden>
    <input id="stockId" hidden>
    <!--
        如果有底部菜单栏：pb98s
    -->

    <div class="content">

        <!--
            返回
        -->
        <a href="javascript:;" class="backPrev"></a>

        <!--
            分享
        -->
        <a href="javascript:;" class="shareApp"></a>

        <!--
            商品详情
        -->
        <div class="productPage" id="productPage">
            <!--
               商品:上
           -->
            <div class="productTop">
                <!--轮播-->
                <div class="spInfo_slide">
                    <div class="swiper-container">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide">
                                <a href="#"><img src="<%=tbMerchandiseImagePO.getImagePath()%>" alt="banner1" width="100%"></a>
                            </div>
                        </div>
                        <!-- Add Pagination -->
                        <div class="swiper-pagination"></div>
                    </div>
                </div>
                <div class="prod_discurb">
                    <h3 class="p_disInfo"><%=tbMerchandiseInfoPO.getMerchandiseName()%></h3>
                    <p><span class="p_money">￥<%=tbMerchandiseInfoPO.getSalePrice()%></span><em class="fr">运费：免运费</em></p>
                </div>
            </div>

            <!--
               商品:下
           -->
            <div class="productBottom">

                <!--支持花呗分期-->
                <div class="mobile_set mt18">
                    <h3 class="set_title lqCard" onclick="showYhq_card()"><i class="icoCard"></i><em>领取优惠券</em></h3>
                </div>

                <!--手机属性-->
                <div class="mobile_set mt18">
<%--                    <h3 class="set_title">选择：<span>内存、</span><span>颜色</span>、<span>购买方式</span><b class="icoCtol"></b></h3>--%>
                    <h3 class="set_title">选择购买数量</h3>
                    <div class="mobile_set_info">
<%--                        <div class="p_item">--%>
<%--                            <h3>颜色</h3>--%>
<%--                            <ul>--%>
<%--                                <li class="active"><a href="javascript:;">钻雕金</a><input type="hidden" name="" id="" value="" class="rdioas"/></li>--%>
<%--                                <li><a href="javascript:;">玫瑰金</a><input type="hidden" name="" id="" value="" class="rdioas"/></li>--%>
<%--                                <li><a href="javascript:;">中国红</a><input type="hidden" name="" id="" value="" class="rdioas"/></li>--%>
<%--                                <li><a href="javascript:;">星空灰</a><input type="hidden" name="" id="" value="" class="rdioas"/></li>--%>
<%--                            </ul>--%>
<%--                        </div>--%>
<%--                        <div class="p_item">--%>
<%--                            <h3>机身内存</h3>--%>
<%--                            <ul>--%>
<%--                                <li><a href="javascript:;">32G</a><input type="hidden" name="" id="" value="" class="rdioas"/></li>--%>
<%--                                <li><a href="javascript:;">64G</a><input type="hidden" name="" id="" value="" class="rdioas"/></li>--%>
<%--                            </ul>--%>
<%--                        </div>--%>
<%--                        <div class="p_item">--%>
<%--                            <h3>颜色</h3>--%>
<%--                            <ul>--%>
<%--                                <li><a href="javascript:;">裸机</a><input type="hidden" name="" id="" value="" class="rdioas"/></li>--%>
<%--                                <li><a href="javascript:;">合约机</a><input type="hidden" name="" id="" value="" class="rdioas"/></li>--%>
<%--                            </ul>--%>
<%--                        </div>--%>
                        <div class="p_count">
                            <div class="fl p_count_l">
                                <h3>购买数量<span>（剩余：<span id="stock"><b></b>件</span>）</span></h3>
                            </div>
                            <div class="fr p_count_r">
                                <a href="javascript:;" class="fl ico_min"><em></em></a>
                                <input type="text" name="" id="buyNum" value="1" class="fl numEnter"/>
                                <a href="javascript:;" class="fl ico_add"><em></em></a>
                            </div>
                        </div>
<%--                        <div class="hy_item">--%>
<%--                            <h3>选择合约:</h3>--%>
<%--                            <div class="hy_item_rg" onclick="showlay_pop();">--%>
<%--                                <span>请选择合约</span>--%>
<%--                            </div>--%>
<%--                        </div>--%>
                    </div>
                </div>

                <!--支持花呗分期-->
<%--                <div class="mobile_set mt18">--%>
<%--                    <h3 class="set_title"><i class="icoHb"></i><em>支持花呗分期</em></h3>--%>
<%--                </div>--%>

                <!--店铺-->
                <div class="mobile_set mt18">
                    <h3 class="set_title"><i class="icoDp"></i><em>店铺名称</em></h3>
                </div>

                <!--详情,评价-->
                <div class="prodcutDiscussInfoBox">

                    <!--嵌套：nav_menu_wrap-->
                    <div class="nav_menu_wrap">
                        <!--nav-->
                        <div class="pdBox mt18 nav_menu">
                            <ul class="navCom" id="changeProduct">
                                <li class="active"><a href="javascript:;">商品详情</a></li>
                                <li><a href="javascript:;">用户评价</a></li>
                            </ul>
                        </div>
                    </div>

                    <!--详情-->
                    <div class="mKcontent" style="margin-top: -.44rem;">
                        <!--商品详情-->
                        <div class="mK_item" style="display: block;">
                            <div class="mobile_js_info">
                                <div class="mobile_js_info_content">
                                    <p>详情详情详情详情详情详情详情详情详情详情</p>
<%--                                    <img src="<%=basePath%>portal/images/magic/magic09.png"/>--%>
<%--                                    <img src="<%=basePath%>portal/images/magic/magic08.png"/>--%>
                                </div>
                            </div>
                        </div>
                        <!--用户评价-->
                        <div class="mK_item">
                            <div class="Userdiscuss">
                                <ul>
                                    <li>
                                        <div class="dsBox">
                                            <div class="dstarTitle">
                                                <div class="fl g_star">
                                                    <span class="i-star i-starOn"></span>
                                                    <span class="i-star i-starOn"></span>
                                                    <span class="i-star i-starOn"></span>
                                                    <span class="i-star"></span>
                                                    <span class="i-star"></span>
                                                </div>
                                                <div class="fr duserShow">
                                                    用户<span class="duserTel">138******60</span>
                                                </div>
                                            </div>
                                            <p class="d-disturbs">观察了很久，很早就想入手了，对比京东、苏宁的价格，还是这里最便宜，非常好。</p>
                                            <h3 class="d-timer">2018-08-02</h3>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="dsBox">
                                            <div class="dstarTitle">
                                                <div class="fl g_star">
                                                    <span class="i-star"></span>
                                                    <span class="i-star"></span>
                                                    <span class="i-star"></span>
                                                    <span class="i-star"></span>
                                                    <span class="i-star"></span>
                                                </div>
                                                <div class="fr duserShow">
                                                    用户<span class="duserTel">138******60</span>
                                                </div>
                                            </div>
                                            <p class="d-disturbs">观察了很久，很早就想入手了，对比京东、苏宁的价格，还是这里最便宜，非常好。</p>
                                            <h3 class="d-timer">2018-08-02</h3>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="dsBox">
                                            <div class="dstarTitle">
                                                <div class="fl g_star">
                                                    <span class="i-star i-starOn"></span>
                                                    <span class="i-star i-starOn"></span>
                                                    <span class="i-star i-starOn"></span>
                                                    <span class="i-star"></span>
                                                    <span class="i-star"></span>
                                                </div>
                                                <div class="fr duserShow">
                                                    用户<span class="duserTel">138******60</span>
                                                </div>
                                            </div>
                                            <p class="d-disturbs">观察了很久，很早就想入手了，对比京东、苏宁的价格，还是这里最便宜，非常好。</p>
                                            <h3 class="d-timer">2018-08-02</h3>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="dsBox">
                                            <div class="dstarTitle">
                                                <div class="fl g_star">
                                                    <span class="i-star"></span>
                                                    <span class="i-star"></span>
                                                    <span class="i-star"></span>
                                                    <span class="i-star"></span>
                                                    <span class="i-star"></span>
                                                </div>
                                                <div class="fr duserShow">
                                                    用户<span class="duserTel">138******60</span>
                                                </div>
                                            </div>
                                            <p class="d-disturbs">观察了很久，很早就想入手了，对比京东、苏宁的价格，还是这里最便宜，非常好。</p>
                                            <h3 class="d-timer">2018-08-02</h3>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="dsBox">
                                            <div class="dstarTitle">
                                                <div class="fl g_star">
                                                    <span class="i-star i-starOn"></span>
                                                    <span class="i-star i-starOn"></span>
                                                    <span class="i-star i-starOn"></span>
                                                    <span class="i-star"></span>
                                                    <span class="i-star"></span>
                                                </div>
                                                <div class="fr duserShow">
                                                    用户<span class="duserTel">138******60</span>
                                                </div>
                                            </div>
                                            <p class="d-disturbs">观察了很久，很早就想入手了，对比京东、苏宁的价格，还是这里最便宜，非常好。</p>
                                            <h3 class="d-timer">2018-08-02</h3>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="dsBox">
                                            <div class="dstarTitle">
                                                <div class="fl g_star">
                                                    <span class="i-star"></span>
                                                    <span class="i-star"></span>
                                                    <span class="i-star"></span>
                                                    <span class="i-star"></span>
                                                    <span class="i-star"></span>
                                                </div>
                                                <div class="fr duserShow">
                                                    用户<span class="duserTel">138******60</span>
                                                </div>
                                            </div>
                                            <p class="d-disturbs">观察了很久，很早就想入手了，对比京东、苏宁的价格，还是这里最便宜，非常好。</p>
                                            <h3 class="d-timer">2018-08-02</h3>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="dsBox">
                                            <div class="dstarTitle">
                                                <div class="fl g_star">
                                                    <span class="i-star"></span>
                                                    <span class="i-star"></span>
                                                    <span class="i-star"></span>
                                                    <span class="i-star"></span>
                                                    <span class="i-star"></span>
                                                </div>
                                                <div class="fr duserShow">
                                                    用户<span class="duserTel">138******60</span>
                                                </div>
                                            </div>
                                            <p class="d-disturbs">观察了很久，很早就想入手了，对比京东、苏宁的价格，还是这里最便宜，非常好。</p>
                                            <h3 class="d-timer">2018-08-02</h3>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--
            end 商品详情
        -->
    </div>
</div>

<!--
    底部悬浮组件
-->
<div class="fixed_bottom">
    <div class="menu_btmBox">
        <a href="#" class="t_kc t_kfu">
            <i></i>
            <p>客服</p>
        </a>
        <a href="#" class="t_kc t_car">
            <b>2</b>
            <i></i>
            <p>购物车</p>
        </a>
        <div class="fr vhk">
            <a href="javascript:;" class="d_join_buy">加入购物车</a>
            <a href="#" onclick="purchase()" class="d_buy">立即购买</a>
        </div>
    </div>
</div>

<!--遮罩层-->
<div class="flexBg" style="display: none;"></div>

<!--优惠券 弹窗-->
<div class="yhq_pop">
    <h3 class="yhq_title">店铺优惠券</h3>
    <div class="yhq_pop_info">
        <div id="availability" class="coupons">
        </div>
    </div>
    <div class="mbtn">
        <a href="javascript:hideYhq_card();" class="btn_finish">完成</a>
    </div>
</div>


<!--透明背景1-->
<div class="pop-mask" onclick="Hidewlay_pop();" style="display: none;"><p>点击此处返回<span></span></p></div>

<!--选择合约 弹窗 opens-->


<script type="text/javascript" src="<%=basePath%>portal/js/jquery-3.2.1.min.js" ></script>
<script type="text/javascript" src="<%=basePath%>portal/js/function.js" ></script>

<!--描述：fixed导航-->
<script src="<%=basePath%>portal/js/fixedNav.js" type="text/javascript"></script>

<!--
    轮播
-->
<link rel="stylesheet" type="text/css" href="<%=basePath%>portal/plugin/swiper/swiper.min.css"/>
<script src="<%=basePath%>portal/plugin/swiper/swiper-4.3.5.min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="<%=basePath%>portal/js/layer/layer.js"></script>
<script type="text/javascript">
    $(function () {
        //控制商品购买数量
        $('.ico_min').on('click',function(){
            var buyNum=$('#buyNum').val();
            var stock=$('#stock').text();
            if(buyNum>0){
                $('#buyNum').val(--buyNum);
                $('#stock').text(++stock);
            }
        });

        $('.ico_add').on('click',function(){
            var buyNum=$('#buyNum').val();
            var stock=$('#stock').text();
            if(stock>0){
                $('#buyNum').val(++buyNum);
                $('#stock').text(--stock);
            }
        });
        $('#buyNum').on('input',function(){
            var buyNum=$('#buyNum').val();
            $('#stock').text(stockNum-buyNum);
        })
        //获取库存
        //获取商品编号
        var merchandiseCode = $("#merchandiseCode").val();
        //获取商品库存
        $.ajax({
            type: "get",
            async: false,
            url: "<%=basePath%>merchandise/gainMerchandiseStock",
            data: {'merchandiseCode':merchandiseCode},
            dataType: "json",
            success: function(result){
                var stock = result.stock;
                var stockId = result.stockId;
                console.log("商品库存=" + result.stock);
                //设置值
                $("#stock").text(parseInt(stock))
                //设置stockId
                $("#stockId").val(stockId)
            }
        })
        //获取优惠券
        getCouponList2();
    })
    //获取优惠券
    function getCouponList2() {
        $.ajax({
            url: '<%=basePath%>coupon/getCouponByMerchantId',
            dataType: 'json',
            data: {},
            type: 'post',
            success: function (result) {
                if (result.code == "0") {
                    console.log("查询优惠券成功")
                    var list = result.couponVOList;
                    var availability = "";
                    for (var i = 0; i < list.length; i++) {
                        var font = '';
                        if (list[i].couponStatus == "0") {
                            //可用---------------------
                            var value = '';
                            var fontSize = '';
                            if (list[i].discountType == "0") {
                                //固定金额
                                fontSize = getFontSize2(list[i].discountAmount);
                                font = list[i].discountAmount;
                                //折扣
                                if (list[i].isUseLimit == "1") {
                                    value = '<h3>¥' + list[i].discountAmount + '</h3>\n' +
                                        '<p>满' + list[i].limitAmount + '可用</p>';
                                } else {
                                    value = '<h3 style="margin-top:20px;">¥' + list[i].discountAmount + '</h3>\n';
                                }
                            }
                            var coupon = '<div class="coupons_item">\n' +
                                '                <div class="fl coupons_left">\n' +
                                value +
                                '                </div>\n' +
                                '                <div class="coupons_right">\n' +
                                '                    <h3>' + font + '元代金券</h3>\n' +
                                '                    <a href="javascript:getCoupon2(\''+list[i].couponId+'\');" class="btnBuyed">领取</a>\n' +
                                '                    <p>' + (list[i].effectiveTime).substring(0, 10) + ' 至 ' + (list[i].expirationTime).substring(0, 10) + '</p>\n' +
                                '                </div>\n' +
                                '            </div>'
                            availability += coupon;
                        }
                    }
                    if (availability == "") {
                        availability = "<div align='center'><font>- - 还没有可用的优惠券 - -</font></div>";
                    }
                    $("#availability").html(availability);
                } else {
                    console.log("查询异常")
                    layer.msg('查询异常');
                }
            }
            ,
            error: function (result) {
                console.log("查询异常")
                layer.msg("查询异常!");
            }
        })
    }
    /*领取优惠券  */
    function getCoupon2(couponId){
        $.ajax({
            url:'<%=basePath%>coupon/getCoupon',
            dataType:'json',
            type:'post',
            data:{
                "couponId":couponId
            },
            success:function(result){
                if(result.code=="0") {
                    console.log("领取成功")
                    layer.msg('领取成功');
                }
            },
            error:function(resutl){
                layer.msg('领取失败');
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
   function purchase() {
        //库存id
        var stockId = $("#stockId").val();
        //获取购买数量和库存数量
       var num = $("#stock").text();
       var buyNum = $("#buyNum").val();
       if (parseInt(num) < 0) {
           layer.msg('商品库存不足，请选购其他商品', {icon: 0, time: 1500});
           return false;
       }
       if (buyNum <= 0) {
           layer.msg('选择的商品暂时售罄，请选购其他商品', {icon: 5, time: 1500});
           return false;
       }
       window.location.href = "<%=basePath%>order/purchase2Submit?stockId=" + stockId + "&buyNum=" + buyNum;
   }
   /*调用 fixed导航*/
    $('.nav_menu').fixedNav({
        itemCallback: function() {
            //alert(0)
        }
    });
    //调用轮播图，一张图片时，禁止轮播
    if($(".swiper-slide").length > 1) {

        var swiper = new Swiper('.swiper-container', {
            spaceBetween: 30,
            centeredSlides: true,
            autoplay: {
                delay: 2500,
                disableOnInteraction: false,
            },
            pagination: {
                el: '.swiper-pagination',
                clickable: true,
            },
        });

    }

    /*商品详情、评价切换*/
    $('#changeProduct').on('click','li',function(){
        var _el=$(this);
        var curIndex=0;
        var mK_item=$('.mK_item');
        curIndex = $('#changeProduct li').index(this);
        _el.addClass('active').siblings().removeClass('active');
        mK_item.siblings().eq(curIndex).show().siblings().hide();
    });

    /*选择优惠券弹窗*/
    function showYhq_card(){
        $('.flexBg').show();
        $('.yhq_pop').css("height","8rem");
    }

    /*隐藏选择优惠券弹窗*/
    function hideYhq_card(){
        $('.flexBg').hide();
        $('.yhq_pop').css("height","0");
    }


    /*合约弹窗*/
    function showlay_pop(){
        $('.pop-mask').show();
        $('.pop-box').addClass('opens');
    }
    /*隐藏合约弹窗*/
    function Hidewlay_pop(){
        $('.pop-mask').hide();
        $('.pop-box').removeClass('opens');
    }

    /*切换*/
    $('.vTab').on('click','li',function(){
        var _el=$(this);
        var curIndex=0;
        var vTab_item_info_tabMenu=$('.vTab_item_info_tabMenu');
        curIndex = $('.vTab li').index(this);
        _el.addClass('active').siblings().removeClass('active');
        vTab_item_info_tabMenu.siblings().eq(curIndex).show().siblings().hide();
    });

    /*收缩效果*/
    $('.vTab_item').on('click','.vTab_item_list .vIy',function(){
        var El=$(this);
        El.find('.vdown').toggleClass('vdownOn');
        El.parent().find('.vTab_item_list_con').toggle().parent().siblings().find('.vTab_item_list_con').hide();
        El.parent().siblings().find('.vdown').removeClass('vdownOn');
    });


    /*
     * 收缩展开
     */
    $('.set_title').on('click',function(){
        var _el=$(this);
        _el.find('.icoCtol').toggleClass('icoCtolOn')
        _el.parent().find('.mobile_set_info').toggle();
    });

    /*
     * 选项单选
     * */
    $('.p_item').on('click','li',function(){
        var _el=$(this);
        _el.addClass('active').find('.rdioas').attr('checked',true).parent().siblings().removeClass('active').find('.rdioas').attr('checked',false);
    });

</script>
</body>
</html>
