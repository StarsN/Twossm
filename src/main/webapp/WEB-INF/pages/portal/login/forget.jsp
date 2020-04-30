<%@ page language="java" import="java.util.*,java.net.URLDecoder" pageEncoding="utf-8"%>
<%@ page import="com.gx.member.domain.TbMemberPO" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    //获取到会员信息
    TbMemberPO tbMemberPO = (TbMemberPO) request.getSession().getAttribute("tbMemberPO");
    System.out.print("账号管理页面，session中的memberPO=" + tbMemberPO);
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

<div class="container bgfff">

    <!--
        如果有底部菜单栏：pb98s
    -->
    <div class="content">
        <!--
            登录
        -->
        <div class="loginPage retisterPage">

            <div class="login">
                <div class="login_itemBox">
                    <div class="login_item">
                        <input type="tel" name="phoneNumber" id="phoneNumber" value="${param.phoneNumber }" class="lo_input" placeholder="手机号码">
                        <span class="error" style="color: red;font-size: 0.22rem" id="phoneError"></span>
                    </div>
                    <div class="login_item">
                        <input type="text" name="sCode" id="sCode" value="" class="lo_input" placeholder="图形验证码"/>
                        <img src="<%=basePath%>jsp/image.jsp" id="imgCode" class="imgCode" alt="图形验证码"/>
                        <span class="error" style="color: red;font-size: 0.22rem;" id="codeError2" ></span>
                    </div>
                    <div class="login_item">
                        <input type="text" name="verificationCode" id="verificationCode" value="" class="lo_input" placeholder="验证码"/>
                        <div class="frcode">
                            <input type="button" id="getCode" name="" value="获取验证码" class="btn_getMsgcode">
                        </div>
                        <span class="error" style="color: red;font-size: 0.22rem;" id="vCodeError" ></span>
                    </div>
                </div>

<%--                <p class="eroTip">*错误提示语！</p>--%>

                <div class="login_bottom">
                    <div class="login_item">
                        <!--
                            交互，输入信息后，登录按钮去掉class.btn_login_gray
                        -->
                        <input type="button" name="" id="" value="下一步" class="btn_login">
                    </div>

                </div>
            </div>

        </div>
        <!--
            end 登录
        -->
    </div>
</div>




