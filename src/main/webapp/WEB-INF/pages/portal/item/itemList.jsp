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
    <link rel="stylesheet" type="text/css" href="<%=basePath%>portal/js/layer/mobile/need/layer.css">
    <script src="<%=basePath%>portal/js/adaptive.js"></script>
    <script type="text/javascript" src="<%=basePath%>portal/js/layer/mobile/layer.js"></script>
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

<div class="container">
    <div class="rightFixedLink ">
        <a href="javascript:share_pop();" class="toCenter vBuyer" style="display:none;"></a>
        <a href="<%=basePath%>cart/returnListPage" class="ToCar">
            <em class="carNums">0</em>
        </a>
<%--        <a href="javascript:goQiyu();" class="Tokfu"></a>--%>
<%--        <a href="javascript:;" class="ToUp"></a>--%>
    </div>
    <!--
        如果有底部菜单栏：pb98s
    -->
    <div class="content pb98s">
        <div class="rc_search">
            <div class="searchBox">
                <input type="text" class="re_field" value="" placeholder="" readonly="readonly">
                <div class="sTipsBox">
                    <i></i>
                    <span>搜索</span>
                </div>
            </div>
        </div>

        <!--
            全部产品
        -->
        <div class="all_product" id="all_product">
            <div class="all_product_info">
                <ul>
<%--                    <li>--%>
<%--                        <a href="#" class="product_item">--%>
<%--                            <div class="pd_img"><img src="<%=basePath%>portal/images/mobile/mobile01.png" alt="产品图" class="produce_img"></div>--%>
<%--                            <p>华为 HUAWEI 畅享5S 金色  移动4G(2GRAM+16GROM)</p>--%>
<%--                            <h3 class="price_paper">--%>
<%--                                <span class="fl price">￥<b>899.00</b></span>--%>
<%--                                <b class="fr btnBuyed">购买</b>--%>
<%--                            </h3>--%>
<%--                        </a>--%>
<%--                    </li>--%>
<%--                    <li>--%>
<%--                        <a href="#" class="product_item">--%>
<%--                            <div class="pd_img"><img src="<%=basePath%>portal/images/mobile/mobile01.png" alt="产品图" class="produce_img"></div>--%>
<%--                            <p>华为 HUAWEI 畅享5S 金色  移动4G(2GRAM+16GROM)</p>--%>
<%--                            <h3 class="price_paper">--%>
<%--                                <span class="fl price">￥<b>899.00</b></span>--%>
<%--                                <b class="fr btnBuyed">购买</b>--%>
<%--                            </h3>--%>
<%--                        </a>--%>
<%--                    </li>--%>
<%--                    <li>--%>
<%--                        <a href="#" class="product_item">--%>
<%--                            <div class="pd_img"><img src="<%=basePath%>portal/images/mobile/mobile01.png" alt="产品图" class="produce_img"></div>--%>
<%--                            <p>华为 HUAWEI 畅享5S 金色  移动4G(2GRAM+16GROM)</p>--%>
<%--                            <h3 class="price_paper">--%>
<%--                                <span class="fl price">￥<b>899.00</b></span>--%>
<%--                                <b class="fr btnBuyed">购买</b>--%>
<%--                            </h3>--%>
<%--                        </a>--%>
<%--                    </li>--%>
<%--                    <li>--%>
<%--                        <a href="#" class="product_item">--%>
<%--                            <div class="pd_img"><img src="<%=basePath%>portal/images/mobile/mobile01.png" alt="产品图" class="produce_img"></div>--%>
<%--                            <p>华为 HUAWEI 畅享5S 金色  移动4G(2GRAM+16GROM)</p>--%>
<%--                            <h3 class="price_paper">--%>
<%--                                <span class="fl price">￥<b>899.00</b></span>--%>
<%--                                <b class="fr btnBuyed">购买</b>--%>
<%--                            </h3>--%>
<%--                        </a>--%>
<%--                    </li>--%>
<%--                    <li>--%>
<%--                        <a href="#" class="product_item">--%>
<%--                            <div class="pd_img"><img src="<%=basePath%>portal/images/magic/magic03.jpg" alt="产品图" class="produce_img"></div>--%>
<%--                            <p>华为 HUAWEI 畅享5S 金色  移动4G(2GRAM+16GROM)</p>--%>
<%--                            <h3 class="price_paper">--%>
<%--                                <span class="fl price">￥<b>899.00</b></span>--%>
<%--                                <b class="fr btnBuyed">购买</b>--%>
<%--                            </h3>--%>
<%--                        </a>--%>
<%--                    </li>--%>
<%--                    <li>--%>
<%--                        <a href="#" class="product_item">--%>
<%--                            <div class="pd_img"><img src="<%=basePath%>portal/images/mobile/mobile01.png" alt="产品图" class="produce_img"></div>--%>
<%--                            <p>华为 HUAWEI 畅享5S 金色  移动4G(2GRAM+16GROM)</p>--%>
<%--                            <h3 class="price_paper">--%>
<%--                                <span class="fl price">￥<b>899.00</b></span>--%>
<%--                                <b class="fr btnBuyed">购买</b>--%>
<%--                            </h3>--%>
<%--                        </a>--%>
<%--                    </li>--%>
                </ul>
            </div>
        </div>
        <!--
            end 全部产品
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
            <li class="fCurr">
                <a href="<%=basePath%>personalCenter/returnItemListPage">
                    <img src="<%=basePath%>portal/images/menu/newmenu02.png" class="comIcon"/>
                    <img src="<%=basePath%>portal/images/menu/newmenu02_on.png" class="onIcon"/>
                    <p>全部商品</p>
                </a>
            </li>
            <li>
                <a href="<%=basePath%>personalCenter/returnDIYmodulePage">
                    <img src="<%=basePath%>portal/images/menu/newmenu03.png" class="comIcon"/>
                    <img src="<%=basePath%>portal/images/menu/newmenu03_on.png" class="onIcon"/>
                    <p>优惠购机</p>
                </a>
            </li>
        </div>
        <li>
            <a href="<%=basePath%>personalCenter/returnPersonalCenterPage">
                <img src="<%=basePath%>portal/images/menu/menu04.png" class="comIcon"/>
                <img src="<%=basePath%>portal/images/menu/menu04_on.png" class="onIcon"/>
                <p>我的</p>
            </a>
        </li>
    </ul>
