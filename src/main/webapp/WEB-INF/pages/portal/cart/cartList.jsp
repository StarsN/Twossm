<%@ page language="java" import="java.util.*,java.net.URLDecoder" pageEncoding="utf-8"%>
<%
    //获取请求上下文
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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

<div class="container bgfff pb98s" id="ch_ad">
</div>
<!--
    底部
-->
<div class="fixed_bottom">
    <div class="fl car_jl">
        <div class="fl car_jl_fl">
            <input type="checkbox" name="" id="checkAll" value="" class="form_check">
            <span>全选</span>
        </div>
        <div class="fr car_jl_fr">
            <p>合计： <em id="totalPrice">0.00</em></p>
            <h3>不含运费</h3>
        </div>
    </div>
    <div class="fr car_jr">
        <a href="javascript:void(0);" id="submit_btn">
            <span class="joint">结算<span>(<em id="totalNum">0</em>)</span></span>
        </a>
    </div>
</div>


<!--遮罩层-->
<div class="flexBg" style="display: none;"></div>

<!--优惠券 弹窗-->
<div class="yhq_pop">
    <h3 class="yhq_title">店铺优惠券</h3>
    <div class="yhq_pop_info">
        <div id="availability" class="coupons">
            <div class="coupons_item">
                <div class="fl coupons_left">
                    <h3>¥50</h3>
                    <p>满999可用</p>
                </div>
                <div class="coupons_right">
                    <h3>50元代金券</h3>
                    <a href="#" class="btnBuyed">领取</a>
                    <p>2019-07-10至2019-12-30</p>
                </div>
            </div>
            <div class="coupons_item">
                <div class="fl coupons_left">
                    <h3>¥50</h3>
                    <p>满999可用</p>
                </div>
                <div class="coupons_right">
                    <h3>50元代金券</h3>
                    <a href="#" class="btnBuyed">领取</a>
                    <p>2019-07-10至2019-12-30</p>
                </div>
            </div>
            <div class="coupons_item">
                <div class="fl coupons_left">
                    <h3>¥50</h3>
                    <p>满999可用</p>
                </div>
                <div class="coupons_right">
                    <h3>50元代金券</h3>
                    <a href="#" class="btnBuyed">领取</a>
                    <p>2019-07-10至2019-12-30</p>
                </div>
            </div>
        </div>
    </div>
    <div class="mbtn">
        <a href="javascript:hideYhq_card();" class="btn_finish">完成</a>
    </div>
</div>




<script type="text/javascript" src="<%=basePath%>portal/js/jquery-3.2.1.min.js" ></script>
<script type="text/javascript" src="<%=basePath%>portal/js/function.js" ></script>
<script type="text/javascript" src="<%=basePath%>portal/js/layer/layer.js"></script>

