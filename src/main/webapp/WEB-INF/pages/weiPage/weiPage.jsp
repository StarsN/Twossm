<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    //设置页面不缓存
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@include file="../../../common/dqdp_common.jsp" %>
<jsp:include page="../../../common/dqdp_vars.jsp">
    <jsp:param name="permission" value=""></jsp:param>
    <jsp:param name="mustPermission" value=""></jsp:param>
    <jsp:param name="dict" value=""></jsp:param>
</jsp:include>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Cache-Control" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>
    <title>微页面</title>
    <link rel="stylesheet" type="text/css" href="css/base.css"/>
    <link rel="stylesheet" type="text/css" href="css/style.css"/>
    <script src="${baseURL}/js/do1/common/jquery-3.1.1.js"></script>
    <script src="${baseURL}/js/do1/common/error1.0.js"></script>
    <script src="${baseURL}/js/3rd-plug/jquery/jquery.form.js"></script>
    <script src="${baseURL}/js/layer/layer.js"></script>
    <link rel="stylesheet" type="text/css" href="plugin/swiper/swiper-4.3.5.min.css"/>
    <link rel="stylesheet" type="text/css" href="plugin/colorPicker/colorPicker.css"/>
    <script type="text/javascript" src="plugin/swiper/swiper-4.3.5.min.js"></script>
    <script type="text/javascript" src="${baseURL}/js/do1/common/common_province.js"></script>
    <style type="text/css">
    </style>
</head>
<body>
<!--[if lte IE 7]>
<style type="text/css">
    * {
        display: none;
    }
</style>
<script>
    alert("客官，对不起，您的浏览器版本太低，建议使用IE8以上版本或chrome、firefox浏览器！");
</script>
<![endif]-->

<!--[if lt IE 9]>
<script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

<!--[if lt IE 10]>
<script type="text/javascript" src="js/PIE.js"></script>
<![endif]-->
<input hidden id='pageIdhideen' value='<%=request.getParameter("pageId") %>'/>
<input hidden id='isTemplate' value='<%=request.getParameter("isTemplate") %>'/>
<div class="container">
    <div class="content">
        <div class="edit-page">
            <div class="design_preview">
                <!--编辑展示区-->
                <div class="design_item_list" id="sortable">
                    <!--页面头部-->

                    <!--可移动：dc_dragable 当前所在：dc_selected-->
                    <div class="design_preview_item tHeader" data-type="0">
                        <!--可编辑：dc_editable-->
                        <div class="d_controller dc_editable">
                            <div class="rc_preview rc_wechat">
                                <div class="rc_wechat__title" id="wymTitle">微页面标题</div>
                            </div>
                        </div>


                        <!--右侧可编辑模块-->
                        <div class="design_editor_item">
                            <div class="rc_component_config_editor">
                                <!--字段：dc_editor_group-->
                                <div class="dc_editor_group">
                                    <dl>
                                        <dt><span class="require">*</span>页面名称</dt>
                                        <dd>
                                            <input type="text" class="ipt h_title" name='title' id='right_title'
                                                   value="微页面标题" maxlength="50"/>
                                        </dd>
                                    </dl>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--页面头部 end-->


                </div>
                <!--编辑展示区 end-->

                <!--增加模块区-->
                <div class="design_add">
                    <h3 class="d_title">添加内容</h3>
                    <div class="design_add_list">
                        <ul class="class-flag">
                            <li><a href="javascript:;" data-type="1" class="dComponent">图片广告</a></li>
                            <li><a href="javascript:;" data-type="2" class="dComponent">商品</a></li>
                            <li><a href="javascript:;" data-type="3" class="dComponent">商品搜索</a></li>
                            <li><a href="javascript:;" data-type="4" class="dComponent">魔方</a></li>
                            <li><a href="javascript:;" data-type="5" class="dComponent">文本</a></li>
                            <li><a href="javascript:;" data-type="6" class="dComponent">图文导航</a></li>
                            <li><a href="javascript:;" data-type="7" class="dComponent">标题</a></li>
                            <li><a href="javascript:;" data-type="8" class="dComponent">公告</a></li>
                            <li><a href="javascript:;" data-type="9" class="dComponent">公共广告</a></li>
                            <li><a href="javascript:;" data-type="10" class="dComponent">自定义模块</a></li>
                            <li><a href="javascript:;" data-type="11" class="dComponent">优惠券</a></li>
                            <li><a href="javascript:;" data-type="12" class="dComponent">秒杀</a></li>
                            <li><a href="javascript:;" data-type="13" class="dComponent">菜单导航</a></li>
                            <li><a href="javascript:;" data-type="14" class="dComponent">辅助空白</a></li>
                            <li><a href="javascript:;" data-type="15" class="dComponent">视频</a></li>
                        </ul>
                    </div>
                </div>
                <!--增加模块区 end-->
            </div>
        </div>
    </div>

    <div class="dFooter">
        <a href="javascript:unifiedSave(2,0);" class="btn blueBtn">发布上架</a>
        <a href="javascript:unifiedSave(1,0);" class="btn">保存草稿</a>
        <a href="javascript:unifiedSave(3,0);" class="btn">预览页面</a>
    </div>
