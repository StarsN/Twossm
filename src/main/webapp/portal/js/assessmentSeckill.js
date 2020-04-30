var token = '';
var page = 0;
var size = 10;
var discountActivityMoney = -1;
var stockNum = $('#stock').text();
$(function () {
    //使用EL表达式传入参数
    goods.detail.init({goodsId: mcode});
    var tab1LoadEnd = false;
    var opt = 0;
    /*商品详情、评价切换*/
    $('#changeProduct').on('click', 'li', function () {
        var _el = $(this);
        var curIndex = 0;
        var mK_item = $('.mK_item');
        curIndex = $('#changeProduct li').index(this);
        _el.addClass('active').siblings().removeClass('active');
        mK_item.siblings().eq(curIndex).show().siblings().hide();
    });

    //获取token
    $.ajax({
        url: '/sjsc/assessment/assessmentAction!getToken.action',
        data: {"merchandiseCode": mcode},
        type: 'post',
        dataType: 'json',
        success: function (result) {
            if (result.code == '0') {
                token = result.data.token;
            }
        },
        error: function (result) {
            console.log('系统异常');
        }
    });

    //统计pv uv
    $.ajax({
        url: '/sjsc/tongji/tongjiAction!savePv.action',
        data: {"merchandiseCode": mcode},
        type: 'post',
        dataType: 'json',
        success: function (result) {
            console.log(result.code);
        },
        error: function (result) {
            console.log('系统异常');
        }
    });
    $('.ico_min').on('click', function () {
        var buyNum = $('#buyNum').val();
        var stock = $('.stock').first().text();
        if (buyNum > 0) {
            $('#buyNum').val(--buyNum);
            $('.stock').text(++stock);
        }
    });

    $('.ico_add').on('click', function () {
        var buyNum = $('#buyNum').val();
        var stock = $('.stock').first().text();
        if (stock > 0) {
            $('#buyNum').val(++buyNum);
            $('.stock').text(--stock);
        }
    });
    $('#buyNum').on('input', function () {
        var buyNum = $('#buyNum').val();
        $('.stock').text(stockNum - buyNum);
    })
    page++;
    searchAssesmsent(1, page, null, size);
    initScroll();
    getCartNum();
    // initTotal();
    ebLogin();//和包登录相关
});
function initOverpublicNotice(domain) {
    $.ajax({
        url: '/sjsc/weiPage/weiPageAction!gainPublicNotice.action',
        data: {from: 'merchandise'},
        type: 'post',
        dataType: 'json',
        success: function (data) {
            if (data.code == "0") {
                if (data.data.isToShow == '1') {
                    var pageId = data.data.pageId;
                    var index = data.data.index;
                    var iframe = '<iframe id="iframe_over" src="/portal/static/' + domain + '/' + pageId + '.html?iframeId=iframe_over" width="100%"></iframe>'
                    if (index == '0') $('#publicNotice_top').html(iframe);
                    else $('#publicNotice_bottom').html(iframe);
                }

            }
            //隐藏多余的客服和分销，@choy，2019-11-5 19:32:52
            $("iframe").contents().find(".kefu").hide();
            $("iframe").contents().find(".vBuyer").hide();
        }
    });
}
function gainMerchandiseAssessment() {
    if (opt == 1) {
        // 解锁
        opt = 2;
        dropload.unlock();
        dropload.noData(false);
        //page = 0;
        //$('#userAssessment').html('');
        dropload.resetload();
    }
    if (opt == 3) {
        page = 1;
        searchAssesmsent(1, page, null, size);
    }
}

function initScroll() {
    // 页数
    // 每页展示10个
    dropload = $('#mK_item').dropload({
        scrollArea: window,
        domUp: {
            domClass: 'dropload-up',
            domRefresh: '<div class="dropload-refresh">↓下拉刷新...</div>',
            domUpdate: '<div class="dropload-update">↑释放刷新...</div>',
            domLoad: '<div class="dropload-load"><span class="loading"></span>正在刷新...</div>'
        },
        domDown: {
            domClass: 'dropload-down',
            domRefresh: '<div class="dropload-refresh">↑上拉加载更多</div>',
            domLoad: '<div class="dropload-load"><span class="loading"></span>加载中...</div>',
            domNoData: '<div class="noOrder">没有更多评价了</div>'
        },
        //下拉刷新
        loadUpFn: function (me) {
            page = 1;
            me.resetload();
            searchAssesmsent(1, page, me, size);
        },
        //上拉加载更多
        loadDownFn: function (me) {
            page++;
            searchAssesmsent(2, page, me, size)
        }
    })
}