<script type="text/javascript">
    //初始化---
    $(function () {
        getCartInfo();
        // getCouponList();//获取店铺优惠券列表
    });

    /*
     * 点击编辑显示删除按钮
     */
    $('.car_menu').on('click','.car_menu_list .btn_edit',function(){
        var el=$(this);
        el.parent().parent().parent().find('.car_menu_list_info li').toggleClass('on');

        if (el.parent().parent().parent().find('.car_menu_list_info li').hasClass('on')) {
            el.parent().parent().parent().find('.car_menu_list_info li').addClass('on');
            el.text('取消编辑');
        } else{
            el.parent().parent().parent().find('.car_menu_list_info li').removeClass('on');
            el.text('编辑');
        }
    })

    /*
      * 删除数据列
      */
    $('.car_menu').on('click','.car_menu_list .car_menu_list_info li .deleteProductList',function(){
        var el=$(this);
        el.parent().remove();
    })

    /*全选整列*/
    // $('.car_menu').on('click','.car_menu_top .form_check_inner',function(){
    //     var el=$(this);
    //     el.toggleClass('form_checkOn');
    //     if(el.hasClass('form_checkOn')){
    //         el.parent().parent().parent().parent().find('.form_check').addClass('form_checkOn').attr('checked',true);
    //
    //     }else{
    //         el.parent().parent().parent().parent().find('.form_check').removeClass('form_checkOn').attr('checked',false);
    //     }
    // });

    /*全选全部*/
    // $('#checkAll').on('click',function(){
    //     var el=$(this);
    //     el.toggleClass('form_checkOn');
    //
    //     if(el.hasClass('form_checkOn')){
    //         $('.car_menu').find('.form_check').addClass('form_checkOn').attr('checked',true);
    //     }else{
    //         $('.car_menu').find('.form_check').removeClass('form_checkOn').attr('checked',false);
    //     }
    // });

    /*选中一条*/
    // $('.car_menu').on('click','.car_menu_list .car_menu_list_info .form_check',function(){
    //     var _el=$(this);
    //     _el.toggleClass('form_checkOn');
    //     if(_el.hasClass('form_check')){
    //         _el.attr('checked',true);
    //     }else{
    //         _el.attr('checked',false);
    //     }
    // });

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

    //结算
    function cartSubmit() {
        var ids = [];
        $(".car_menu_list_info .form_checkOn").each(function (index, domEle) {
            ids[index] = $(domEle).val();
        });
        window.location.href = "<%=basePath%>order/cart2Submit?cartIds=" + ids.join();
    }
    //获取 购物车列表
    function getCartInfo() {
        $.ajax({
            url: "<%=basePath%>cart/ajaxSearch",
            type: "post",
            dataType: "json",
            data: {
                // "MEMBER_ID": MEMBER_ID,
            },
            success: function (result) {
                if (result.code == "1") {
                    window.location.href = result.data.url;
                } else {
                    var cartListVO = result.cartVOList;
                    var all = '';
                    console.log(cartListVO)
                    for (var i = 0; i < cartListVO.length; i++) {
                        var cartVO = cartListVO[i];
                        var merchantName = cartVO.merchantName;
                        var cartList = cartVO.cartList;
                        var ul = '';
                        //修改需求--只有一个店铺，所以cartListVO.length的长度只有一
                        if (cartList.length == 0) {
                            ul += '<br/><p style="text-align: center;color: #666;font-size: 0.24rem;">您的购物车还没有商品</p></br><p style="text-align: center;color: #666;font-size: 0.24rem;"><a href="'+document.location.protocol+'//' + document.domain + '">赶紧去店铺逛逛吧~<a></p>';
                        }
                        for (var j = 0; j < cartList.length; j++) {
                            //若商品下架购物车商品不能选中
                            var style = '';
                            var check_btn = '<input type="checkbox"  name="cartIds" id="check_id" value="' + cartList[j].cartId + '" class="SJcheck form_check"/>';
                            var onclick = 'onclick="gotoItemInfo(\'' + cartList[j].publishAddress + '\')"';
                            if (cartList[j].itemStatus != "1") {
                                style = 'style="opacity:0.2;cursor:test;"'
                                check_btn = '<a href="javascript:delCart(\'' + cartList[j].cartId + '\')" id="item_xiajia" >删除</a>';
                                onclick = '';
                            }
                            var ruleContent = "";
                            // if(cartList[j].attrMsgVO!=null&&cartList[j].attrMsgVO!=''){
                            //     ruleContent=cartList[j].attrMsgVO.ruleContent;
                            // }else{
                            //     ruleContent='';
                            // }
                            var ruleTime="";
                            var li =
                                '<li id="del_li_' + cartList[j].cartId + '">' +
                                '<div class="car_menu_producter">' +
                                '<div class="fl ctol">' +
                                check_btn +
                                '</div>' +
                                '<div class="car_list_dShow">' +
                                '<div class="fl car_list_dShow_img"' + onclick +'><img src="' + cartList[j].imagePath +'" alt="img"/></div>' +
                                '<div class="car_list_dShow_info">' +
                                '<p class="mobile_db">' + cartList[j].merchandiseName + '</p>' +
                                '<h3>' + cartList[j].attributeDesc + '<span style="display:none;" class="ruleContent" >'+ruleContent+'</span><input type="hidden" class="ruleTime" value="'+ruleTime + '"/></h3>' +
                                '<h4>' +
                                '<span class="fl c_price">￥<em id="c_price">' + cartList[j].cashPrice + '</em></span>' +
                                '</em></span><span class="fr cNum">x<em id="cNum" class="buyNum_cl">' + cartList[j].buyNum + '</em></span>' +
                                '<div class="ctolBox" style="display: none;">'+
                                '<div class="fr p_count_r">' +
                                '<a href="javascript:;" class="fl ico_min"><em></em></a>' +
                                '<input type="text" name="" id="" value="' + cartList[j].buyNum + '" class="fl numEnter">' +
                                '<a href="javascript:;" class="fl ico_add"><em></em></a>' +
                                '</div>' +
                                '</div>' +
                                '</h4>' +
                                '</div>' +
                                '</div>' +
                                '</div>' +
                                '<a class="deleteProductList" href="javascript:delCart(\'' + cartList[j].cartId + '\');">删除</a>' +
                                '</li>';
                            ul += li;
                        }
                        var cartVO =
                            // '<div class="container bgfff pb98s">' +
                            '<div class="content">' +
                            '<div class="carPage">' +
                            '<div class="car_menu">' +
                            '<div class="car_menu_list">' +
                            '<h3 class="car_menu_top">' +
                            '<div class="fl car_menu_top_l">' +
                            '<div class="fl check_layer">' +
                            '<input type="checkbox" name="" id="btn1" value="" class="form_check form_check_inner">' +
                            '</div>' +
                            '<div class="fl bdName"><i class="icoDp"></i><span>' + merchantName + '</span></div>' +
                            '</div>' +
                            '<div class="fr car_menu_top_r">' +
                            '<a href="javascript:;" class="btn_edit">编辑</a>' +
                            '</div>' +
                            '</h3>' +
                            '<div class="mobile_set">' +
                            '<h3 class="set_title lqCard" onclick="showYhq_card()"><i class="icoCard"></i><em>领取优惠券</em></h3>' +
                            '</div>' +
                            '<div class="car_menu_list_info">' +
                            '<ul>' +
                            ul +
                            '</ul>' +
                            '</div>' +
                            '</div>' +
                            '</div>' +
                            '</div>' +
                            '</div>';
                            // '</div>';
                        all += cartVO;
                    }
                    $("#ch_ad").html(all);
                    laterbind();
                }
            }
        })
    }
    //校验总件数和总金额
    function changetotal() {
        var totalPrice = 0.00;
        var totalNum = 0;
        $(".car_menu_list_info").find(".form_checkOn").each(function (index, domEle) {
            console.log(index)
            var value = $(domEle).parent().parent().find("#c_price").text();
            value = parseFloat(value);
            var num = $(domEle).parent().parent().find("#cNum").text();
            num = parseFloat(num);
            console.log(num)
            totalPrice += (value * num);
            totalNum += num;
        });

        $("#totalPrice").text(totalPrice.toFixed(2));
        $("#totalNum").text(totalNum);
        if (totalNum != 0) {
            $(".joint").css('opacity', '1');
            $(".joint").css('cursor', 'pointer');
            $("#submit_btn").attr('href', 'JavaScript:cartSubmit();');
        } else {
            $(".joint").css('opacity', '0.2');
            $(".joint").css('cursor', 'text');
            $("#submit_btn").attr('href', 'JavaScript:return false;');
        }
    }
    function checkStock() {
        $(".buyNum_cl").each(function (index, domEle) {
            var cartId = $(domEle).parents('li').find("#check_id").val();
            if (cartId == null) {
                return;
            }
            var stock = getStockByCartId(cartId);
            var num = parseInt($(domEle).text());
            if (num > stock) {
                layer.tips('库存不足,当前最大库存为' + stock, $(this), {
                    tips: [1, '#3595CC'],
                    time: 4000
                });
                $(domEle).text(stock);
                $(domEle).parents("li").find(".numEnter").val(stock);
                //修改数据库中的购物车商品数量
                changeCartNum(cartId, stock);

            }

            //商品规格被删除，变灰,2018/8/16,@xiejianbin
            if(stock==-1){
                layer.tips('商品已失效，无法购买', $(domEle).parents('li ').find(".car_list_dShow div").eq(0), {
                    tips : [ 1, '#3595CC' ],
                    tipsMore: true,
                    time : 4000
                });

                //使商品变灰
                //清空checkbox
                $(domEle).parents('li ').find(".ctol").html("");
                //增加删除按钮
                var del_item = "<a href='javascript:delCart('"+cartId+"')' >删除</a>";
                $(domEle).parents('li ').find(".ctol").append(del_item);

                //变灰商品图片
                $(domEle).parents('li ').find(".car_list_dShow div").eq(0).attr("style","opacity:0.2;cursor:test;");
                //去掉图片click方法
                $(domEle).parents('li ').find(".car_list_dShow div").eq(0).removeAttr("onclick");
                //隐藏金额
                $(domEle).parents('li ').find(".c_price").hide();
            }
        })
    };
    //根据购物车ID查对应商品库存
    function getStockByCartId(cartId) {
        var stock;
        $.ajax({
            async: false,
            url: "<%=basePath%>cart/getStockByCartId",
            dataType: "json",
            type: "post",
            data: {
                "cartId": cartId,
            },
            success: function (result) {
                if (result.code == "0") {
                    stock = result.stock;
                } else {
                    layer.msg(result.desc);
                }
            },
            error: function (result) {
                layer.msg("查询库存失败!");
            }
        })
        return stock;
    }
    //修改购物车商品数量
    function changeCartNum(cartId, num) {
        $.ajax({
            url: '<%=basePath%>cart/ajaxUpdate',
            dataType: 'json',
            type: 'post',
            data: {
                "num": num,
                "cartId": cartId,
            },
            success: function (result) {
                if (result.code != "0") {
                    layer.msg(result.desc);
                }
                ;
            },
            error: function (result) {
                layer.msg("编辑失败!");
            }
        });
    };
    //删除购物车项
    function delCart(cartId) {
        $.ajax({
            url: '<%=basePath%>cart/ajaxDeleteCart',
            dataType: 'json',
            type: 'post',
            data: {
                "cartId": cartId,
            },
            success: function (result) {
                if (result.code == "0") {
                    var p = $("#del_li_" + cartId).parents(".car_menu_list_info");
                    $("#del_li_" + cartId).remove();
                    if (p.find(".ctolBox").length == 0) {
                        // p.remove();
                        window.location.href="<%=basePath%>cart/returnListPage";
                    }
                } else {
                    layer.msg(result.desc);
                }
                ;
            },
            error: function (result) {
                layer.msg("删除商品失败!");
            }
        })
    }
    //拼接完html后绑定
    function laterbind() {
        //新页面 start
        /*全选整列*/
        $('.car_menu').on('click','.car_menu_top .form_check_inner',function(){
            var el=$(this);
            el.toggleClass('form_checkOn');
            if(el.hasClass('form_checkOn')){
                el.parent().parent().parent().parent().find('.form_check').addClass('form_checkOn').attr('checked',true);

            }else{
                el.parent().parent().parent().parent().find('.form_check').removeClass('form_checkOn').attr('checked',false);
            }
            changetotal();

        });

        /*全选全部*/
        $('#checkAll').on('click',function(){
            var el=$(this);
            el.toggleClass('form_checkOn');
            if(el.hasClass('form_checkOn')){
                $('.car_menu').find('.form_check').addClass('form_checkOn').attr('checked',true);
            }else{
                $('.car_menu').find('.form_check').removeClass('form_checkOn').attr('checked',false);
            }
            changetotal();
        });

        /*选中一条*/
        $('.car_menu').on('click','.car_menu_list .car_menu_list_info .form_check',function(){
            var _el=$(this);
            _el.toggleClass('form_checkOn');
            if(_el.hasClass('form_checkOn')){
                _el.addClass("form_checkOn").attr('checked',true);
            }else{
                _el.removeClass("form_checkOn").attr('checked',false);
            }
            changetotal();
        });

        //新页面 end

        //校验库存
        checkStock();

        //商品下架提示
        // if ($("#item_xiajia").length != 0) {
        //     layer.tips('该商品已下架', '#item_xiajia', {
        //         tips: [1, '#3595CC'],
        //         time: 4000
        //     });
        // }
        //编辑
        $(".btn_edit")
            .on(
                'click',
                function () {
                    var _el = $(this);
                    //下架商品不能编辑
                    var SJ_check = $(".SJcheck");
                    if (_el.text() == "编辑") {
                        //删除按钮出来
                        _el.parent().parent().parent().find('.car_menu_list_info li').toggleClass('on');
                        if (_el.parent().parent().parent().find('.car_menu_list_info li').hasClass('on')) {
                            _el.parent().parent().parent().find('.car_menu_list_info li').addClass('on');
                            _el.text('取消编辑');
                        } else{
                            _el.parent().parent().parent().find('.car_menu_list_info li').removeClass('on');
                            _el.text('编辑');
                        }
                        _el.text("取消编辑");
                        //下架商品不能编辑
                        // SJ_check.parents("li").find(".mobile_db,.cNum").hide();
                        SJ_check.parents("li").find(".cNum").hide();
                        SJ_check.parents("li").find(".ctolBox").show();
                        // SJ_check.parents("li").find(".sw_delete").animate({right: '0rem'});

                        /* _el.parents(".car_menu_list").find(
                                ".mobile_db,.cNum").hide();
                        _el.parents(".car_menu_list").find(".p_count_r")
                                .show();
                        _el.parents(".car_menu_list")
                                .find(".sw_delete").animate({
                                    right : '0rem'
                                }); */
                        //解绑购物车选中事件--编辑期间不能选中
                        $(".form_check").unbind("click");
                        //结算
                        $(".joint").css('opacity', '0.2');
                        $(".joint").css('cursor', 'text');
                        $("#submit_btn").attr('href',
                            'JavaScript:return false;');
                    } else {
                        //重新绑定选中购物车事件
                        bindClick();
                        //更新数据
                        SJ_check.parents("li").find(".numEnter").each(function (index, domEle) {
                            var _num = $(domEle).parents("li").find("#cNum").text() - 0;
                            var num = $(domEle).val();
                            if (num == null || num == "") {
                                num = _num;
                                $(domEle).val(_num);
                            } else {
                                $(domEle).parents("li").find("#cNum").text(num);
                            }
                            var cartId = $(domEle).parents('li').find("#check_id").val();
                            num = num - 0;
                            var stock = getStockByCartId(cartId);
                            //若修改完后数量超过库存,则数量等于库存
                            if (num > stock) {
                                layer.tips('已达库存上限', $(domEle), {
                                    tips: [1, '#3595CC'],
                                    time: 4000
                                });
                                num = stock;
                                $(domEle).val(num);
                                $(domEle).parents("li").find("#cNum").text(num);
                            }
                            ;
                            //修改购物车商品数量
                            changeCartNum(cartId, num);

                        });
                        // //修改完成后的样式
                        _el.text("编辑");
                        // _el.parents(".car_menu_list").find(".mobile_db,.cNum").show();
                        _el.parents(".car_menu_list").find(".cNum").show();
                        _el.parents(".car_menu_list").find(".ctolBox").hide();
                        // _el.parents(".car_menu_list").find(".sw_delete").animate({right: '-1rem'});
                        // //删除按钮
                        _el.parent().parent().parent().find('.car_menu_list_info li').toggleClass('on');
                        if (_el.parent().parent().parent().find('.car_menu_list_info li').hasClass('on')) {
                            _el.parent().parent().parent().find('.car_menu_list_info li').addClass('on');
                            _el.text('取消编辑');
                        } else{
                            _el.parent().parent().parent().find('.car_menu_list_info li').removeClass('on');
                            _el.text('编辑');
                        }
                        changetotal();
                    }
                });

        //减少商品数量
        $(".ico_min").on(
            'click',
            function () {
                var value = $(this).siblings("input").val();
                if (value <= 1) {
                    //删除购物车
                    var cartId = $(this).parents("li").find("#check_id").val();
                    delCart(cartId);
                } else {
                    $(this).siblings("input").val(value - 1);
                    $(this).parents(".car_list_dShow_info").find("#cNum")
                        .text(value - 1);
                }

            })

        //增加商品数量
        $(".ico_add").on(
            'click',
            function () {
                var cartId = $(this).parents("li").find("#check_id").val();
                var stock = getStockByCartId(cartId);
                var value = parseInt($(this).siblings("input").val());
                console.log(value)
                if (value >= stock) {
                    layer.tips('已达库存上限', $(this), {
                        tips: [1, '#3595CC'],
                        time: 4000
                    });
                    $(this).siblings("input").val(stock);
                    $(this).parents(".car_list_dShow_info").find("#cNum").text(
                        stock);
                } else {
                    $(this).siblings("input").val(value + 1);
                    $(this).parents(".car_list_dShow_info").find("#cNum").text(
                        value + 1);
                    console.log($(this).parents(".car_list_dShow_info").find("#cNum").text())
                }

            })
        //点击事件绑定
        function bindClick() {
            //新页面
            /*全选整列*/
            $('#btn1').on('click','.car_menu_top .form_check_inner',function(){
                var el=$(this);
                el.toggleClass('form_checkOn');
                if(el.hasClass('form_checkOn')){
                    el.parent().parent().parent().parent().find('.form_check').addClass('form_checkOn').attr('checked',true);

                }else{
                    el.parent().parent().parent().parent().find('.form_check').removeClass('form_checkOn').attr('checked',false);
                }
                changetotal();

            });

            /*全选全部*/
            $('#checkAll').on('click',function(){
                var el=$(this);
                el.toggleClass('form_checkOn');
                if(el.hasClass('form_checkOn')){
                    $('.car_menu').find('.form_check').addClass('form_checkOn').attr('checked',true);
                }else{
                    $('.car_menu').find('.form_check').removeClass('form_checkOn').attr('checked',false);
                }
                changetotal();
            });

            /*选中一条*/
            $('.car_menu').on('click','.car_menu_list .car_menu_list_info .form_check',function(){
                var _el=$(this);
                _el.toggleClass('form_checkOn');
                if(_el.hasClass('form_checkOn')){
                    _el.removeClass("form_checkOn").attr('checked',true);
                }else{
                    _el.addClass("form_checkOn").attr('checked',false);
                }
                changetotal();
            });
        }
        var referer;
        //手机端浏览器点击返回按钮，跳转到个人中心
        $(function () {
            referer="<%=request.getHeader("Referer")%>";
            //pushHistory();
            window.addEventListener("popstate", function (e) {
                //window.location.href = '/sjsc/jsp/component/portal/JSP/personalcenter/list.jsp';//跳转到个人中心
                window.location.href=referer;
            }, false);

            function pushHistory() {
                var state = {
                    title: "title",
                    //url: "${baseURL}/jsp/component/portal/JSP/personalcenter/order/order_list.jsp?orderStatus=${param.orderStatus}"
                    url:referer,
                };
                window.history.pushState(state, "title", "${baseURL}/jsp/component/portal/JSP/personalcenter/order/order_list.jsp?orderStatus=${param.orderStatus}");
            }
        });
    }

</script>

</body>
</html>