</div>

<!--弹窗背景-->
<div class="flexBg"></div>

<!--选择模板弹窗-->
<div class="common_pop modelPop" id="model_pop_id">
    <a href="javascript:;" class="closeBtn"></a>
    <div class="t_title"><span>请选择自定义模块</span></div>
    <div class="sBox">
        <input type="text" name="" class="ipt" value="" id="model_search_value"/>
        <a href="javascript:;" class="sureBtn iMl" id="model_search">搜索</a>
    </div>
    <div class="tTable">
        <table border="0" cellspacing="0" cellpadding="0">
            <thead>
            <tr>
                <td>自定义模块名称</td>
                <td>最新保存时间</td>
                <td>选择</td>
            </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>
    <div class="page">
        <div class="pRight">
            <div class="pNum">

            </div>
            <span>到第</span>
            <input type="text" id="" class="pageGo" value=""/>
            <span>页</span>
            <a href="javacsript:;" class="pSureBtn">确定</a>
        </div>
    </div>
</div>


<!--通用跳转链接弹窗-->
<div class="common_pop adPicPop" style="min-height:600px;" id="common_pop_id">
    <a href="javascript:;" class="closeBtn"></a>
    <div class="t_title"><span>请选择跳转页面</span></div>
    <div class="tabs" id='dsafdsafdd'>
        <ul>
            <li onclick="doSearchForIndex()">
                <a href="javascript:;"><span>首页</span></a>
            </li>
            <li class="tCurr" id="dafsfa" onclick="doSearchForMerchandise(1)">
                <a href="javascript:;"><span>商品</span></a>
            </li>
            <li onclick="doSearchForCoupon(1)">
                <a href="javascript:;"><span>优惠券</span></a>
            </li>
            <li onclick="doSearchForWeiPage(1)">
                <a href="javascript:;"><span>微页面</span></a>
            </li>
            <li onclick="showItemHref()">
                <a href="javascript:;"><span>全部商品列表</span></a>
            </li>
        </ul>
    </div>

    <div class="tBox">
        <div class="sBox">
            <input type="text" name="" id="searchParm" class="ipt" value=""/>
            <a href="javascript:;" class="sureBtn iMl" id="common_s">搜索</a>
        </div>
        <div class="tTable linkLabel">
            <table border="0" cellspacing="0" cellpadding="0">
                <thead id="common_thead">
                <!-- <tr>
                    <td>选择</td>
                    <td>微页面标题</td>
                    <td>创建时间</td>
                    <td>更新时间</td>
                </tr> -->
                </thead>
                <tbody id="common_tbody">
                </tbody>
            </table>
        </div>
        <div class="page" id='common_page'>
            <div class="pRight">
                <div class="pNum" id="common_aaa">
                    <!-- <a href="javacsript:;" class="prveBtn"></a>
                    <a href="javacsript:;" class="pCurr">1</a>
                    <a href="javacsript:;">2</a>
                    <a href="javacsript:;">3</a>
                    <a href="javacsript:;">4</a>
                    <a href="javacsript:;">...</a>
                    <a href="javacsript:;">9</a>
                    <a href="javacsript:;" class="nextBtn"></a> -->
                </div>
                <span>到第</span>
                <input type="text" id="common_bbb" class="pageGo" value=""/>
                <span>页</span>
                <a href="javacsript:;" id="common_ccc" class="pSureBtn">确定</a>
            </div>
        </div>
    </div>

    <div class="pop_ctrl">
        <a href="javascript:;" class="sureBtn">确定</a>
    </div>
