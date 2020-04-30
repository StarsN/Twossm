var dropload;
var page = 0;
var size = 10;
var token = '';
var discountActivityMoney = -1;
var _hmt = _hmt || [];
var stockNum=$('#stock').text();
$(function () {
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
    //店铺名称点击跳转至首页
    $('#merchant_name').on('click',function(){
        window.location.href=document.location.protocol+"//"+document.domain;
    });
    page++;
    searchAssesmsent(1, page, null, size);
    initScroll();
    getCouponList();
    ebLogin();//和包登录相关
    getCartNum();
    initTotal();
    huabeiActivity(mcode);
    discountActivity(mcode);
})

function discountActivity(merchandiseCode) {
    $.ajax({
        type: "post",
        url: "/sjsc/discountActivity/DiscountActivityAction!isMerchandiseHasDiscount.action",
        data: {"merchandiseId": merchandiseCode},
        dataType: "json",
        success: function (result) {
            console.log(result);
            if (result.code == 0) {
                discountActivityMoney = result.data.TbDiscountActivity.discountedAmount;
                //已开启优惠活动
                /*
                                $(".mobile_set").eq(0).after("<div class='mt18 huabeiActivity tip' style='background-color:white;display:display'><h3 class='set_title_huabei' style='padding: 0 0.2rem;font-size: 0.24rem;color: #666;position: relative;height: 0.6rem;line-height: 0.60rem;'><i class='icoHuabei' style='background: rgba(0, 0, 0, 0) url(/sjsc/jsp/component/portal/images/hb.jpg) no-repeat scroll 0 0 / 100% 100%;display: inline-block;height: 0.22rem;margin-right: 0.15rem;vertical-align: middle;width: 0.24rem;'></i>支持优惠活动</h3>");
                */
                if (isWeixin()) {
                    $(".tip h3").append("（非微信环境）")
                }
            } else if (result.code == 1001) {

            }
        },
        error: function (result) {
            layer.msg('通讯异常', {icon: 5, time: 3000});
        }
    });
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
//选择合约
//增加合约渠道参数
function chooseContract(contractId, contractName, contractChannel) {
    $(".hy_item_rg>span").html(contractName);
    $("#contractId").val(contractId);
    $("#contractChannel").val(contractChannel);
    Hidewlay_pop();
}

/*隐藏合约弹窗*/
function Hidewlay_pop() {
    $('.pop-mask').hide();
    $('.pop-box').removeClass('opens');
}
/**
 *查询花呗信息
 * @param merchandiseCode
 */
function huabeiActivity(merchandiseCode) {
    $.ajax({
        type: "post",
        url: "/sjsc/huabeiActivityMgr/huabeiActivityMgrAction!getEffectiveActivityByMerchandiseId.action",
        data: {"merchandiseId": merchandiseCode},
        dataType: "json",
        success: function (result) {
            console.log(result);
            if (result.code == 1001) {
                //已开启花呗，但没有免息活动
                $('.hbTitle').show();
            }
            else if (result.code == 1002) {
                //有花呗免息活动
                //$(".huabeiActivity").show();
                var msg = "限时" + result.data.huabeiActivityPO.activityType + "期免息";
                $('.hbTitle').show();
                $(".hbTitle h3").append("<span style='font-size: 0.25rem;color: #FF7F00;margin-left:0.2rem'>" + msg + "</span>");
            } else if (result.code == 1003) {
                //未开启花呗，不做处理
            }
        },
        error: function (result) {
            layer.msg('通讯异常', {icon: 5, time: 3000});
        }
    });
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
                    $('.Userdiscuss ul').html('');
                }
                if (assessmentList && assessmentList.length > 0) {
                    for (var i = 0; i < assessmentList.length; i++) {
                        var starNum = assessmentList[i].assessmentTrade;
                        var star = '';
                        var html = '';
                        if (starNum == '1') {
                            star +=
                                '<span class="i-star i-starOn"></span>' +
                                '<span class="i-star"></span>' +
                                '<span class="i-star"></span>' +
                                '<span class="i-star"></span>' +
                                '<span class="i-star"></span>';
                        } else if (starNum == '2') {
                            star +=
                                '<span class="i-star i-starOn"></span>' +
                                '<span class="i-star i-starOn"></span>' +
                                '<span class="i-star"></span>' +
                                '<span class="i-star"></span>' +
                                '<span class="i-star"></span>';
                        } else if (starNum == '3') {
                            star +=
                                '<span class="i-star i-starOn"></span>' +
                                '<span class="i-star i-starOn"></span>' +
                                '<span class="i-star i-starOn"></span>' +
                                '<span class="i-star"></span>' +
                                '<span class="i-star"></span>';
                        } else if (starNum == '4') {
                            star +=
                                '<span class="i-star i-starOn"></span>' +
                                '<span class="i-star i-starOn"></span>' +
                                '<span class="i-star i-starOn"></span>' +
                                '<span class="i-star i-starOn"></span>' +
                                '<span class="i-star"></span>';
                        } else {
                            star +=
                                '<span class="i-star i-starOn"></span>' +
                                '<span class="i-star i-starOn"></span>' +
                                '<span class="i-star i-starOn"></span>' +
                                '<span class="i-star i-starOn"></span>' +
                                '<span class="i-star i-starOn"></span>';
                        }
                        var appendhtml = '';
                        if (assessmentList[i].reContent != '') {
                            appendhtml = '<h4 style="font-size: 0.2rem;font-weight: normal;margin-top: 0.1rem;">客服回复(' + assessmentList[i].reSubmitTime + '):' + assessmentList[i].reContent + '</h4>';
                        }
                        html += '<li>\n' +
                            '                                        <div class="dsBox">\n' +
                            '                                            <div class="dstarTitle">\n' +
                            '                                                <div class="fl g_star">\n' +
                            star +
                            '                                                </div>\n' +
                            '                                                <div class="fr duserShow">\n' +
                            '                                                    用户<span class="duserTel">' + assessmentList[i].phoneNumber + '</span>\n' +
                            '                                                </div>\n' +
                            '                                            </div>\n' +
                            '                                            <p class="d-disturbs">' + assessmentList[i].merchandiseAssessment + '</p>\n' +
                            '                                            <h3 class="d-timer">' + assessmentList[i].submitTime + '</h3>\n' +
                            appendhtml +
                            '                                        </div>\n' +
                            '                                    </li>'
                        $('.Userdiscuss ul').append(html);
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

//查找购物车中商品的数量
function getCartNum() {
    $.ajax({
        url: '/sjsc/cart/cartAction!getCartNum.action',
        dataType: 'json',
        type: 'post',
        success: function (result) {
            if (result.code == "0") {
                $(".t_car b").text(result.data.cartNum);
            } else if (result.code == "1") {
                $(".t_car b").text("0");
            } else {
                layer.msg("提示", result.desc);
            }
        },
        error: function (result) {
            layer.msg("提示", "查找购物车商品数量异常~~");
        }
    })
}


/*获取店铺的优惠券 lzm */
function getCouponList() {
    $.ajax({
        url: '/sjsc/coupon/couponAction!getCouponVOListByMerchant2.action',
        dataType: 'json',
        data: {"merchandiseCode": mcode},
        type: 'post',
        success: function (result) {
            if (result.code == "0") {
                var list = result.data.couponVOList;
                var availability = "";
                for (var i = 0; i < list.length; i++) {
                    var font = '';
                    if (list[i].couponStatus == "0") {
                        //可用---------------------
                        var value = '';
                        var fontSize = '';
                        if (list[i].discountType == "2") {
                            font = list[i].discount;
                            //折扣
                            if (list[i].isUseLimit == "1") {
                                value = '<h3>¥' + list[i].discount + '</h3>\n' +
                                    '<p>满' + list[i].limitAmount + '可用</p>';
                            } else {
                                value = '<h3 style="margin-top:20px;">¥' + list[i].discount + '</h3>\n';
                            }
                        } else if (list[i].discountType == "1") {
                            //随机金额
                            fontSize = getFontSize(list[i].randomValue);
                            font = list[i].randomValue;
                            //折扣
                            if (list[i].isUseLimit == "1") {
                                value = '<h3>¥' + list[i].randomValue + '</h3>\n' +
                                    '<p>满' + list[i].limitAmount + '可用</p>';
                            } else {
                                value = '<h3 style="margin-top:20px;">¥' + list[i].randomValue + '</h3>\n';
                            }
                        } else {
                            //固定金额
                            fontSize = getFontSize(list[i].discountAmount);
                            font = list[i].discountAmount;
                            //折扣
                            if (list[i].isUseLimit == "1") {
                                value = '<h3>¥' + list[i].discountAmount + '</h3>\n' +
                                    '<p>满' + list[i].limitAmount + '可用</p>';
                            } else {
                                value = '<h3 style="margin-top:20px;">¥' + list[i].discountAmount + '</h3>\n';
                            }
                        }

                        //0-指定商品可用，1-全部商品可用
                        var isAllItemAvailable = '';
                        if (list[i].isAllItemAvailable == "0") {
                            isAllItemAvailable = '<p class="use_des_bottom" style="margin-top:0.1rem">指定商品可用</p>';
                        }

                        // var coupon = '<div class="coupons_item mb20"  style="height: auto;padding-bottom: 0.15rem;">'
                        //     + '		<div class="cou_item_l fl" style="height: 1.8rem;padding-top: 0.3rem;">'
                        //     /* +'		<i class="states_tips">未使用</i>' */
                        //     + '		<div class="use_des">'
                        //     + '			<p class="use_des_top">'
                        //     + value
                        //     + '			</p>'
                        //     + '			<p class="use_des_bottom">' + useLimit + '</p>'
                        //     + isAllItemAvailable
                        //     + '		</div>'
                        //     + '	</div>'
                        //     + '	<div class="cou_item_r fl">'
                        //     + '		<p class="bianhao">' + list[i].couponName + '</p>'
                        //     + '		<p class="user_merchant" style="height: 0.4rem;">'
                        //     /* +'			<span class="merchant_text">使用商家：</span>'
                        //    +'			<span class="merchant_name">'+list[i].merchantName+'</span>'*/
                        //     + '		</p>'
                        //     + '		<p class="valid_time">' + (list[i].effectiveTime).substring(0, 10) + ' 至 ' + (list[i].expirationTime).substring(0, 10) + '</p>'
                        //     + '	</div>'
                        //     + '<ul class="fp_type" style="padding: 0;width: 1rem;margin-top: 1.05rem;">'
                        //     + '<li class="active" style="margin-right: 0;"><a id="getCoupon" href="javascript:getCoupon(\'' + list[i].couponId + '\');">领取</a></li> '
                        //     + '</ul> '
                        //     + '</div>';

                        var coupon = '<div class="coupons_item">\n' +
                            '                <div class="fl coupons_left">\n' +
                            value +
                            '                </div>\n' +
                            '                <div class="coupons_right">\n' +
                            '                    <h3>' + font + '元代金券</h3>\n' +
                            '                    <a href="javascript:getCoupon(\''+list[i].couponId+'\');" class="btnBuyed">领取</a>\n' +
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
                layer.msg("查询异常!");
            }
        }
        ,
        error: function (result) {
            layer.msg("查询异常!");
        }
    })
}
/* 根据金额长度，控制字体大小 */
function getFontSize(value){
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

/*领取优惠券  */
function getCoupon(couponId){
    $.ajax({
        url:'/sjsc/coupon/couponAction!getcoupon.action?loginCheck=true',
        dataType:'json',
        type:'post',
        data:{
            "couponId":couponId
        },
        success:function(result){
            console.log(result.data)
            if(result.code=="0"){
                console.log("code=0")
                //判断领取权限
                if(result.data.map.code=="1002" || result.data.map.code=="1006"|| result.data.map.code=="1003"){
                    //没有领取权限
                    layer.msg(result.data.map.msg);
                }else if(result.data.map.code=="1001"){
                    layer.msg("领取成功");
                    //领取成功统计领券数
                    _hmt.push(['_trackEvent', 'coupon', 'click', 'getCoupon']);
                }else if(result.data.map.code=="1012"){
                    //白名单限制不能下单
                    layer.msg(result.data.map.msg);
                }
            }else if(result.code=="007"){
                layer.msg("用户未登录，请先登录");
            }else{
                layer.msg("领取异常，请稍后再试!");
            }
        },
        error:function(resutl	){
            layer.msg("领取异常，请稍后再试!");
        }
    })
}

var currentStockId;
//购物车、立即购买进行	拼接
function setSku(attrId,merchandiseCode){
    console.log("进入属性选中");
    var cart = "";
    $.ajax({
        type: "get",
        async: false,
        url: "/sjsc/store/storePublishAction!paddingSkuInfo.action",
        data: {'attrId':attrId.join(),'merchandiseCode':merchandiseCode},
        dataType: "jsonp",
        jsonp: "callback",//传递给请求处理程序或页面的，用以获得jsonp回调函数名的参数名(一般默认为:callback)
        success: function(json){
            $("#stock").html("");
            $(".menu_btm").html("");
            $(".p_money").text("￥ "+json.price);
            $('#rentM').removeAttr("class");
            if(json.stock == "0"||json.stock==0){
                $("#buyNum").val("0");
                $("#stock").text("0");
            }else{
                $("#buyNum").val("1");
                stockNum=parseInt(json.stock);
                $("#stock").text(parseInt(json.stock));
            }
            if(discountActivityMoney != -1) {
                var realMoney = json.price - discountActivityMoney;
                if(realMoney<0){
                    realMoney = 0;
                }
                $(".p_money").html("");
                $(".p_money").append("<span class='p_money' style='text-decoration: line-through;\n" +
                    "    color: grey;'>￥"+ json.price + "</span>" + "<span class='p_money'>￥"+ realMoney+"（鉴权优惠价）</span>");
            }
            currentStockId = json.stockId;
            if(json.status!=1){
                cart += "<a href='javascript:;' style='background: #b3b3b3;' class='d_join_buy'>加入购物车</a>";
                cart += "<a href='javascript:;' style='background: #b3b3b3;' class='d_buy'>已下架</a>";
            }else{
                if(presale==1){
                    cart += "<a href='javascript:;' style='background: #b3b3b3;' class='d_join_buy'>加入购物车</a>";
                    cart += "<a href='javascript:;' onclick=\"reserve('"+json.stockId+"')\" class='d_buy'>我要预约</a>";
                }else{
                    if( json.stock <= 0 && (isShortageShow == 1 && shortageShowType == 1) ){
                        cart += "<a href='javascript:;' onclick=\"shortageTip()\" class='d_shortage_tip'>缺货，点击提醒卖家补货</a>";
                    }else{
                        cart += "<a href='javascript:;'  onclick='addCart(\""+json.stockId+"\")' class='d_join_buy'>加入购物车</a>";
                        /*if(screen.width>mobileMaxWidth){
                        cart += "<li class='color_blue'><a href='javascript:;' onclick=\"showCode('"+json.stockId+"')\">扫码购买</a></li>";
                        }else{*/
                        //在这里判断库存是否为0
                        if( json.stock <= 0){
                            cart += "<a href='javascript:;' onclick=\"purchase('"+json.stockId+"')\" class='d_join_buy'>库存不足</a>";
                        } else {
                            cart += "<a href='javascript:;' onclick=\"purchase('"+json.stockId+"')\" class='d_buy'>立即购买</a>";
                        }
                        cart += "<a href='javascript:;' style='display:none;' onclick=\"rentMerchandise('"+json.stockId+"')\" class='d_buy'>一键租机</a>";
                        /*}*/
                    }

                }
            }
            $(".vhk").html(cart);
        }
    });
}
/*扫码购买*/
function showCode(stockId) {
    var myBackUrl = "";
    var url = "";
    var num = $("#stock").text();
    var buyNum = $("#buyNum").val();
    if (parseInt(num) < 0) {
        layer.msg('商品库存不足，请选购其他商品', {icon: 0, time: 1500});
        return;
    }
    if (buyNum <= 0) {
        layer.msg('选择的商品暂时售罄，请选购其他商品', {icon: 5, time: 1500});
        return;
    }
    var buy_type = $("input[name='buy_type']").val();
    if (buy_type == 1) {
        if ($("#contractId").val() == '') {
            confirmTreaty();
            return;
        } else {
            var goodsId = $("#contractId").val();
            //带上合约渠道
            var contractChannel = $("#contractChannel").val();
            myBackUrl = "/sjsc/groupmall/groupInterfaceAction!purchase2Check.action?stockId=" + stockId + "&buyNum=" + buyNum + "&goodsId=" + goodsId + "&contractChannel=" + contractChannel + "&token=" + token;
        }
    } else {
        myBackUrl = "/sjsc/orderManage/orderManageAction!purchase2Submit.action?stockId=" + stockId + "&buyNum=" + buyNum + "&token=" + token;
    }
    url = document.location.protocol + "//" + document.domain + "/sjsc/jsp/component/portal/wechatLogin.jsp?myBackUrl=" + encodeURIComponent(myBackUrl);
    qrcodeBuy(url);
}

function qrcodeBuy(url) {
    $("#qrcode_text").hide();
    $("#qrcode_text2").show();
    qrcode_pop();
    //生成二维码
    var qrcode = $("#make_qrcode").empty().qrcode({
        width: 260, //宽度
        height: 260, //高度
        text: url //任意url内容
    }).hide();
    var canvas = qrcode.find('canvas').get(0);
    $('#qrcode_img').attr('src', canvas.toDataURL('image/jpg'));
}

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
function reserve(stockId) {
    /* var num = $("#stock").text();
var buyNum = $("#buyNum").val();
   if(parseInt(num)<0){
       layer.msg('商品库存不足，请选购其他商品', {icon: 0,time: 1500});
       return false;
   }
   if(buyNum <=0 ){
       layer.msg('选择的商品数量必须大于1', {icon: 5,time: 1500});
       return false;
   } */
    //默认prompt
    layer.confirm('尊敬的用户，是否需要参加“0元预约”活动？', {icon: 3, title: '提示'}, function (ii) {
        layer.close(ii);
        layer.prompt({title: '尊敬的用户，请输入您的手机号码', offset: '100px'}, function (val, index) {
            var Reg = /^1[34578]\d{9}$/;//手机号码格式
            if (!Reg.test(val)) {
                layer.msg('手机号码格式不正确', {icon: 5});
                return;
            }
            var index2 = layer.load(0, {shade: [0.1, '#fff']});
            $.ajax({
                url: '/sjsc/bookManage/bookManageAction!reserve.action',
                type: 'post',
                data: {'phoneNumber': val, 'stockId': stockId},
                dataType: 'json',
                success: function (result) {
                    if (result.code == "1011") {
                        layer.close(index);
                        layer.close(index2);
                        layer.msg(result.desc, {icon: 5});
                    }
                    else if (result.code == "1") {
                        layer.close(index);
                        layer.close(index2);
                        layer.msg('预约成功', {icon: 1});
                    } else {
                        layer.close(index);
                        layer.close(index2);
                        layer.alert('预约失败！', {icon: 5});
                    }
                }, error: function (result) {
                    layer.close(index);
                    layer.close(index2);
                    layer.alert("网络异常,请稍后再试!", {icon: 5});
                }
            })
        });
    });
}
//加入购物车
function addCart(id) {
    var num = $("#stock").text();
    var buyNum = $("#buyNum").val();
    if (discountActivityMoney != -1) {
        //属于鉴权优惠商品，不能添加购物车
        layer.msg("鉴权优惠商品需直接购买，不支持放入购物车");
        return false;
    }
    if ($("input[name='buy_type']").val() == 1) {
        layer.msg("合约机需直接购买，不可放入购物车");
        return false;
    }
    if (parseInt(num) <= 0) {
        layer.msg('商品库存不足，请选购其他商品', {icon: 0, time: 1500});
        return false;
    }
    if (buyNum <= 0) {
        layer.msg('选择的商品暂时售罄，请选购其他商品', {icon: 5, time: 1500});
        return false;
    }
    $.ajax({
        type: "get",
        async: false,
        //url的地址到时替换成生产的 TODO
        url: "/sjsc/cart/cartAction!ajaxAdd.action?stockId=" + id + "&num=" + $("#buyNum").val(),
        dataType: "jsonp",
        jsonp: "callback",
        success: function (result) {
            if (result.status == "2") {
                layer.msg("商品已添加到购物车!");
                getCartNum();
                //close_hrule_pop();
            } else if (result.status == "1") {
                window.location.href = result.data;
            } else if (result.status == "4") {
                layer.msg('已买或现买数量不能大于限购数量', {icon: 5, time: 1500});
            } else if (result.status == "404") {
                layer.msg(result.data);
            } else {
                layer.msg("添加失败,请稍后再试!");
            }
        },
        error: function (result) {
            layer.msg("添加失败,请稍后再试!");
        }
    });
}
function initTotal(){
    var attrIdArray=new Array();
    $('.rdioas').each(function(){
        if($(this).attr('checked')=='checked') {
            var $this = $(this);
            attrIdArray.push($this.val());
        }
    })
    console.log("属性数量："+$('.p_item').length+",属性选中数量："+attrIdArray.length);
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
    if($('.p_item').length==attrIdArray.length){
        setSku(attrIdArray,mcode);
    }
}


var ruleStatus=false;
/*立即购买*/
function purchase(stockId) {
    var refVOsIds = $('#refVOsIds').val();
    var refIds = refVOsIds.substring(1,refVOsIds.length-1);
    var nrefIds = refIds.split(", ");
    console.log("nrefIds")
    console.log(nrefIds)
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
    //调整为后面的，2018-8-1 20:49:05，@Choy
    //var buy_type = $("input[name='buy_type'][checked='checked']").val();
    var buy_type = $("input[name='buy_type']").val();

    if (buy_type == "1") {
        if ($("#contractId").val() == ''||$("#contractId").val()==null) {
            confirmTreaty();
        } else {
            var goodsId = $("#contractId").val();
            //带上合约渠道
            var contractChannel = $("#contractChannel").val();
            window.location.href = "/sjsc/groupmall/groupInterfaceAction!purchase2Check.action?stockId=" + stockId + "&buyNum=" + buyNum + "&goodsId=" + goodsId + "&contractChannel=" + contractChannel + "&token=" + token;
        }
    } else {
        var checkFlag = true;
        var needRule=false;
        $('.active .rdioas').each(function (i) {
            var attrId = $(this).val();
            $.ajax({
                url: '/sjsc/orderManage/orderManageAction!searchRuleMsg.action',
                type: 'post',
                data: {'attrId': attrId},
                async: false,
                dataType: 'json',
                success: function (e) {
                    console.log(e);
                    if(e.code=="0") {
                        if (buy_type == 0 || buy_type == null){
                            console.log("属性存在协议");
                            var ruleContent = e.data.obj.ruleContent;
                            var createTime = e.data.obj.createTime;
                            initAttrTreaty(ruleContent, createTime);
                            needRule=true;
                        }
                    }
                }
            })
        })
        if (ruleStatus==false&&needRule==true) {
            checkRule(stockId);
            checkFlag = false;
        }
        if (!checkFlag) {
            return;
        }
        window.location.href = "/sjsc/orderManage/orderManageAction!purchase2Submit.action?stockId=" + stockId + "&buyNum=" + buyNum + "&token=" + token + "&discountActivityMoney=" + discountActivityMoney + "&refVOsIds=" + nrefIds;

    }
}


/**
 * 显示协议信息
 * @type {boolean}
 */

function checkRule(stockId, type) {
    var index = layer.open({
        type: 1,
        btnAlign: 'c',
        closeBtn: 1,
        area: ['100%', '100%'],
        title: [''],
        offset: 'auto',
        content: $('#protocol').html(),
        btn: ['阅读并同意'],
        yes: function (index, layero) {
            ruleStatus = true;
            console.log("已进入yes");
            if (type == "cart") {
                addCart(stockId);
            } else {
                purchase(stockId);
            }
        }
        , cancel: function () {
            //return false 开启该代码可禁止点击该按钮关闭
            layer.closeAll();
        }
    });
}
//弹出同意协议窗口
function confirmTreaty() {
    $.ajax({
        //url的地址到时替换成生产的 TODO
        url: "/sjsc/orderManage/orderManageAction!checkIsShowTreaty.action",
        dataType: 'json',
        type: 'post',
        // async:true,
        success: function (result) {
            if (result.data.isLogin == '0') {
                window.location.href = '/sjsc/jsp/component/portal/JSP/login/login.jsp?isBack=back';
                return;
            }
            if (result.data.isShowTreaty == "1") {
                var index = layer.open({
                    type: 1,
                    btnAlign: 'c',
                    closeBtn: 1,
                    area: ['100%', '100%'],
                    title: [''],
                    offset: 'auto',
                    content: $('#protocol').html(),
                    btn: ['阅读并同意'],
                    yes: function (index, layero) {
                        $.ajax({
                            //url的地址到时替换成生产的 TODO
                            url: "/sjsc/orderManage/orderManageAction!recordingBehavior.action?stockId=" + currentStockId,
                            dataType: 'json',
                            type: 'post',
                            // async:true,
                            success: function (result) {
                                layer.closeAll();
                                showlay_pop();
                            },
                            error: function (result) {
                                layer.msg("网络异常,请稍后再试");
                            }
                        });
                    }
                    , cancel: function () {
                        //return false 开启该代码可禁止点击该按钮关闭
                        layer.closeAll();
                    }
                });
            } else {
                showlay_pop();
            }
        },
        error: function (result) {
            layer.msg("网络异常,请稍后再试");
        }
    });
}


var createTime;

//初始化购机协议内容
function initAttrTreaty(ruleContent, attrCreateTime) {
    if (createTime > attrCreateTime) {
        return;
    }
    createTime = attrCreateTime;
    if ($("#protocol").length > 0) {
        $('#protocol').html("<div class='body1'>" + ruleContent + "</div>");
    } else {
        var html = "<div id='protocol' style='display:none;'><div class='body1'>" + ruleContent + "</div></div>";
        $('body').append(html);
        var script = '<style type="text/css">.body1{color: #2a2a2a;font-family: "Microsoft YaHei","微软雅黑","宋体","helvetica","Hiragino Sans GB";font-size: 0.2rem;margin: 12px;}</style>';
        $('body').append(script);
    }
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

var stockMap ={};
 /**
 * SKU库存数
 * @param mcode
 */
function initVarStockMap(mcode) {
    $.ajax({
        type: "post",
        async: false,
        url: "/sjsc/weiPage/weiPageAction!searchStocksByMcode.action",
        data: {"mcode": mcode},
        dataType: "json",
        success: function (result) {
            if (result.code == "0") {
                stockMap = result.data.stockMap;
            }
        },
        error: function (result) {
            layer.msg('获取库存数失败', {icon: 5, time: 3000});
        }
    });
}

//总数
var stockCount = 0;
/**
 * 规格样式
 * @param isShortageShow
 */
function initSkuStyle() {
    //缺货提醒 || 无属性
    if ((isShortageShow == 1 && shortageShowType == 1) || $('.p_item').length == 0) {
        return;
    }
    //只有1个属性时
    if ($('.p_item').length == 1) {
        initSkuStyle4OneItem();
    }else{
        initSkuStyle4MoreItem();
    }

    $.each(stockMap, function (key, value) {
        stockCount += value ? parseInt(value) : 0;
    });
    if(stockCount == 0){
        $("#icoCtol_sku").addClass("shortage_hidden");
    }

}

function initSkuStyle4OneItem(){
    $.each(stockMap, function (key, value) {
        value = value ? parseInt(value) : 0;
        if (value == 0) {
            if (isShortageShow == 1) {
                //显示-置灰
                $('#' + key).addClass("shortage_zh");
                $('#' + key).children('a').addClass("shortage_zh_a");
            } else {
                //隐藏
                $('#' + key).addClass("shortage_hidden");
            }
            $('#' + key).removeClass('active').find('.rdioas').attr('checked', false);
        }else{
            var attrIdArray= new Array();
            $('.rdioas').each(function(){
                if($(this).attr('checked')=='checked') {
                    var $this = $(this);
                    attrIdArray.push($this.val());
                }
            })
            if (attrIdArray.length == 0) {
                $('#' + key).addClass("active").find('.rdioas').attr('checked', true);
                initTotal();
            }
        }
    });
}

function initSkuStyle4MoreItem() {
    //获取选中的规格
    var attrIdArray= new Array();
    $('.rdioas').each(function(){
        if($(this).attr('checked')=='checked') {
            var $this = $(this);
            attrIdArray.push($this.val());
        }
    })
    var attrIds = attrIdArray.join(',');
    if (!attrIds){
        return;
    }

    var preAttrIds;
    if(attrIdArray.length==$('.p_item').length){
        preAttrIds = attrIds.substring(0, attrIds.lastIndexOf(','));
    }else{
        preAttrIds = attrIds;
    }

    //提取要查询的库存
    var stockMapNow = {};
    var stockMapNowCount = 0;
    $.each(stockMap, function (key, value) {
        value = value ? parseInt(value) : 0;
        if (key.startsWith(preAttrIds)) {
            stockMapNow[key] = value;
            stockMapNowCount += value;
        }
    });

    $.each(stockMapNow, function (key, value) {
        var lastAttrId = key.substring(key.lastIndexOf(',') + 1, key.length);
        if (value == 0) {
            if (isShortageShow == 1) {
                //显示-置灰
                $('#' + lastAttrId).removeClass("shortage_hidden");
                $('#' + lastAttrId).addClass("shortage_zh");
                $('#' + lastAttrId).children('a').addClass("shortage_zh_a");
            } else {
                //隐藏
                $('#' + lastAttrId).removeClass("shortage_zh");
                $('#' + lastAttrId).children('a').removeClass("shortage_zh_a");
                $('#' + lastAttrId).addClass("shortage_hidden");
            }
            $('#' + lastAttrId).removeClass('active').find('.rdioas').attr('checked', false);
            //选存在的底层规格
            if (stockMapNowCount != 0) {
                var isContinue = true;
                $.each(stockMapNow, function (other, otherValue) {
                    var otherLastAttrId = other.substring(other.lastIndexOf(',') + 1, other.length);
                    if (otherValue && isContinue) {
                        $('#' + otherLastAttrId).addClass("active").find('.rdioas').attr('checked', true);
                        initTotal();
                        isContinue = false;
                    }
                });
            }
        }else{
            $('#' + lastAttrId).removeClass("shortage_zh");
            $('#' + lastAttrId).removeClass("shortage_hidden");
            $('#' + lastAttrId).children('a').removeClass("shortage_zh_a");
        }
    });
    //底层规格为空切换上层规格，切换后可能存在底层规格
    if(attrIdArray.length!=$('.p_item').length){
        if (stockMapNowCount != 0) {
            var isContinue = true;
            $.each(stockMapNow, function (other, otherValue) {
                var otherLastAttrId = other.substring(other.lastIndexOf(',') + 1, other.length);
                if (otherValue && isContinue) {
                    $('#' + otherLastAttrId).addClass("active").find('.rdioas').attr('checked', true);
                    initTotal();
                    isContinue = false;
                }
            });
        }
    }
}

/**
 * 缺货提醒
 */
function shortageTip() {
    layer.msg('已催促 卖家补货', {time: 1500});
    return false;
}