<%@ page language="java" import="java.util.*,java.net.URLDecoder" pageEncoding="utf-8"%>
<%@ page import="com.gx.address.domian.TbAddressVO" %>
<%
    //获取请求上下文
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    //获取到信息
    TbAddressVO tbAddressVO = (TbAddressVO) request.getSession().getAttribute("tbAddressVO");
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
            新增收货地址
        -->
        <div class="loginPage retisterPage">

            <div class="login">
                <div class="login_itemBox" style="margin-bottom: 0;">
                    <form action="<%=basePath%>address/ajaxUpdate" method="post" id="addForm">
                        <input type="hidden" name="addressId" id="addressId" value="<%=tbAddressVO.getAddressId()%>"/>
                        <div class="login_item">
                            <input type="text" name="inceptPeople" id="inceptPeople" value="<%=tbAddressVO.getInceptPeople()%>" class="lo_input" placeholder="收货人姓名">
                        </div>
                        <div class="login_item">
                            <input type="tel" name="inceptTel" id="inceptTel" value="<%=tbAddressVO.getInceptPhone()%>" class="lo_input" maxlength="11" placeholder="11位手机号码 ">
                        </div>
                        <div class="login_item">
                            <input type="text" name="provinceCityRegion" value="<%=tbAddressVO.getProvinceCityRegion()%>" class="lo_input chocieCity" id="chocieAllCity" maxlength="11" placeholder="请选择地区 " readonly="readonly">
                            <input type="hidden" id="city_id0" name="province" value="<%=tbAddressVO.getProvince()%>"/>
                            <input type="hidden" id="city_id1" name="city" value="<%=tbAddressVO.getCity()%>"/>
                            <input type="hidden" id="city_id2" name="region" value="<%=tbAddressVO.getRegion()%>"/>
                            <input type="hidden" id="city_text0" name="provinceText" value="<%=tbAddressVO.getProvinceText()%>"/>
                            <input type="hidden" id="city_text1" name="cityText" value="<%=tbAddressVO.getCityText()%>"/>
                            <input type="hidden" id="city_text2" name="regionText" value="<%=tbAddressVO.getRegionText()%>"/>
                        </div>
                        <%--                        <div class="login_item">--%>
                        <%--                            <textarea name="tbAddressVO.streetAddress" rows="3" cols="123" id="streetAddress" class="lo_input cmTarea" valid="{must:true, fieldType:'pattern',regex:'',tip:'街道信息'}" placeholder="街道门牌详细信息"></textarea>--%>
                        <%--                        </div>--%>
                        <div class="login_item">
                            <textarea name="streetAddress" rows="3" cols="123" id="streetAddress" class="lo_input cmTarea" valid="{must:true, fieldType:'pattern',regex:'',tip:'街道信息'}" placeholder="街道门牌详细信息"></textarea>
                            <input type="hidden" id="streetAddressVal" value="<%=tbAddressVO.getStreetAddress()%>"/>
                        </div>

                        <div class="setDeafultAddressForm">
                            <dl>
                                <dt>设为默认地址</dt>
                                <dd>
                                    <a href="javascript:;" id="switch" class="switch"></a>
                                    <input type="hidden" id="addressType" name="addressType" value="" />
                                    <input type="hidden" id="addressTypeVal" name="addressType" value="<%=tbAddressVO.getAddressType()%>" />
                                </dd>
                            </dl>
                        </div>

                        <div class="fixed_bottom fixed_bottomNotBorder">
                            <input type="text" name="" id="add_address" value="保存" class="btnSaveAddress "/>
                        </div>
                    </form>
                </div>

                <%--                <p class="eroTip" style="display: none;">*错误提示语！</p>--%>

                <!--
                    设为默认地址
                -->
            </div>

        </div>
        <!--
            end 新增收货地址
        -->
    </div>
</div>

<%--<div class="fixed_bottom fixed_bottomNotBorder">--%>
<%--    <input type="text" name="" id="" value="保存" class="btnSaveAddress btnSaveAddressDisabled"/>--%>
<%--</div>--%>


<script type="text/javascript" src="<%=basePath%>portal/js/jquery-3.2.1.min.js" ></script>
<script type="text/javascript" src="<%=basePath%>portal/js/function.js" ></script>
<script src="<%=basePath%>portal/js/jquery/jquery.form.js"></script>

<!--
    地区选择插件
-->
<link rel="stylesheet" type="text/css" href="<%=basePath%>portal/plugin/weui/weui.css"/>
<script src="<%=basePath%>portal/plugin/weui/weui.js" type="text/javascript"></script>
<!--地区数据-->
<script src="<%=basePath%>portal/plugin/weui/city-picker.js" type="text/javascript"></script>