</div>

<!--优惠券选择弹窗-->
<div class="common_pop addDCardPop" id='cardPopId'>
    <a href="javascript:;" class="closeBtn"></a>
    <div class="t_title"><span>请选择优惠券</span></div>
    <div class="tBox">
        <div class="sBox">
            <input type="text" name="" class="ipt" value="" id="card_search_value"/>
            <a href="javascript:;" class="sureBtn iMl" id="card_search">搜索</a>
        </div>
        <div class="tTable linkLabel">
            <table border="0" cellspacing="0" cellpadding="0">
                <thead>
                <tr>
                    <td>优惠券名称</td>
                    <td>价值</td>
                    <td>领券限制</td>
                    <td>有效期</td>
                    <td>库存/发放总量</td>
                    <td>已使用</td>
                    <td>状态</td>
                    <td>选择</td>
                </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
        <div class="page">
            <div class="pRight">
                <div class="pNum">

                </div>
                <span>到第</span>
                <input type="text" id="" class="pageGo" value=""/>
                <span>页</span>
                <a href="javacsript:;" class="pSureBtn">确定</a>
            </div>
        </div>
    </div>
</div>

<!--通用商品弹窗-->
<div class="common_pop addGoodPop" id="merchandise_pop">
    <a href="javascript:;" class="closeBtn"></a>
    <div class="t_title"><span>请选择商品</span></div>
    <div class="tBox">
        <div class="sBox">
            <input type="text" name="" id="merchandiseName" class="ipt" value=""/>
            <a href="javascript:;" id="searchMerchandise" class="sureBtn iMl">搜索</a>
        </div>
        <div class="tTable goodLabel">
            <table border="0" cellspacing="0" cellpadding="0">
                <thead>
                <tr>
                    <td style="width: 10%;">
                        <div class="tLabel tCheckAll">
                            <i>
                                <input type="radio" name="good" class="iCheck" value="">
                            </i>
                        </div>
                    </td>
                    <td style="width: 28%;">商品图片</td>
                    <td style="width: 30%;">商品名称</td>
                    <td style="width: 27%;">更新时间</td>
                </tr>
                </thead>
                <tbody>
                <!--							<tr>
                                                <td>
                                                    <div class="tLabel tCheckChild">
                                                        <i>
                                                            <input type="radio" name="good" class="iCheck" value="">
                                                        </i>
                                                    </div>
                                                </td>
                                                <td>
                                                    <img src="images/goodsPic01.png" class="tGoodPic"/>
                                                </td>
                                                <td>产品1</td>
                                                <td>2018-07-12  17:54</td>
                                            </tr>
                                            -->
                </tbody>
            </table>
        </div>
        <div class="page">
            <div style="float:left">
                <span>已勾选</span>
                <input type="text" id="beSelectNum" class="pageGo" value="0"/>
                <span>条记录</span>
            </div>
            <div class="pRight">
                <div class="pNum" id='aaa'>
                    <!--	<a href="javacsript:;" class="prveBtn"></a>
                        <a href="javacsript:;" class="pCurr">1</a>
                        <a href="javacsript:;">2</a>
                        <a href="javacsript:;">3</a>
                        <a href="javacsript:;">4</a>
                        <a href="javacsript:;">...</a>
                        <a href="javacsript:;">9</a>
                        <a href="javacsript:;" class="nextBtn"></a>-->
                </div>
                <span>到第</span>
                <input type="text" id="bbb" class="pageGo" value=""/>
                <span>页</span>
                <a href="javaScript:" id='ccc' class="pSureBtn">确定</a>
            </div>
        </div>
    </div>

    <div class="pop_ctrl">
        <a href="javascript:;" class="sureBtn">确定</a>
    </div>
</div>