function searchAssesmsent(type, page, me, size) {
    $.ajax({
        url: '/sjsc/assessment/assessmentAction!ajaxSearchAssesmsentByMerCode.action',
        dataType: 'json',
        type: 'post',
        data: {
            "merchandiseCode": mcode,
            "page": page,
            "size": size
        },
        success: function (result) {
            if (result.code == "0") {
                //赋值
                var assessmentList = result.data.assessmentList;
                if (1 == type) {
                    $('#userAssessment').html('');
                }
                if (assessmentList && assessmentList.length > 0) {
                    for (var i = 0; i < assessmentList.length; i++) {
                        var starNum = assessmentList[i].assessmentTrade;
                        var star = '';
                        var html = '';
                        var comment = '';
                        if (starNum == '1') {
                            star +=
                                '<span class="i-star i-starOn"></span>' +
                                '<span class="i-star"></span>' +
                                '<span class="i-star"></span>' +
                                '<span class="i-star"></span>' +
                                '<span class="i-star"></span>';
                            comment = '<div style="float:left;font-size:0.20rem;color:grey;margin-left:0.3rem;">非常差</div>';
                        } else if (starNum == '2') {
                            star +=
                                '<span class="i-star i-starOn"></span>' +
                                '<span class="i-star i-starOn"></span>' +
                                '<span class="i-star"></span>' +
                                '<span class="i-star"></span>' +
                                '<span class="i-star"></span>';
                            comment = '<div style="float:left;font-size:0.20rem;color:grey;margin-left:0.5rem;">差</div>';
                        } else if (starNum == '3') {
                            star +=
                                '<span class="i-star i-starOn"></span>' +
                                '<span class="i-star i-starOn"></span>' +
                                '<span class="i-star i-starOn"></span>' +
                                '<span class="i-star"></span>' +
                                '<span class="i-star"></span>';
                            comment = '<div style="float:left;font-size:0.20rem;color:grey;margin-left:0.4rem;">一般</div>';
                        } else if (starNum == '4') {
                            star +=
                                '<span class="i-star i-starOn"></span>' +
                                '<span class="i-star i-starOn"></span>' +
                                '<span class="i-star i-starOn"></span>' +
                                '<span class="i-star i-starOn"></span>' +
                                '<span class="i-star"></span>';
                            comment = '<div style="float:left;font-size:0.20rem;color:grey;margin-left:0.5rem;">好</div>';
                        } else {
                            star +=
                                '<span class="i-star i-starOn"></span>' +
                                '<span class="i-star i-starOn"></span>' +
                                '<span class="i-star i-starOn"></span>' +
                                '<span class="i-star i-starOn"></span>' +
                                '<span class="i-star i-starOn"></span>';
                            comment = '<div style="float:left;font-size:0.20rem;color:grey;margin-left:0.3rem;">非常好</div>';
                        }
                        html +=
                            '<li>' +
                            '<div class="dsBox">' +
                            '<div class="dstarTitle">' +
                            '<div class="fl g_star">' +
                            star +
                            '</div>' +
                            '<div class="fr duserShow">' +
                            '用户<span class="duserTel">' + assessmentList[i].phoneNumber + '</span>' +
                            '</div>' +
                            '</div>' +
                            '<p class="d-disturbs">' + assessmentList[i].merchandiseAssessment + '</p>' +
                            '<h3 class="d-timer">' + assessmentList[i].submitTime + '</h3>' +
                            '</div>' +
                            '</li>';
                        $('#userAssessment').append(html);
                    }
                    //$('.Userdiscuss').show();
                } else {
                    if (me && me != null) {
                        // 锁定
                        me.lock();
                        // 无数据
                        me.noData();
                        // 数据加载完
                    } else {
                        $('.dropload-down').remove();
                        $('#mK_item').append('<div class="dropload-down"><div class="dropload-refresh">暂无评价~</div></div>');
                        opt = 3;
                        return;
                    }
                }
            } else {
                layer.msg(result.desc);
            }
            // 为了测试，延迟1秒加载
            //setTimeout(function(){
            // 每次数据插入，必须重置
            if (me && me != null) {
                if (1 == type) {
                    // 锁定
                    me.unlock();
                    // 无数据
                    me.noData(false);
                }
                me.resetload();
            } else {
                $('.dropload-down').remove();
                initScroll();
                opt = 1;
            }
        },
        error: function (resutl) {
            if (me && me != null) {
                me.resetload();
            }
            layer.msg("网络异常，请稍后再试!");
        }
    })
}


