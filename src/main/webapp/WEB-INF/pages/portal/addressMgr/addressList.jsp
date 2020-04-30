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
    <link rel="stylesheet" type="text/css" href="<%=basePath%>portal/js/layer/mobile/need/layer.css">
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

<div class="container bgfff pb98s">

    <!--
        如果有底部菜单栏：pb98s
    -->
    <div class="content">


        <!--
            收货地址
        -->
        <div class="addNewAddressPage">
            <div class="adress_item">
<%--                <ul>--%>
<%--                    <li>--%>
<%--                        <div class="adress_item_list">--%>
<%--                            <h3 class="user_ad_info">--%>
<%--                                <span class="uNames">小苏</span><span class="uTel">18556325123</span><b class="mrUserStatue">默认</b>--%>
<%--                            </h3>--%>
<%--                            <p class="user_address">广东省广州市天河区 员村一横路3号（道一信息）</p>--%>
<%--                            <a href="#" class="btn_edit_address"></a>--%>
<%--                            <a href="javascript:;" class="btn_del_address"></a>--%>
<%--                        </div>--%>
<%--                    </li>--%>
<%--                    <li>--%>
<%--                        <div class="adress_item_list">--%>
<%--                            <h3 class="user_ad_info">--%>
<%--                                <span class="uNames">t苏</span><span class="uTel">18556325123</span>--%>
<%--                            </h3>--%>
<%--                            <p class="user_address">广东省广州市天河区 员村一横路3</p>--%>
<%--                            <a href="#" class="btn_edit_address"></a>--%>
<%--                            <a href="javascript:;" class="btn_del_address"></a>--%>
<%--                        </div>--%>
<%--                    </li>--%>
<%--                    <li>--%>
<%--                        <div class="adress_item_list">--%>
<%--                            <h3 class="user_ad_info">--%>
<%--                                <span class="uNames">sam苏</span><span class="uTel">18556325123</span>--%>
<%--                            </h3>--%>
<%--                            <p class="user_address">广东省广州市天村一横路3号村一横路3号河区 员村一横路3号</p>--%>
<%--                            <a href="#" class="btn_edit_address"></a>--%>
<%--                            <a href="javascript:;" class="btn_del_address"></a>--%>
<%--                        </div>--%>
<%--                    </li>--%>
<%--                </ul>--%>
            </div>

        </div>
        <!--
            end 收货地址
        -->
    </div>
</div>

<div class="fixed_bottom fixed_bottomNotBorder">
    <a href="<%=basePath%>address/returnAddAddressPage" class="btnNewAddress">
        <i></i><span>新增收货地址</span>
    </a>
</div>

<script type="text/javascript" src="<%=basePath%>portal/js/jquery-3.2.1.min.js" ></script>
<script type="text/javascript" src="<%=basePath%>portal/js/function.js" ></script>
<script type="text/javascript">
    //初始化
    $(function(){
        getAllAddress();
    });

    function getAllAddress(){
        $.ajax({
            url:'<%=basePath%>address/getAllAddress',
            type:'post',
            dataType:'json',
            success:function(result){
                var ui='';
                var end='<p class="noOrder">没有更多收货地址了~</p>';
                var addressVOs = result.addressVOs;
                for(var i=0;i<addressVOs.length;i++){
                    var li=
                        '<li>' +
                        '<div class="adress_item_list">' +
                        '<h3 class="user_ad_info">' +
                        '<span class="uNames">' + addressVOs[i].inceptPeople + '</span><span class="uTel">' +addressVOs[i].inceptPhone + '</span>' +
                        ("1"==addressVOs[i].addressType?('<b class="mrUserStatue">默认</b>'):('')) +
                        '</h3>'+
                        '<p class="user_address">' + addressVOs[i].provinceCityRegion+addressVOs[i].streetAddress + '</p>'+
                        '<a href="javascript:void(0)" onclick="updateAdderss(this,\''+addressVOs[i].addressId+'\')" class="btn_edit_address"></a>' +
                        '<a href="javascript:void(0)" onclick="delAdderss(this,\''+addressVOs[i].addressId+'\')" class="btn_del_address"></a>' +
                        '</div>' +
                        '</li>';
                    ui+=li;
                }
                ui=
                    '<ul>'+
                    ui +
                    '</ul>';
                ui+=end;
                $(".adress_item").html(ui);
            }
        })
    }

    //修改信息
    function updateAdderss(ele,addressId){
        window.location.href="<%=basePath%>address/editAddress?addressId="+addressId;
    }

    //删除信息
    function delAdderss(ele,addressId){
        //询问框
        layer.open({
            content: '您确定要删除收货信息吗？'
            ,btn: ['确定删除', '关闭']
            ,yes: function(index){
                $.ajax({
                    url:'<%=basePath%>address/deleteAddress',
                    data:{addressId:addressId},
                    dataType:'json',
                    type:'post',
                    success:function(result){
                        if(result.code=="0"){
                            layer.open({
                                content: result.desc
                                ,time: 2
                                ,skin: 'msg'
                            });
                            setTimeout(function (){
                                window.location.href=("<%=basePath%>address/returnAddressPage");
                            },500)
                        }else {
                            layer.open({
                                content: result.desc
                                ,time: 2
                                ,skin: 'msg'
                            });
                        }
                    },
                    error:function () {
                        layer.open({
                            content: '删除收货信息失败'
                            ,time: 2
                            ,skin: 'msg'
                        });
                    }

                })
            }
        });
    }
</script>
</body>
</html>