</div>


<script type="text/javascript" src="<%=basePath%>portal/js/jquery-3.2.1.min.js" ></script>
<script type="text/javascript" src="<%=basePath%>portal/js/function.js" ></script>
<script type="text/javascript">
</script>
</body>
<script>
    $(function () {
        doSearch();
    })
    function  doSearch() {
        $.ajax({
            url: "<%=basePath%>item/ajaxSearch",
            dataType: "json",
            type: "post",
            data: {
                // "search_value": $("#search_value").val(),
                // "currPage": currPage,
                // "pageSize": pageSize,
                // "recommend":recommend
            },
            success: function (result) {
                console.log(result);
                if (result.code == "0") {
                    var list = result.itemList;
                    console.log(list)
                    //设置title
                    // $("#title").text("全部商品—" + result.merchantName);
                    //
                    // //是否未加载完
                    // if (list.length < pageSize) {
                    //     notAll = false;
                    // }
                    // currPage++;
                    var ul = "";
                    if (list.length == 0) {
                        ul += "<br/><p class=\"noOrder\">没有找到对应的商品,去搜一下其他的看看吧~</p>";
                    }
                    for (var i = 0; i < list.length; i++) {
                        //预售商品不能添加到购物车
                        var addCart = "";
                        var book = '';
                        if (list[i].presale == '1') {
                            addCart = "";
                            book = '<i class="buyedSaleOn"><b>马上开售</b></i>';
                        } else {
                            addCart=' <a href="' + list[i].publishAddress + "?merchandiseCode=" + list[i].merchandiseCode + '" class="fr btnBuyed">购买</a>\n' +
                                ' <b  class="joinCar"><input type="hidden" value="' + list[i].merchandiseCode + '" name="merchandiseCode"/></b>\n';
                        }
                        if ("1" == list[i].isSeckill && list[i].presale != '1') {
                            addCart=' <a href="' + list[i].publishAddress + "?merchandiseCode=" + list[i].merchandiseCode + '" class="fr btnBuyed" style="width:1.2rem;">立即抢购</a>\n';
                            book = '<i class="buyedSaleOn"><b>限时抢购</b></i>';
                        }
                        if ("1" == list[i].isContract || "2" == list[i].isContract) {
                            addCart = "";
                            book = "";
                        }
                        var li = '<li>\n' +
                            ' <div class="product_item">\n' +
                            book +
                            ' <div class="pd_img" onclick="javascript:window.open(\'' + list[i].publishAddress + "?merchandiseCode=" + list[i].merchandiseCode + '\',\'_self\');"><img src="' + list[i].imagePath + '" alt="产品图" class="produce_img"></div>\n' +
                            // ' <p onclick="javascript:window.open(\'' + list[i].publishAddress + "?merchandiseCode=" + list[i].merchandiseCode + '\',\'_self\');">' + list[i].merchandiseName + '</p> \n' +
                            ' <p onclick="javascript:window.open(\'' + list[i].publishAddress + "?merchandiseCode=" + list[i].merchandiseCode + '\',\'_self\');">' + list[i].merchandiseName + '</p> \n' +
                            ' <h3 class="price_paper">\n' +
                            ' <span class="fl price">￥<b>' + list[i].salePrice + '</b></span>\n' +
                            addCart+
                            ' </h3>\n' +
                            ' </div> \n' +
                            ' </li>';
                        ul += li;
                    }
                    $(".all_product_info>ul").html(ul);
                    $(".all_product_info").append('<div id="Loading" style="color:#009900;text-align:center;display:none"><img src="<%=basePath%>portal/images/u471.gif" width="100%"></div>');
                    initJoinCar();
                }
            },

        })
    }

    function initJoinCar(){
        //todo 显示具体属性，会员勾选具体数量再加入
        $(".joinCar").on('click',function () {
            //获取到商品code
            var merchandiseCode = $(this).find('input[name="merchandiseCode"]').val();
            //假设购买数量为1 todo 选择修改数量
            var buyNum = 1;
            $.ajax({
                type: "get",
                async: false,
                url: "<%=basePath%>cart/ajaxAdd?merchandiseCode=" + merchandiseCode + "&buyNum=" + buyNum,
                dataType: "json",
                success: function (result) {
                    if("0" == result.code){
                        console.log("添加商品成功")
                        layer.open({
                            content: result.msg
                            ,time: 3
                            ,skin: 'msg'
                        });
                        return;
                    }else if("1" == result.code){
                        layer.open({
                            content: result.msg
                            ,time: 3
                            ,skin: 'msg'
                        });
                        return;
                    }
                },
                error: function (result) {
                    layer.open({
                        content: "通讯错误，请稍后再试"
                        ,time: 3
                        ,skin: 'msg'
                    });
                    return;
                }
            });

        })
    }
</script>
</html>