//单点登录
function ebLogin() {
    var mmToken = getQueryString("mmToken");
    var mmSourId = getQueryString("mmSourId");
    var net_token = getQueryString("net_token");
    var sourceid = getQueryString("sourceid");
    var channel = getQueryString("channel");
    if (net_token != null && sourceid != null) {
        $.ajax({
            type: "post",
            url: "/sjsc/wechat/ebOnlinePayAction!mmLogin.action",
            data: {"mmToken": net_token, "mmSourId": sourceid, "channel": channel},
            dataType: "json",
            success: function (result) {
                if (result.code == "0") {
                    console.log("广东移动登录成功");
                } else {
                    layer.msg('广东移动登录异常' + result.desc, {icon: 5, time: 3000});
                }
            },
            error: function (result) {
                layer.msg('广东移动登录通讯异常，稍后请重新登录', {icon: 5, time: 3000});
            }
        });
    }
    else if (mmToken != null && mmSourId != null) {
        $.ajax({
            type: "post",
            url: "/sjsc/wechat/ebOnlinePayAction!mmLogin.action",
            data: {"mmToken": mmToken, "mmSourId": mmSourId, "channel": "MM"},
            dataType: "json",
            success: function (result) {
                if (result.code == "0") {
                    console.log("MM登录成功");
                } else {
                    layer.msg('MM登录异常' + result.desc, {icon: 5, time: 3000});
                }
            },
            error: function (result) {
                layer.msg('MM登录通讯异常，稍后请重新登录', {icon: 5, time: 3000});
            }
        });
    }
}


//查找购物车中商品的数量
function getCartNum() {
    $.ajax({
        url: '/sjsc/cart/cartAction!getCartNum.action',
        dataType: 'json',
        type: 'post',
        success: function (result) {
            if (result.code == "0") {
                $("#cart_num").text(result.data.cartNum);
            } else if (result.code == "1") {
                $("#cart_num").text("0");
            } else {
                layer.msg("提示", result.desc);
            }
        },
        error: function (result) {
            layer.msg("提示", "查找购物车商品数量异常");
        }
    })
}

function allocateArray() {
    $(".rdioas").each(function (i, e) {
        if ($(this).attr('checked') == 'checked') {
            attrIdArray.push($(this).val());
        }
    });
}

function subtract() {
    var num = parseInt($("#buyNum").val());
    if (num <= 1) {
        return;
    }
    $("#buyNum").val(num - 1);
    //$("#stock").text(parseInt($("#stock").text())+1);
}

function add() {
    var num = parseInt($("#buyNum").val());
    var stock = parseInt($(".stock").first().text());
    //if(stock <= 0){
    if (stock <= num) {
        layer.tips('库存不足', '#buyNum', {
            tips: [1, '#3595CC'],
            time: 3000
        });
        return;
    }
    $("#buyNum").val(num + 1);
    //$("#stock").text(parseInt($("#stock").text())-1);
}

