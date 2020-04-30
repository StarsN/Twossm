<%@ page language="java" import="java.util.*,java.net.URLDecoder" pageEncoding="utf-8"%>
<%@ page import="com.gx.member.domain.TbMemberPO" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <form id="updateMember" action="<%=basePath%>member/updateAccount" method="post">
        <div class="content">
            <!--
                登录
            -->
            <div class="loginPage">

                <div class="login_form">
                    <dl class="dflex">
                        <dt>昵称</dt>
                        <dd>
                            <input type="text" name="nickName" id="nickName" value="<%=tbMemberPO.getNickName()%>" class="common_input" placeholder="请输入昵称">
                            <span class="error" style="color: red;" id="nickNameError"></span>
                        </dd>
                    </dl>

                    <dl class="dflex">
                        <dt>原登录密码</dt>
                        <dd>
                            <input type="password" name="" id="" value="" class="common_input originPassword" placeholder="请输入原密码">
                            <input type="hidden" name="originPassword" id="originPassword" value=""  />
                            <span class="error" style="color: red;" id="originPasswordError"></span>
                        </dd>
                    </dl>
                    <dl class="dflex">
                        <dt>修改登录密码</dt>
                        <dd>
                            <input type="password" name="" id="" value="" class="common_input password1" placeholder="请输入密码">
                            <input type="hidden" name="password" id="password1" value=""  />
                            <span class="error" style="color: red;" id="password1Error"></span>
                        </dd>
                    </dl>

                    <dl class="dflex">
                        <dt>再次确认密码</dt>
                        <dd>
                            <input type="password" name="" id="" value="" class="common_input password2" placeholder="请再次输入密码">
                            <input type="hidden" name="password2" id="password2" value="" />
                            <span class="error" style="color: red;" id="password2Error"></span>
                        </dd>
                    </dl>
                </div>

                <%--            <p class="eroTip">*错误提示语！</p>--%>

                <div class="login_bottom">
                    <div class="login_item">
                        <!--
                            交互，输入信息后，登录按钮去掉class.btn_login_gray
                        -->
                        <input type="button" name="" id="save" value="确认" class="btn_login">
                    </div>
                </div>
            </div>
            <!--
                end 登录
            -->
        </div>
    </form>
    <!--
        如果有底部菜单栏：pb98s
    -->
</div>
<script type="text/javascript" src="<%=basePath%>portal/js/jquery-3.2.1.min.js" ></script>
<script type="text/javascript" src="<%=basePath%>portal/js/function.js" ></script>
</body>
<link rel="stylesheet" type="text/css" href="<%=basePath%>portal/js/layer/mobile/need/layer.css">
<script type="text/javascript" src="https://res.wx.qq.com/open/js/jweixin-1.3.2.js"></script>
<script type="text/javascript" src="<%=basePath%>portal/js/layer/mobile/layer.js"></script>
<script src="<%=basePath%>portal/js/jquery/jquery.form.js"></script>
<script src="<%=basePath%>portal/js/main.js" type="text/javascript"></script>
<script src="<%=basePath%>portal/js/md5.js" type="text/javascript"></script>
<script src="<%=basePath%>portal/js/itlogin-jssdk.js" type="text/javascript"></script>
<script type="text/javascript">
    $('#save').click(function () {
        var oriPasswordReg=/^.{8,20}$/;//密码正则表达式，8-20的字母数字组合
        var nickNameReg=/^\S{1,12}$/;//字符串长度不能大于12
        var phoneReg=/^1[34578]\d{9}$/;//手机号码格式
        //var passwordReg=/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,20}$/;//密码正则表达式，8-20的字母数字组合
        var passwordReg=/^(?![a-zA-z]+$)(?!\d+$)(?![,.~!@#$%^&*]+$)(?![a-zA-z\d]+$)(?![a-zA-z,.~!@#$%^&*]+$)(?![\d,.~!@#$%^&*]+$)[a-zA-Z\d,.~!@#$%^&*]{8,20}$/g;//密码正则表达式，8-20的字母数字符号组合
        var pattern = new RegExp("[@&$|;%'\"<>\'+,]"); //特殊字符
        if($("#nickName").val()==""){layer.open({content:'昵称不能为空',time:2,skin:'msg'});return;}
        /* if($("#phoneNumber").val()==""){layer.open({content:'手机号码不能为空',time:2,skin:'msg'});return;} */
        if(pattern.test($("#nickName").val())){
            layer.open({content:'昵称不能含有特殊符号',time:2,skin:'msg'})
            return;
        }
        if(!nickNameReg.test($("#nickName").val())){layer.open({content:'昵称最多不能超过12个字',time:2,skin:'msg'});return;}
        /* if(!phoneReg.test($("#phoneNumber").val())){layer.open({content:'手机号码为11位数字',time:2,skin:'msg'});return;}
        checkPhone();
        if(!phoneFalg){
            layer.open({content:'该手机号码已经被绑定，请重新输入',time:2,skin:'msg'});return;
        } */
        if(!oriPasswordReg.test($(".originPassword").val())){layer.open({content:'原密码格式不对',time:2,skin:'msg'});return;}
        if($(".password1").val()!=""){
            //修改。。2018-6-1 16:43:42，@choy
            /* if($("#password1").val()!=$("#password2").val()){layer.open({content:'两次输入的密码不一致!',time:2,skin:'msg'});return;}
            if(!passwordReg.test($("#password1").val())){layer.open({content:'该密码不够安全，请输入8-20位字母数字组合！',time:2,skin:'msg'});return;} */
            if($(".password1").val()!=$(".password2").val()){layer.open({content:'两次输入的密码不一致!',time:2,skin:'msg'});return;}
            if(!checkPassworkReg($(".password1").val())){layer.open({content:'该密码不安全，请输入8-20位数字、大写字母、小写字母、特殊符号（,.~!@#$%^&*）4选3组合',time:2,skin:'msg'});return;}
            //修改。。2018-6-12 13:12:12，@xiejianbin
            $("#password1").val($.md5( $.md5( $.md5($(".password1").val()))));
            $("#password2").val($.md5( $.md5($.md5($(".password2").val()))));
            //添加原密码判断，2018-7-12 17:35:09，@Choy
            $("#originPassword").val($.md5( $.md5($.md5($(".originPassword").val()))));
        }

        $("#save").attr("disabled","disabled");
        $(".btn_login_gray").css('background','#999');
        $("#updateMember").ajaxSubmit({
            dataType:'json',
            type:'post',
            success:function (data) {
                if ("0" == data.code) {
                    layer.open({
                        content: '会员修改信息成功'
                        ,time: 2
                        ,skin: 'msg'
                    });
                    setTimeout(function (){
                        window.location.href=("<%=basePath%>member/returnPersonCenterPage");
                    },800)
                } else {
                    layer.open({
                        content: data.desc
                        ,time: 2
                        ,skin: 'msg'
                    });
                    $("#save").removeAttr("disabled");
                    $(".btn_login_gray").css('background','#0085D0');
                }
            },
            error:function () {
                layer.open({
                    content: '用户信息修改失败'
                    ,time: 2
                    ,skin: 'msg'
                });
            }
        });

    })
</script>
</html>