<!--秒杀商品弹窗-->
<div class="common_pop addSkPop" id="kill_pop">
    <a href="javascript:;" class="closeBtn"></a>
    <div class="t_title"><span>请选择商品</span></div>
    <div class="tBox">
        <div class="sBox">
            <input type="text" name="" id="search_kill_name" class="ipt" value=""/>
            <a href="javascript:;" class="sureBtn iMl" onclick="doSearchForKill(1)">搜索</a>
        </div>
        <div class="tTable skLabel">
            <table border="0" cellspacing="0" cellpadding="0">
                <thead>
                <tr>
                    <td style="width: 10%;">
                        <div class="tLabel tCheckAll">
                            <i>
                                <input type="radio" name="good" class="iCheck" value="">
                            </i>
                        </div>
                    </td>
                    <td style="width: 28%;">商品图片</td>
                    <td style="width: 20%;">商品名称</td>
                    <td style="width: 20%;">活动名称</td>
                    <td style="width: 22%;">状态</td>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
        <div class="page">
            <div class="pRight">
                <div class="pNum">
                    <!-- <a href="javacsript:;" class="prveBtn"></a>
                    <a href="javacsript:;" class="pCurr">1</a>
                    <a href="javacsript:;">2</a>
                    <a href="javacsript:;">3</a>
                    <a href="javacsript:;">4</a>
                    <a href="javacsript:;">...</a>
                    <a href="javacsript:;">9</a>
                    <a href="javacsript:;" class="nextBtn"></a> -->
                </div>
                <span>到第</span>
                <input type="text" id="" class="pageGo" value=""/>
                <span>页</span>
                <a href="javacsript:;" class="pSureBtn">确定</a>
            </div>
        </div>
    </div>

    <div class="pop_ctrl">
        <a href="javascript:;" class="sureBtn" id="ddddf">确定</a>
    </div>
</div>

<!--图片广告限制个数提示-->
<div class="adPicTips">
    <p>最多允许添加5个广告图</p>
</div>

<script type="text/javascript" src="plugin/jquery_ui/jquery-ui.min.js"></script>
<script type="text/javascript" src="plugin/colorPicker/colorPicker.js"></script>
<script type="text/javascript" src="js/function.js"></script>
<!--图片广告-->
<script type="text/javascript" src="js/setPic.js"></script>
<!--图片广告-->
<script type="text/javascript" src="js/setVideo.js"></script>
<!--商品-->
<script type="text/javascript" src="js/goods.js"></script>
<!--商品搜索-->
<script type="text/javascript" src="js/search.js"></script>
<!--文本-->
<script type="text/javascript" src="js/itext.js"></script>
<!--魔方-->
<script type="text/javascript" src="js/magic_cube.js"></script>
<!--图文导航-->
<script type="text/javascript" src="js/nav.js"></script>
<!--标题-->
<script type="text/javascript" src="js/title.js"></script>
<!--公告-->
<script type="text/javascript" src="js/notice.js"></script>
<!--公共广告-->
<script type="text/javascript" src="js/public_notice.js"></script>
<!--自定义模板-->
<script type="text/javascript" src="js/model.js"></script>
<!--优惠券-->
<script type="text/javascript" src="js/dCard.js"></script>
<!--秒杀-->
<script type="text/javascript" src="js/sKill.js"></script>
<!--底部菜单导航-->
<script type="text/javascript" src="js/fMenu.js"></script>
<!--辅助空白-->
<script type="text/javascript" src="js/space.js"></script>
<!--设置页面最小高度-->
<script type="text/javascript" src="js/setMinHeight.js"></script>
<!--统一提交 -->
<script type="text/javascript" src="js/submit.js"></script>
<!--初始化 -->
<script type="text/javascript" src="js/init.js"></script>
<!--通用弹窗 -->
<script type="text/javascript" src="js/pop.js"></script>
<!--初始化(自定义模块，公告广告) -->
<script type="text/javascript" src="js/initCustom.js"></script>
<script type="text/javascript">
    var iHeight, rHeight;

    function iResize() {
        iHeight = $(window).height() - 80;
        $('.content').css('min-height', iHeight + 'px');
    }

    iResize();
    $(window).resize(function () {
        iResize();
    });

    $("#sortable").sortable({
        revert: true,
        opacity: 0.9,
        cancel: ".design_editor_item, .tHeader, .dc_footer"
    });
    $(".design_item_list").find('.d_controller').disableSelection();

    /*拖动排序*/
    $(".edit-page #adPicBox").sortable().disableSelection();

    /**/
    $('.design_item_list').on('keyup change', '.h_title', function () {
        var el = $(this);
        var hVal = el.val();
        el.parents('.tHeader').find('.rc_wechat__title').text(hVal);
    });

    $('.closeBtn').on('click', function () {
        $('.flexBg, .common_pop').hide();
    });