//购物车、立即购买进行拼接
function setSku(attrId, merchandiseCode) {
    var cart = "";
    $.ajax({
        type: "get",
        async: false,
        url: "/sjsc/store/storePublishAction!paddingSkuInfo.action",
        data: {'attrId': attrId.join(), 'merchandiseCode': merchandiseCode},
        dataType: "jsonp",
        jsonp: "callback",//传递给请求处理程序或页面的，用以获得jsonp回调函数名的参数名(一般默认为:callback)
        success: function (json) {
            $(".p_money").html("");
            $(".stock").html("");
            $(".menu_btm").html("");
            if (!json) {
                layer.msg('暂时没有此规格库存，请选择其他', {icon: 5, time: 2500});
                return false;
            }
            $(".p_money").text("￥"+json.price);
            if (json.stock == "0" || json.stock == 0) {
                $("#buyNum").val("0");
                $(".stock").text("0");
            } else {
                $("#buyNum").val("1");
                $(".stock").text(parseInt(json.stock + ""));
            }
            $(".syPduct").show();
            if (presale == 1) {
                $(".fixed_bottom").remove();
            } else {
                if (json.status != 1) {
                    $('.fixed_bottom').html('<a href="javascript:;" class="buyedOn" style="background: #b3b3b3;">已下架</a>');
                } else {
                    $('.fixed_bottom').html('<a href="javascript:purchase(\'' + json.stockId + '\');" class="buyedOn" >立即购买</a>');
                }
            }
        },
        error: function () {
            layer.msg('通讯异常，请稍后再试', {icon: 5, time: 2500});
            return false;
        }
    });
}

function purchase(stockId) {
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
    var token = $.cookie('token');
    // console.log("/sjsc/orderManage/orderManageAction!purchase2SubmitSeckill.action?stockId=" + stockId + "&buyNum=" + buyNum + "&token=" + token);
    window.location.href = "/sjsc/orderManage/orderManageAction!purchase2SubmitSeckill.action?stockId=" + stockId + "&buyNum=" + buyNum + "&token=" + token;
}

//店铺名称点击跳转至首页
$('#merchant_name').on('click', function () {
    window.location.href = document.location.protocol + "//" + document.domain;
});
/*收缩*/
$('.set_title').on('click', function () {
    var _el = $(this);
    _el.find('.icoCtol').toggleClass('icoCtolOn')
    _el.parent().find('.mobile_set_info').toggle();
});

/*选项单选*/
$('.p_item').on('click', 'li', function () {
    var _el = $(this);
    _el.addClass('active').find('.rdioas').attr('checked', true).parent().siblings().removeClass('active').find('.rdioas').attr('checked', false);
    attrIdArray.length = 0;
    allocateArray();
    setSku(attrIdArray, mcode);
});

function initTotal() {
    var attrIdArray = new Array();
    $('.rdioas').each(function () {
        if ($(this).attr('checked') == 'checked') {
            var $this = $(this);
            attrIdArray.push($this.val());
        }
    })
    console.log("属性数量：" + $('.p_item').length + ",属性选中数量：" + attrIdArray.length);
    //获取规格属性后，判断是否包含合约机情况
    if ($.inArray($("#contractAttrId").val(), attrIdArray) != -1) {
        //包含
        //显示选择合约
        $('.hy_item').show();
        //屏蔽租机按钮
        // $('#rentM').hide();
        //隐藏购物车
        $('.d_join_buy').addClass('.color_green');
        //购买数量变为1
        if ($("#buyNum").val() != 0) {
            $("#buyNum").val(1);
        }
        //设置buy_type=1
        $("input[name=buy_type]").val("1");
    } else {
        $('.hy_item').hide();
        //显示购物车
        $('.color_green').show();
        //显示租机按钮
        $('#rentM').show();
        //重置合约选择
        $("input[name=buy_type]").val("0");
        $(".hy_item_rg>span").html("请选择合约");
        $("#contractId").val('');

        //判断是鉴权优惠
        if (discountActivityMoney != -1) {
            //隐藏购物车
            $('.color_green').removeClass('color_green');
            //购买数量变为1
            if ($("#buyNum").val() != 0) {
                $("#buyNum").val(1);
            }
        }
    }
    if ($('.p_item').length == attrIdArray.length) {
        setSku(attrIdArray, mcode);
    }
}

