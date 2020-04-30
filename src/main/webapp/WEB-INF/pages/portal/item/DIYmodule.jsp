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

<div class="container">

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
                    <li>
                        <a href="#" class="product_item">
                            <div class="pd_img"><img src="<%=basePath%>portal/images/mobile/newmobile01.jpg" alt="产品图" class="produce_img"></div>
                            <p>华为 HUAWEI 畅享5S 金色  移动4G(2GRAM+16GROM)</p>
                            <h3 class="price_paper">
                                <span class="fl price">￥<b>899.00</b></span>
                                <b class="fr btnBuyed">购买</b>
                            </h3>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="product_item">
                            <div class="pd_img"><img src="<%=basePath%>portal/images/mobile/newmobile01.jpg" alt="产品图" class="produce_img"></div>
                            <p>华为 HUAWEI 畅享5S 金色  移动4G(2GRAM+16GROM)</p>
                            <h3 class="price_paper">
                                <span class="fl price">￥<b>899.00</b></span>
                                <b class="fr btnBuyed">购买</b>
                            </h3>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="product_item">
                            <div class="pd_img"><img src="<%=basePath%>portal/images/mobile/newmobile01.jpg" alt="产品图" class="produce_img"></div>
                            <p>华为 HUAWEI 畅享5S 金色  移动4G(2GRAM+16GROM)</p>
                            <h3 class="price_paper">
                                <span class="fl price">￥<b>899.00</b></span>
                                <b class="fr btnBuyed">购买</b>
                            </h3>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="product_item">
                            <div class="pd_img"><img src="<%=basePath%>portal/images/mobile/newmobile01.jpg" alt="产品图" class="produce_img"></div>
                            <p>华为 HUAWEI 畅享5S 金色  移动4G(2GRAM+16GROM)</p>
                            <h3 class="price_paper">
                                <span class="fl price">￥<b>899.00</b></span>
                                <b class="fr btnBuyed">购买</b>
                            </h3>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="product_item">
                            <div class="pd_img"><img src="<%=basePath%>portal/images/mobile/newmobile01.jpg" alt="产品图" class="produce_img"></div>
                            <p>华为 HUAWEI 畅享5S 金色  移动4G(2GRAM+16GROM)</p>
                            <h3 class="price_paper">
                                <span class="fl price">￥<b>899.00</b></span>
                                <b class="fr btnBuyed">购买</b>
                            </h3>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="product_item">
                            <div class="pd_img"><img src="<%=basePath%>portal/images/mobile/newmobile01.jpg" alt="产品图" class="produce_img"></div>
                            <p>华为 HUAWEI 畅享5S 金色  移动4G(2GRAM+16GROM)</p>
                            <h3 class="price_paper">
                                <span class="fl price">￥<b>899.00</b></span>
                                <b class="fr btnBuyed">购买</b>
                            </h3>
                        </a>
                    </li>
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
            <li >
                <a href="<%=basePath%>personalCenter/returnItemListPage">
                <img src="<%=basePath%>portal/images/menu/newmenu02.png" class="comIcon"/>
                <img src="<%=basePath%>portal/images/menu/newmenu02_on.png" class="onIcon"/>
                <p>全部商品</p>
                </a>
            </li>
            <li class="fCurr">
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
</html>