</script>
<script type="text/javascript">
    $("#ifm").attr('height', '1000');
    var pageId = $('#pageIdhideen').val();
    if (pageId != '' && pageId != 'null') {
        init(pageId);
    }
    doSearchForMerchandise(1);

    $(function(){
        //微页面标题
        $(document).on("blur",".h_title",function(){
            if(!testVar($(this).val())){
                $(this).val("");
                $("#wymTitle").html("微页面标题");
            }
        });
        //广告标题
        $(document).on("blur",".at_title",function(){
            if(!testVar($(this).val())){
                $(this).val("");
                $(this).parents("div[class=design_editor_item]").siblings().find("h3[class=s_title]").html("");
                //$("h3[class=s_title]").html("");
            }
        });
        //广告链接
        $(document).on("blur",".at_link",function(){
            if(!testVar($(this).val())){
                $(this).val("");
                $(this).parents("div[class=design_editor_item]").siblings().find("a").attr("href","");
            }
        });
        //搜索框
        $(document).on("blur",".sHolder",function(){
            if(!testVar($(this).val())){
                $(this).val("");
                $(this).parents("div[class=design_editor_item]").siblings().find("span").html("");
            }
        });
        //图文导航
        $(document).on("blur",".nav_name",function(){
            if(!testVar($(this).val())){
                $(this).val("");
                var indexx = $(this).parents(".add_nav_list").find(".add_nav_set").index($(this).parents(".add_nav_set"));
                $(this).parents("div[class=design_editor_item]").siblings().find("ul li").eq(indexx).find("h3").html("");
                //标题的导航名称
                $(this).parents("div[class=design_editor_item]").siblings().find(".cap_title_custom_link").html("");
            }
        });
        $(document).on("blur",".nav_link",function(){
            if(!testVar($(this).val())){
                $(this).val("");
                var indexx = $(this).parents(".add_nav_list").find(".add_nav_set").index($(this).parents(".add_nav_set"));
                $(this).parents("div[class=design_editor_item]").siblings().find("ul li").eq(indexx).find("a").attr("href","");
                //标题导航的连接
                $(this).parents("div[class=design_editor_item]").siblings().find("a").html("");
            }
        });
        //标题
        $(document).on("blur",".nav_title",function(){
            if(!testVar($(this).val())){
                $(this).val("");
                $(this).parents("div[class=design_editor_item]").siblings().find("span").html("");
            }
        });
        //---副标题
        $(document).on("blur",".sub_title",function(){
            if(!testVar($(this).val())){
                $(this).val("");
                $(this).parents("div[class=design_editor_item]").siblings().find("p").html("");
            }
        });
        //公告
        $(document).on("blur",".noticeWord",function(){
            if(!testVar($(this).val())){
                $(this).val("");
                $(this).parents("div[class=design_editor_item]").siblings().find(".d-notice-bar_content").html("");
            }
        });
        $(document).on("blur",".noticeLink",function(){
            if(!testVar($(this).val())){
                $(this).val("");
                $(this).parents("div[class=design_editor_item]").siblings().find("a").attr("href","");
            }
        });
        //菜单导航
        $(document).on("blur",".menu_name",function(){
            if(!testVar($(this).val())){
                $(this).val("");
                var indexx = $(this).parents(".fMenuSetBox").find(".fMenuSet").index($(this).parents(".fMenuSet"));
                $(this).parents("div[class=design_editor_item]").siblings().find("ul .dUserSet li").eq(indexx).find("p").html("");
            }
        });
        $(document).on("blur",".menu_link",function(){
            if(!testVar($(this).val())){
                $(this).val("");
                var indexx = $(this).parents(".fMenuSetBox").find(".fMenuSet").index($(this).parents(".fMenuSet"));
                $(this).parents("div[class=design_editor_item]").siblings().find("ul .dUserSet li").eq(indexx).find("a").attr("href","");
            }
        });


    })


    function testVar(content){
        //var patrn=/[`~@#$^*()_+<>:"{},.;'[\]]/im;
        var patrn=/[`~@#$^*()<>']/im;
        //https://m-eshare.jd.com/zulin/channelcode/ZYD-XS?from=zydxssj
        if(patrn.test(content)){
            alert("提示信息：您输入的数据含有非法字符！");
            return false;
        }
        return true;
    }
</script>
</body>
</html>