<script type="text/javascript" src="<%=basePath%>portal/js/jquery-3.2.1.min.js" ></script>
<script type="text/javascript" src="<%=basePath%>portal/js/function.js" ></script>
<script type="text/javascript">

    /*记住账号*/
    // $('.checkList').on('click', function() {
    //     var _el = $(this);
    //     _el.find('.form_check').toggleClass('form_checkOn');
    //     if(_el.find('.form_check').hasClass('form_checkOn')) {
    //         _el.find('.form_check').attr('checked', true);
    //     } else {
    //         _el.find('.form_check').attr('checked', false);
    //     }
    // });


    //获取倒计时
    // $(function() {
    //     var wait = 60;
    //
    //     function time(obj) {
    //         if(wait == 0) {
    //             obj.className = 'btn_getMsgcode';
    //             obj.removeAttribute("disabled");
    //             obj.value = "获取";
    //             wait = 60;
    //         } else {
    //             obj.className = 'btnCodeMsgDisabled'; //按钮变灰，不可点击
    //             obj.setAttribute("disabled", true);
    //             obj.value = "重新发送(" + wait + ")";
    //             wait--;
    //             setTimeout(function() {
    //                     time(obj)
    //                 },
    //                 1000)
    //         }
    //     }
    //     document.getElementById("getCode").onclick = function() {
    //         time(this);
    //     }
    // })

    //点击图片验证码，更换验证码，生成图片的同时，
    //工具类往session中写入了一个名为sRand的验证码，从session中取出跟被验证用户输入的图片中的string进行比较即可。
    $("#imgCode").click(function(){
        var url="<%=basePath%>jsp/image.jsp?"+Math.random();
        $("#imgCode").attr("src",url);
    })

    //手机号码验证  是否注册过
    var phoneflag=true;
    function checkPhone(){
        var phoneNumber=document.getElementById("phoneNumber").value;
        var s=document.getElementById("phoneError");
        var phoneflag1=true;
        var phoneflag2=true;
        var Reg=/^1[3456789]\d{9}$/;//手机号码格式
        if(phoneNumber==""){
            s.innerHTML="*请先输入手机号码";
            phoneflag1=false;
            phoneflag=false;
            return phoneflag;
        } else{
            if(!Reg.test(phoneNumber)){
                s.innerHTML="*手机号码格式不正确";
                phoneflag2=false;
                phoneflag=false;
                return phoneflag;
            }else{
                s.innerHTML="";
                phoneflag=true;
            }
        }

    }
    //blur失去焦点时触发事件！
    $("#phoneNumber").blur(function(){
        checkPhone();
    });
    //校验 验证码
    var vCodeflag = false;
    function checkCode(){
        var vCodeflag1 = true;
        var verificationCode = $("#verificationCode").val();
        var vCodeError = $("#vCodeError");
        if(verificationCode==""){
            vCodeError.html("*请输入验证码");
            vCodeflag1 = false;
            vCodeflag = false;
            return vCodeflag;
        }else{
            vCodeError.html("");
            vCodeflag = true;
            return vCodeflag;
        }
    }
    //验证码焦点离开事件
    $("#verificationCode").blur(function(){
        checkCode();
    });

    //校验 图片验证码
    var sCodeflag = false;
    function checkImgCode(){
        var sCode = $("#sCode").val();
        var codeError = $("#codeError2");
        if(sCode==""){
            codeError.html("*请输入图形验证码");
            sCodeflag = false;
        }else{
            codeError.html("");
            sCodeflag = true;
        }
    }
    //验证码焦点离开事件
    $("#sCode").blur(function(){
        checkImgCode();
    });
    //获取倒计时
    var wait = 60;
    function time(obj) {
        if(wait == 0) {
            obj.className = 'btn_getMsgcode';
            obj.removeAttribute("disabled");
            obj.value = "获取";
            wait = 60;
        } else {
            obj.className = 'btnCodeMsgDisabled'; //按钮变灰，不可点击
            obj.setAttribute("disabled", true);
            obj.value = "重新发送(" + wait + ")";
            wait--;
            setTimeout(function() {
                    time(obj)
                },
                1000)
        }
    }
    //点击获取验证码按钮
    document.getElementById("getCode").onclick=function(){
        checkPhone();
        checkImgCode();
        var phoneNumber=$("#phoneNumber").val();
        console.log(phoneNumber)
        console.log(phoneflag)
        console.log(sCodeflag)
        if(phoneflag&&sCodeflag){
            $.ajax({
                url:"<%=basePath%>member/sendVcode",
                data:
                    {"phoneNumber":phoneNumber,
                        "sCode":$("#sCode").val(),
                        "sendType":"2"
                    },//传入后台参数
                type:"POST",
                dataType:'json',
                success:function(data){
                    if ("1001" == data.code) {
                        layer.open({content: data.desc,time: 2 ,skin: 'msg'});
                    }else if("1000" == data.code){
                        layer.open({content: data.desc,time: 2 ,skin: 'msg'});
                    }
                    // else if("1101" == data.code){
                    //     layer.open({content: data.desc,time: 2 ,skin: 'msg'});
                    //     wait = 0;
                    // }else if("1102" == data.code){
                    //     var url="image.jsp?"+Math.random();
                    //     $("#imgCode").attr("src",url);
                    //     layer.open({content: data.desc,time: 2 ,skin: 'msg'});
                    //     wait = 0;
                    // }else {
                    //     layer.open({content: '验证码发送失败，请重新发送',time: 2,skin: 'msg'});
                    // }
                }
            });
            time(this);
        }

    }
    //点击下一步按钮事件
    $('#btn_reg').click(function () {
        var verificationCode = $("#verificationCode").val();
        var phoneNumber=$("#phoneNumber").val();
        //手机校验
        checkPhone();
        //验证码校验
        checkCode();
        //表单校验结果
        if( phoneflag&&vCodeflag){
            $.ajax({
                url:"${baseURL}/member/memberAction!checkVcode.action",
                data:{"verificationCode":verificationCode,phoneNumber:phoneNumber},//传入后台参数
                type:"POST",
                dataType:'json',
                success:function(result){
                    if(result.code=="101"){
                        //正确
                        window.location.href=("forget2.jsp"+ '?phoneNumber='+$("#phoneNumber").val()+'&verificationCode='+verificationCode+'&dqdp_csrf_token='+dqdp_csrf_token);
                    }
                    else {
                        // $("#vCodeError").html("<img src='../../images/imageerror.png' width='20px' height='20px'>"+result.desc);
                        $("#vCodeError").html(result.desc);
                    }
                }
            });
        }

    });
</script>
</body>
<link rel="stylesheet" type="text/css" href="<%=basePath%>portal/js/layer/mobile/need/layer.css">
<script type="text/javascript" src="https://res.wx.qq.com/open/js/jweixin-1.3.2.js"></script>
<script type="text/javascript" src="<%=basePath%>portal/js/layer/mobile/layer.js"></script>
<script src="<%=basePath%>portal/js/jquery/jquery.form.js"></script>
<script src="<%=basePath%>portal/js/main.js" type="text/javascript"></script>
<script src="<%=basePath%>portal/js/md5.js" type="text/javascript"></script>
<script src="<%=basePath%>portal/js/itlogin-jssdk.js" type="text/javascript"></script>
</html>