var startTime;
var endTime;
var md5 = mcode;
var timerFlag;
var goods = {
    //封装秒杀相关ajax的url
    URL: {
        now: function () {//统一系统应用时间，避免秒杀开始时间不一致
            return '/sjsc/seckill/seckillAction!ajaxNow.action';
        },
        execution: function () {//执行秒杀，是否成功生成token
            return '/sjsc/seckill/seckillAction!miaoSha.action';
        },
        queryResult: function () { //查询秒杀结果
            return '/sjsc/seckill/seckillAction!queryResult.action';
        },
        validateLogin: function () { //是否登录
            return '/sjsc/seckill/seckillAction!validateLogin.action';
        }
    },

    //轮训查询秒杀结果
    queryResult: function (md5, goodsId, node) {
        $.ajax({
            type: "post",
            url: goods.URL.queryResult(),
            dataType: "json", // 返回数据类型json
            data: {
                mobile: $.cookie('killPhone'),
                goodsName: md5
            },
            success: function (data) {
                if (data.code == "0") {
                    //停止查询定时任务
                    window.clearInterval(timerFlag);
                    // 下单token存起来，用于下单 前端 有效时间5分钟， 后台校验有效时间5分钟
                    var expiresDate = new Date();
                    expiresDate.setTime(expiresDate.getTime() + (5 * 60 * 1000));
                    $.cookie('token', data.data.data, {expires: expiresDate});
                    // node.hide();
                    // $(".menu_btmBox").show();
                    initTotal();
                    layer.msg("有效下单时间5分钟，请立即下单并付款", {icon: 6, time: 1500});
                } else if (data.code == "1") {
//					layer.msg("活动火爆进行中，请耐心等待···", {icon: 5,time: 2500});
                    layer.msg("你来晚了，商品已被抢完~", {icon: 5, time: 2500});
                } else {
                    layer.msg(data.desc, {icon: 5, time: 2500});
                }
            },
            error: function (e) {
                layer.msg("通讯异常，请稍后再试。");
            }
        });
    },

    //详情页秒杀逻辑
    detail: {
        //详情页初始化
        init: function (params) {
            //手机验证和登录,计时交互
            //在cookie中查找手机号
            var killPhone = $.cookie('killPhone');
            //验证手机号
            if (!killPhone) {
                $.ajax({
                    url: goods.URL.validateLogin(),
                    dataType: 'json',
                    type: 'post',
                    async: false,//同步
                    success: function (result) {
                        if (result.code == "0") {
                            $.cookie('killPhone', result.data.data);
                        } else if (result.code == "1") {
                            window.location.href = "/sjsc/jsp/component/portal/JSP/login/login.jsp?isBack=ajaxBack";
                        }
                    },
                    error: function (result) {
                        layer.msg("通讯异常，请稍后再试。");
                    }
                })
            }

            //已经登录
            //计时交互
            var goodsId = params['goodsId'];
            $.ajax({
                type: "post",
                url: goods.URL.now(),
                dataType: "json", // 返回数据类型json
                data: {
                    goodsId: goodsId
                },
                success: function (data) {
                    if (data.code == "0") {
                        var nowTime = data.data.data['nowTime'];
                        startTime = data.data.data['startTime'];
                        endTime = data.data.data['endTime'];
                        goods.countDown(goodsId, nowTime, startTime, endTime);
                    } else {
                        layer.msg("初始化活动时间异常");
                    }
                },
                error: function () {
                    layer.msg("通讯异常，请稍后再试。");
                }
            });
        }
    },

    handlergoods: function (goodsId, node, nowTime, startTime, endTime) {
        //获取秒杀地址,控制显示器,执行秒杀
        node.html('<a href="javascript:;" class="buyedOn" id="killBtn">马上抢购</a>');
        node.show();
        //绑定一次点击事件
        $('#killBtn').on('click', function () {
            //执行秒杀请求
            //1.先禁用按钮
            $(this).attr('disabled', 'disabled');
            //2.发送秒杀请求执行秒杀
            $.ajax({
                type: "post",
                url: goods.URL.execution(),
                dataType: "json", // 返回数据类型json
                data: {
                    mobile: $.cookie('killPhone'),
                    goodsId: goodsId,
                    //商品编号
                    goodsName: md5
                },
                success: function (data) {
                    if (data.code == "0") {
                        timerFlag = window.setInterval(goods.queryResult(md5, goodsId, node), 2000);
                    } else {
                        layer.msg(data.desc, {icon: 5, time: 2500});
                        $(this).removeAttr('disabled');
                    }
                },
                error: function () {
                    $(this).removeAttr('disabled');
                    layer.msg("通讯异常，请稍后再试。", {icon: 5, time: 2500});
                }
            });
        });
    },

    countDown: function (goodsId, nowTime, startTime, endTime) {
        var goodsBox = $('.goods-box');
        var timeText = $(".time_text");
        var syTime = $(".syTimer");
        var oldPriceBuyHtml = "";
        if (goodsBox.html()) {
            oldPriceBuyHtml = goodsBox.html();
        }
        if (nowTime > endTime) {
            //秒杀结束
            timeText.text("活动已结束");
            syTime.html("敬请期待下次");
        } else if (nowTime < startTime) {
            //秒杀未开始,计时事件绑定
            var killTime = new Date(startTime);//todo 防止时间偏移
            timeText.countdown(killTime, function (event) {
                //时间格式
                var format = event.strftime('<b>距离结束还剩：</b><span>%D</span>天<span>%H</span>时<span>时</span>分<span>%S</span>秒');
                syTime.html(format);
            }).on('finish.countdown', function () {
                //时间完成后回调事件
                //获取秒杀地址,控制现实逻辑,执行秒杀
                goods.handlergoods(goodsId, goodsBox, nowTime, startTime, endTime);
                var killOverTime = new Date(endTime);//todo 防止时间偏移
                timeText.countdown(killOverTime, function (event2) {
                    //时间格式
                    var format2 = event2.strftime('<b>距离结束还剩：</b><span>%D</span>天<span>%H</span>时<span>时</span>分<span>%S</span>秒');
                    syTime.html(format2);
                }).on('finish.countdown', function () {
                    //时间完成后回调事件
                    timeText.text("活动已结束");
                    syTime.html("敬请期待下次");
                    goodsBox.html(oldPriceBuyHtml);
                });
            });
        } else {
            //秒杀开始
            goods.handlergoods(goodsId, goodsBox, nowTime, startTime, endTime);
            var killOverTime = new Date(endTime);//todo 防止时间偏移
            timeText.countdown(killOverTime, function (event) {
                //时间格式
                var format = event.strftime('<b>距离结束还剩：</b><span>%D</span>天<span>%H</span>时<span>时</span>分<span>%S</span>秒');
                syTime.html(format);
            }).on('finish.countdown', function () {
                //时间完成后回调事件
                timeText.text("活动已结束");
                syTime.html("敬请期待下次");
                goodsBox.html(oldPriceBuyHtml);
            });
        }
    }
}