<script type="text/javascript">
    $(function () {
        //街道门牌号赋值
        $("#streetAddress").val($("#streetAddressVal").val())
        //保存按钮赋值
        var addressType = $("#addressTypeVal").val();
        if(addressType==1){
            $("#switch").addClass("switchOn");
            $("#addressType").val("1");
        }else{
            $("#switch").removeClass("switchOn");
            $("#addressType").val("0");
        }
    })

    /*
     * 引用地区js
     */
    $("#chocieAllCity").cityPicker({
        title: "选择地区",
        onChange: function (picker, values, displayValues) {
            console.log(values, displayValues);
            //选了省市区，例如：广东省 广州市 天河区
            //1.省市区6位编码赋值
            $("#city_id0").val(values[0] + "" );//该ID为接收城市ID字段
            $("#city_id1").val(values[1] + "" );
            $("#city_id2").val(values[2] + "" );
            //2.省市区中文赋值
            $("#city_text0").val(displayValues[0] + "" );//该ID为接收城市ID字段
            $("#city_text1").val(displayValues[1] + "" );
            $("#city_text2").val(displayValues[2] + "" );
            //3.省市区显示的中文信息
            $("#chocieAllCity").val(displayValues[0] + " " + displayValues[1] + " " + displayValues[2] + " ");
        }
    });

    /*记住账号*/
    $('.switch').on('click', function() {
        var el = $(this);
        el.toggleClass('switchOn');
        if($("#addressType").val() == 0){
            $("#addressType").val(1);
        }else if($("#addressType").val() == 1){
            $("#addressType").val(0);
        }
    });

    //点击保存按钮执行事件
    $('#add_address').click(function () {
        console.log($("#addForm").serialize())
        $("#streetAddress").val($("#streetAddress").val().replace(/\s+/g,"").replace(/[\r\n]/g, ""));
        var phoneReg=/^1[345789]\d{9}$/;//手机号码格式
        var streetReg=/^\S{5,60}$/;//字符串长度不能大于60
        var inceptPostReg= /^[0-9]{6}$/;//邮政编码格式
        var pattern = new RegExp("[@&$|;%'\"<>\'+,]");
        if($("#inceptPeople").val().replace(/^\s+|\s+$/g,"")==""){layer.open({content:'收货人不能为空',time:2,skin:'msg'});return;}
        if(pattern.test($("#inceptPeople").val())){
            layer.open({content:'收货人不能含有特殊符号',time:2,skin:'msg'})
            return;
        }
        if($("#inceptTel").val().replace(/^\s+|\s+$/g,"")==""){layer.open({content:'收货电话不能为空',time:2,skin:'msg'});return;}
        if(!phoneReg.test($("#inceptTel").val())){layer.open({content:'收货手机号码为11位数字',time:2,skin:'msg'});return;}
        if($("#chocieAllCity").val()==""){layer.open({content:'地区不能为空',time:2,skin:'msg'});return;}
        if($("#streetAddress").val().replace(/^\s+|\s+$/g,"")==""){layer.open({content:'详细地址不能为空',time:2,skin:'msg'});return;}
        if(pattern.test($("#streetAddress").val().replace(/^\s+|\s+$/g,""))){
            layer.open({content:'详细地址不能含有特殊符号',time:2,skin:'msg'})
            return;
        }
        if(!streetReg.test($("#streetAddress").val().replace(/^\s+|\s+$/g,""))){layer.open({content:'收货人地址最少5个字，最多不能超过60字',time:2,skin:'msg'});return;}
        if($("#inceptPost").val()){
            if(!inceptPostReg.test($("#inceptPost").val())){layer.open({content:'邮政编码格式不正确',time:2,skin:'msg'});return;}
        }
        $("#add_address").attr("disabled","disabled");
        $(".btnSaveAddressDisabled").css('background','#999');
        // 提交数据
        $('#addForm').ajaxSubmit({
            type:'post',
            dataType:'json',
            success:function (result) {
                if ("0" == result.code) {
                    console.log("收货信息修改成功")
                    layer.open({
                        content: result.desc
                        ,time: 3
                        ,skin: 'msg'
                    });
                    setTimeout(function (){
                        window.location.href=("<%=basePath%>address/returnAddressPage");
                    },500)
                } else {
                    layer.open({
                        content: result.desc
                        ,time: 3
                        ,skin: 'msg'
                    });
                }
            },
            error:function () {
                layer.open({
                    content: '修改收货信息失败'
                    ,time: 3
                    ,skin: 'msg'
                });
            }
        });
        //   }
    });
</script>
</body>
</html>
