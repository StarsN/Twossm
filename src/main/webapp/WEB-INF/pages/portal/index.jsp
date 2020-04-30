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
    <link rel="stylesheet" type="text/css" href="<%=basePath%>portal/plugin/swiper/swiper-4.3.5.min.css" />
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
    <!--如果有底部菜单栏：padding-bottom-->
    <div class="content" style="bottom: 0.98rem;">
        <div class="rc_search">
            <div class="searchBox">
                <input type="text" class="re_field" value="" placeholder="" readonly="readonly">
                <div class="sTipsBox">
                    <i></i>
                    <span>搜索</span>
                </div>
            </div>
        </div>
        <div class="adPicBox">
            <div class="one_big_two_small">
                <div class="swiper-container" id="swiper01">
                    <ul class="swiper-wrapper">
                        <li class="swiper-slide">
                            <a href="javascript:;">
                                <img src="<%=basePath%>portal/images/slide/slide01.jpg"/>
                            </a>
                        </li>
                        <li class="swiper-slide">
                            <a href="javascript:;">
                                <img src="<%=basePath%>portal/images/slide/slide02.jpg"/>
                            </a>
                        </li>
                        <li class="swiper-slide">
                            <a href="javascript:;">
                                <img src="<%=basePath%>portal/images/slide/slide03.jpg"/>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="space" style="background: #FFF;"></div>

        <div class="cap_image_ad cap_fixed">
            <ul class="cap_image_nav fourNav">
                <li class="image-wrapper">
                    <a href="javascript:;" class="cap_image_ad_link">
                        <div class="cap_image_ad_image">
                            <img src="<%=basePath%>portal/images/nav/newnav01.png"/>
                        </div>
                        <h3 class="cap_image_ad_title dText" style="color: #313132;"><span>4G业务</span></h3>
                    </a>
                </li>
                <li class="image-wrapper">
                    <a href="javascript:;" class="cap_image_ad_link">
                        <div class="cap_image_ad_image">
                            <img src="<%=basePath%>portal/images/nav/newnav02.png"/>
                        </div>
                        <h3 class="cap_image_ad_title dText" style="color: #313132;"><span>预存换机</span></h3>
                    </a>
                </li>
                <li class="image-wrapper">
                    <a href="javascript:;" class="cap_image_ad_link">
                        <div class="cap_image_ad_image">
                            <img src="<%=basePath%>portal/images/nav/newnav03.png"/>
                        </div>
                        <h3 class="cap_image_ad_title dText" style="color: #313132;"><span>热机推荐</span></h3>
                    </a>
                </li>
                <li class="image-wrapper">
                    <a href="javascript:;" class="cap_image_ad_link">
                        <div class="cap_image_ad_image">
                            <img src="<%=basePath%>portal/images/nav/newnav04.png"/>
                        </div>
                        <h3 class="cap_image_ad_title dText" style="color: #313132;"><span>优惠专区</span> </h3>
                    </a>
                </li>
            </ul>
        </div>

        <div class="space" style="background: #FFF;"></div>

        <div class="adPicBox">
            <div class="one_line_and_one">
                <div class="swiper-container">
                    <ul class="swiper-wrapper">
                        <li class="swiper-slide">
                            <a href="javascript:;">
                                <img src="<%=basePath%>portal/images/rc_title04.png">
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="goodList gsSmall">
            <ul>
                <li>
                    <a href="#" class="toLink">
                        <div class="goodsPic">
                            <img src="<%=basePath%>portal/images/mobile/newmobile01.jpg"/>
                        </div>
                        <div class="goodMsg gCenter">
                            <h3 class="good_name">华为P20</h3>
                            <div class="good_dMsg">
                                <span class="goodPrice">¥ 999</span>
                            </div>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="#" class="toLink">
                        <div class="goodsPic">
                            <img src="<%=basePath%>portal/images/mobile/newmobile02.jpg"/>
                        </div>
                        <div class="goodMsg gCenter">
                            <h3 class="good_name">vivo R15</h3>
                            <div class="good_dMsg">
                                <span class="goodPrice">¥ 999</span>
                            </div>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="#" class="toLink">
                        <div class="goodsPic">
                            <img src="<%=basePath%>portal/images/mobile/newmobile03.jpg"/>
                        </div>
                        <div class="goodMsg gCenter">
                            <h3 class="good_name">iPhone 8</h3>
                            <div class="good_dMsg">
                                <span class="goodPrice">¥ 999</span>
                            </div>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="#" class="toLink">
                        <div class="goodsPic">
                            <img src="<%=basePath%>portal/images/mobile/newmobile04.jpg"/>
                        </div>
                        <div class="goodMsg gCenter">
                            <h3 class="good_name">华为P20</h3>
                            <div class="good_dMsg">
                                <span class="goodPrice">¥ 999</span>
                            </div>
                        </div>
                    </a>
                </li>
            </ul>
        </div>
    </div>

    <!--
    底部四大入口
-->
    <div class="footer fourMenu">
        <ul>
            <div class="dUserSet">
                <li class="fCurr">
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
            <li>
                <a href="<%=basePath%>personalCenter/returnPersonalCenterPage">
                    <img src="<%=basePath%>portal/images/menu/menu04.png" class="comIcon"/>
                    <img src="<%=basePath%>portal/images/menu/newmenu04_on.png" class="onIcon"/>
                    <p>我的</p>
                </a>
            </li>
        </ul>
    </div>
</div>
<script type="text/javascript" src="<%=basePath%>portal/js/jquery-3.2.1.min.js" ></script>
<script type="text/javascript" src="<%=basePath%>portal/plugin/swiper/swiper-4.3.5.min.js" ></script>
<script type="text/javascript" src="<%=basePath%>portal/js/function.js" ></script>
<script type="text/javascript">
    mySwiper1 = new Swiper('#swiper01', {
        effect: 'coverflow',
        grabCursor: true,
        centeredSlides: true,
        autoplay: true,
        loop: true,
        slidesPerView: 'auto',
        coverflowEffect: {
            rotate: 50,
            stretch: 0,
            depth: 100,
            modifier: 1,
            slideShadows: true,
        },
        on:{
            init: function(swiper){
                setTimeout(function(){
                    mySwiper1.update();
                }, 0)
            },
        }
    })

    mySwiper2 = new Swiper('#swiper02', {
        slidesPerView: 'auto',
        spaceBetween: 12,
        autoplay: true,
        pagination: {
            clickable: true,
        },
        on:{
            init: function(swiper){
                setTimeout(function(){
                    mySwiper2.update();
                }, 0)
            },
        }
    });

</script>
</body>
</html>