//调用轮播图，一张图片时，禁止轮播
if ($(".swiper-slide").length > 1) {
    var swiper = new Swiper('.swiper-container', {
        pagination: '.swiper-pagination',
        autoplay: false,
        loop: true,
        paginationClickable: true
    });
}

//单点登录
function ebLogin() {
    var mmToken = getQueryString("mmToken");
    var mmSourId = getQueryString("mmSourId");
    var net_token = getQueryString("net_token");
    var sourceid = getQueryString("sourceid");
    var channel = getQueryString("channel");
    if (net_token != null && sourceid != null) {
        $.ajax({
            type: "post",
            url: "/sjsc/wechat/ebOnlinePayAction!mmLogin.action",
            data: {"mmToken": net_token, "mmSourId": sourceid, "channel": channel},
            dataType: "json",
            success: function (result) {
                if (result.code == "0") {
                    console.log("广东移动登录成功");
                } else {
                    layer.msg('广东移动登录异常' + result.desc, {icon: 5, time: 3000});
                }
            },
            error: function (result) {
                layer.msg('广东移动登录通讯异常，稍后请重新登录', {icon: 5, time: 3000});
            }
        });
    }
    else if (mmToken != null && mmSourId != null) {
        $.ajax({
            type: "post",
            url: "/sjsc/wechat/ebOnlinePayAction!mmLogin.action",
            data: {"mmToken": mmToken, "mmSourId": mmSourId, "channel": "MM"},
            dataType: "json",
            success: function (result) {
                if (result.code == "0") {
                    console.log("MM登录成功");
                } else {
                    layer.msg('MM登录异常' + result.desc, {icon: 5, time: 3000});
                }
            },
            error: function (result) {
                layer.msg('MM登录通讯异常，稍后请重新登录', {icon: 5, time: 3000});
            }
        });
    }
}
