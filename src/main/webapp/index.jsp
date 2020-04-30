<%@ page contentType="text/html; charset=UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<script language="javascript"type="text/javascript">
    window.location.href="<%=basePath%>login/returnLoginPage";
</script>


<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Title</title>--%>
<%--</head>--%>
<%--<body>--%>

<%--<a href="account/findAll">测试查询</a>--%>

<%--<h3>测试包</h3>--%>

<%--<form action="account/save" method="post">--%>
<%--    姓名：<input type="text" name="name" /><br/>--%>
<%--    金额：<input type="text" name="money" /><br/>--%>
<%--    <input type="submit" value="保存"/><br/>--%>
<%--</form>--%>
<%--<br>--%>
<%--<br>--%>
<%--<br>--%>
<%--真香警告！！！--%>
<%--如果对ssm整合有疑惑或者报错不知道怎么解决可以呼唤我，我一直都在~--%>
<%--</body>--%>
<%--</html>--%>







<%--<%@ page contentType="text/html;charset=UTF-8" language="java"%>--%>
<%--<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>--%>
<%--<%--%>
<%--    //获取请求上下文--%>
<%--    String path = request.getContextPath();--%>
<%--    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";--%>
<%--%>--%>
<%--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">--%>
<%--<html xmlns="http://www.w3.org/1999/xhtml">--%>
<%--<head id="Head1">--%>
<%--    <title>手机移动商城后台管理</title>--%>
<%--    <link href="<%=basePath%>index/css/default.css" rel="stylesheet" type="text/css" />--%>
<%--    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />--%>
<%--    <link rel="stylesheet" type="text/css"--%>
<%--          href="<%=basePath%>index/js/themes/default/easyui.css" />--%>
<%--    <link rel="stylesheet" type="text/css" href="<%=basePath%>index/js/themes/icon.css" />--%>
<%--    <script type="text/javascript" src="<%=basePath%>index/js/jquery-1.4.2.min.js"></script>--%>
<%--    <script type="text/javascript" src="<%=basePath%>index/js/jquery.easyui.pack.js"></script>--%>
<%--    <script type="text/javascript" src='<%=basePath%>index/js/outlook2.js'></script>--%>

<%--    <script type="text/javascript">--%>
<%--        var _menus = {--%>
<%--            "menus" : [ {--%>
<%--                "menuid" : "1",--%>
<%--                "icon" : "icon-sys",--%>
<%--                "menuname" : "数据中心",--%>
<%--                "menus" : [ {--%>
<%--                    "menuname" : "商品分类",--%>
<%--                    "icon" : "icon-sys",--%>
<%--                    "url" : "account/message"--%>
<%--                }, {--%>
<%--                    "menuname" : "商品品牌",--%>
<%--                    "icon" : "icon-sys",--%>
<%--                    "url" : ""--%>
<%--                } ]--%>
<%--            },{--%>
<%--                "menuid" : "2",--%>
<%--                "icon" : "icon-sys",--%>
<%--                "menuname" : "商品管理",--%>
<%--                "menus" : [ {--%>
<%--                    "menuname" : "商品资料管理",--%>
<%--                    "icon" : "icon-sys",--%>
<%--                    "url" : "merchandise/returnListPage"--%>
<%--                }, {--%>
<%--                    "menuname" : "属性管理",--%>
<%--                    "icon" : "icon-sys",--%>
<%--                    "url" : ""--%>
<%--                }, {--%>
<%--                    "menuname" : "商品库存",--%>
<%--                    "icon" : "icon-sys",--%>
<%--                    "url" : ""--%>
<%--                }, {--%>
<%--                    "menuname" : "商品协议",--%>
<%--                    "icon" : "icon-sys",--%>
<%--                    "url" : ""--%>
<%--                }]--%>
<%--            },{--%>
<%--                "menuid" : "3",--%>
<%--                "icon" : "icon-sys",--%>
<%--                "menuname" : "系统管理",--%>
<%--                "menus" : [ {--%>
<%--                    "menuname" : "用户管理",--%>
<%--                    "icon" : "icon-sys",--%>
<%--                    "url" : "user/returnUserListPage"--%>
<%--                }, {--%>
<%--                    "menuname" : "角色管理",--%>
<%--                    "icon" : "icon-sys",--%>
<%--                    "url" : ""--%>
<%--                }, {--%>
<%--                    "menuname" : "权限管理",--%>
<%--                    "icon" : "icon-sys",--%>
<%--                    "url" : ""--%>
<%--                }, {--%>
<%--                    "menuname" : "渠道管理",--%>
<%--                    "icon" : "icon-sys",--%>
<%--                    "url" : ""--%>
<%--                }]--%>
<%--            }]--%>
<%--        };--%>
<%--        //设置登录窗口--%>
<%--        function openPwd() {--%>
<%--            $('#w').window({--%>
<%--                title : '修改密码',--%>
<%--                width : 300,--%>
<%--                modal : true,--%>
<%--                shadow : true,--%>
<%--                closed : true,--%>
<%--                height : 160,--%>
<%--                resizable : false--%>
<%--            });--%>
<%--        }--%>
<%--        //关闭登录窗口--%>
<%--        function closePwd() {--%>
<%--            $('#w').window('close');--%>
<%--        }--%>

<%--        //修改密码--%>
<%--        function serverLogin() {--%>
<%--            var $newpass = $('#txtNewPass');--%>
<%--            var $rePass = $('#txtRePass');--%>

<%--            if ($newpass.val() == '') {--%>
<%--                msgShow('系统提示', '请输入密码！', 'warning');--%>
<%--                return false;--%>
<%--            }--%>
<%--            if ($rePass.val() == '') {--%>
<%--                msgShow('系统提示', '请在一次输入密码！', 'warning');--%>
<%--                return false;--%>
<%--            }--%>

<%--            if ($newpass.val() != $rePass.val()) {--%>
<%--                msgShow('系统提示', '两次密码不一至！请重新输入', 'warning');--%>
<%--                return false;--%>
<%--            }--%>
<%--            //修改密码,使用ajax表单post到servlet--%>
<%--            $.post('changePwdAction?newpass=' + $newpass.val(), function(msg) {--%>
<%--                msgShow('系统提示', '密码修改成功');--%>
<%--                $newpass.val('');--%>
<%--                $rePass.val('');--%>
<%--                close();--%>
<%--            })--%>

<%--        }--%>

<%--        $(function() {--%>

<%--            openPwd();--%>
<%--            //--%>
<%--            $('#editpass').click(function() {--%>
<%--                $('#w').window('open');--%>
<%--            });--%>

<%--            $('#btnEp').click(function() {--%>
<%--                serverLogin();--%>
<%--            })--%>

<%--            $('#btnCancel').click(function() {--%>
<%--                closePwd();--%>
<%--            })--%>

<%--            $('#loginOut').click(function() {--%>
<%--                $.messager.confirm('系统提示', '您确定要退出本次登录吗?', function(r) {--%>

<%--                    if (r) {--%>
<%--                        location.href = 'logout.jsp';--%>
<%--                    }--%>
<%--                });--%>

<%--            })--%>

<%--        });--%>
<%--    </script>--%>

<%--</head>--%>
<%--<body class="easyui-layout" style="overflow-y: hidden" scroll="no">--%>
<%--<noscript>--%>
<%--    <div--%>
<%--            style="position: absolute; z-index: 100000; height: 2046px; top: 0px; left: 0px; width: 100%; background: white; text-align: center;">--%>
<%--        <img src="<%=basePath%>resources/images/noscript.gif" alt='抱歉，请开启脚本支持！' />--%>
<%--    </div>--%>
<%--</noscript>--%>
<%--<div region="north" split="true" border="false"--%>
<%--     style="overflow: hidden; height: 30px; background: url(<%=basePath%>index/images/layout-browser-hd-bg.gif) #7f99be repeat-x center 50%; line-height: 20px; color: #fff; font-family: Verdana, 微软雅黑, 黑体">--%>
<%--		<span style="float: right; padding-right: 20px;" class="head">欢迎--%>
<%--			<font color="red"><%=session.getAttribute("adminName")%></font> <a--%>
<%--                    href="#" id="editpass">修改密码</a> <a href="#" id="loginOut">安全退出</a>--%>
<%--		</span> <span style="padding-left: 10px; font-size: 16px;"><img--%>
<%--        src="<%=basePath%>index/images/blocks.png" width="20" height="20"--%>
<%--        align="absmiddle" /> 手机移动商城后台管理</span>--%>
<%--</div>--%>
<%--<div region="south" split="true"--%>
<%--     style="height: 30px; background: #D2E0F2;"></div>--%>
<%--<div region="west" split="true" title="导航菜单" style="width: 180px;"--%>
<%--     id="west">--%>
<%--    <div class="easyui-accordion" fit="true" border="false">--%>
<%--        <!--  导航内容 -->--%>

<%--    </div>--%>

<%--</div>--%>
<%--<div id="mainPanle" region="center"--%>
<%--     style="background: #eee; overflow-y: hidden">--%>
<%--    <div id="tabs" class="easyui-tabs" fit="true" border="false">--%>
<%--        <div title="欢迎使用" style="padding: 20px; overflow: hidden;" id="home">--%>

<%--            <h1>欢迎使用手机移动商城后台管理系统</h1>--%>
<%--            <p>点击左侧按钮</p>--%>

<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>


<%--<!--修改密码窗口-->--%>
<%--<div id="w" class="easyui-window" title="修改密码" collapsible="false"--%>
<%--     minimizable="false" maximizable="false" icon="icon-save"--%>
<%--     style="width: 300px; height: 150px; padding: 5px; background: #fafafa;">--%>
<%--    <div class="easyui-layout" fit="true">--%>
<%--        <div region="center" border="false"--%>
<%--             style="padding: 10px; background: #fff; border: 1px solid #ccc;">--%>
<%--            <table cellpadding=3>--%>
<%--                <tr>--%>
<%--                    <td>新密码：</td>--%>
<%--                    <td><input name="npwd" id="txtNewPass" type="password"--%>
<%--                               class="txt01" /></td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td>确认密码：</td>--%>
<%--                    <td><input id="txtRePass" type="password" class="txt01" /></td>--%>
<%--                </tr>--%>
<%--            </table>--%>
<%--        </div>--%>
<%--        <div region="south" border="false"--%>
<%--             style="text-align: right; height: 30px; line-height: 30px;">--%>
<%--            <a id="btnEp" class="easyui-linkbutton" icon="icon-ok"--%>
<%--               href="javascript:void(0)"> 确定</a> <a id="btnCancel"--%>
<%--                                                    class="easyui-linkbutton" icon="icon-cancel"--%>
<%--                                                    href="javascript:void(0)">取消</a>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

<%--<div id="mm" class="easyui-menu" style="width: 150px;">--%>
<%--    <div id="mm-tabclose">关闭</div>--%>
<%--    <div id="mm-tabcloseall">全部关闭</div>--%>
<%--    <div id="mm-tabcloseother">除此之外全部关闭</div>--%>
<%--    <div class="menu-sep"></div>--%>
<%--    <div id="mm-tabcloseright">当前页右侧全部关闭</div>--%>
<%--    <div id="mm-tabcloseleft">当前页左侧全部关闭</div>--%>
<%--    <div class="menu-sep"></div>--%>
<%--    <div id="mm-exit">退出</div>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>




<%--<%@page import="java.sql.ResultSet"%>--%>
<%--&lt;%&ndash;<%@page import="utils.JdbcUtils"%>&ndash;%&gt;--%>
<%--&lt;%&ndash;<%@page import="com.mysql.jdbc.PreparedStatement"%>&ndash;%&gt;--%>
<%--<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>--%>
<%--<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>--%>
<%--<%--%>
<%--//    String path = request.getContextPath();--%>
<%--//    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()--%>
<%--//            + path + "/";--%>
<%--    //获取请求上下文--%>
<%--    String path = request.getContextPath();--%>
<%--    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";--%>
<%--    System.out.print(basePath);--%>
<%--%>--%>

<%--<!DOCTYPE html>--%>
<%--<html lang="zh-cn">--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <title>主页</title>--%>
<%--    <script src="<%=basePath%>eui/jquery.min.js"></script>--%>
<%--    <script src="<%=basePath%>eui/easyloader.js"></script>--%>
<%--    <script src="<%=basePath%>eui/jquery.easyui.min.js"></script>--%>
<%--    <link rel="stylesheet" href="<%=basePath%>eui/themes/icon.css">--%>
<%--    <link rel="stylesheet" href="<%=basePath%>eui/themes/default/easyui.css">--%>
<%--    <style type="text/css">--%>
<%--        #fm {--%>
<%--            margin: 0;--%>
<%--            padding: 10px 30px;--%>
<%--        }--%>

<%--        .ftitle {--%>
<%--            font-size: 14px;--%>
<%--            font-weight: bold;--%>
<%--            padding: 5px 0;--%>
<%--            margin-bottom: 10px;--%>
<%--            border-bottom: 1px solid #ccc;--%>
<%--        }--%>

<%--        .fitem {--%>
<%--            margin-bottom: 5px;--%>
<%--        }--%>

<%--        .fitem label {--%>
<%--            display: inline-block;--%>
<%--            width: 80px;--%>
<%--        }--%>

<%--        .fitem input {--%>
<%--            width: 160px;--%>
<%--        }--%>
<%--    </style>--%>
<%--    <script>--%>
<%--        $(function() {--%>
<%--            $('#dg').datagrid(--%>
<%--                {--%>
<%--                    title : '下载文档',--%>
<%--                    iconCls : 'icon-edit',--%>
<%--                    width : 960,--%>
<%--                    height : 450,--%>
<%--                    singleSelect : true,--%>
<%--                    idField : 'usernumber',--%>
<%--                    url : 'displayBoundAction',--%>
<%--                    columns : [ [--%>
<%--                        {--%>
<%--                            field : 'ProductID',--%>
<%--                            title : '产品编号',--%>
<%--                            width : 50--%>
<%--                        },--%>
<%--                        {--%>
<%--                            field : 'Version',--%>
<%--                            title : '产品版本',--%>
<%--                            width : 50--%>
<%--                        },--%>
<%--                        {--%>
<%--                            field : 'PType',--%>
<%--                            title : '产品类型',--%>
<%--                            width : 50--%>
<%--                        },--%>
<%--                        {--%>
<%--                            field : 'Content',--%>
<%--                            title : '产品描述',--%>
<%--                            width : 100--%>
<%--                        },--%>
<%--                        {--%>
<%--                            field : 'bound',--%>
<%--                            title : '积分',--%>
<%--                            width : 80,--%>
<%--                            align : 'left'--%>
<%--                        },--%>
<%--                        {--%>
<%--                            field : 'action',--%>
<%--                            title : '操作',--%>
<%--                            width : 70,--%>
<%--                            align : 'center',--%>
<%--                            formatter : function(value, row, index) {--%>
<%--                                var e = '<a href="Download.jsp" id="down" onclick="return saverow(this)">下载</a> ';--%>
<%--                                var d = '';--%>
<%--                                return e + d;--%>
<%--                            }--%>
<%--                        } ] ],--%>
<%--                    onBeforeEdit : function(index, row) {--%>
<%--                        row.editing = true;--%>
<%--                        updateActions(index);--%>
<%--                    },--%>
<%--                    onAfterEdit : function(index, row) {--%>
<%--                        row.editing = false;--%>
<%--                        updateActions(index);--%>
<%--                    },--%>
<%--                    onCancelEdit : function(index, row) {--%>
<%--                        row.editing = false;--%>
<%--                        updateActions(index);--%>
<%--                    }--%>
<%--                });--%>
<%--        });--%>

<%--        function updateActions(index) {--%>
<%--            $('#dg').datagrid('updateRow', {--%>
<%--                index : index,--%>
<%--                row : {}--%>
<%--            });--%>
<%--        }--%>

<%--        function getRowIndex(target) {--%>
<%--            var tr = $(target).closest('tr.datagrid-row');--%>
<%--            return parseInt(tr.attr('datagrid-row-index'));--%>
<%--        }--%>

<%--        function editrow(target) {--%>
<%--            $('#dg').datagrid('beginEdit', getRowIndex(target));--%>
<%--        }--%>

<%--        function saverow(target) {--%>
<%--            $('#dg').datagrid('endEdit', getRowIndex(target));--%>
<%--            var row = $('#dg').datagrid('getSelected');--%>
<%--            var jifen = $('#currentjifen').val();--%>
<%--            if (row.bound > jifen) {--%>
<%--                alert('当前积分不足以下载此文档！');--%>
<%--                return false;--%>
<%--            }--%>
<%--            $.post("downloadAction", {--%>
<%--                "point" : row.bound,--%>
<%--                "ProductID" : row.ProductID--%>
<%--            }, function(res) {--%>
<%--                if (!res.success) {--%>
<%--                    $.messager.show({--%>
<%--                        Title : '错误',--%>
<%--                        msg : '积分不足，请充值'--%>
<%--                    })--%>
<%--                }--%>
<%--            }, 'json');--%>
<%--        }--%>

<%--        function cancelrow(target) {--%>
<%--            $('#dg').datagrid('cancelEdit', getRowIndex(target));--%>
<%--        }--%>
<%--    </script>--%>
<%--</head>--%>
<%--<body>--%>
<%--&lt;%&ndash;&lt;%&ndash;%>--%>
<%--&lt;%&ndash;    String username = (String) session.getAttribute("adminName");&ndash;%&gt;--%>
<%--&lt;%&ndash;    String sql = "select point from user where username=\'" + username + "\'";&ndash;%&gt;--%>
<%--&lt;%&ndash;    PreparedStatement preparedStatement = (PreparedStatement) JdbcUtils.getConnection().prepareStatement(sql);&ndash;%&gt;--%>
<%--&lt;%&ndash;    ResultSet rs = preparedStatement.executeQuery();&ndash;%&gt;--%>
<%--&lt;%&ndash;    while (rs.next()) {&ndash;%&gt;--%>
<%--&lt;%&ndash;%>&ndash;%&gt;--%>
<%--<font color="red">当前积分:</font>--%>
<%--&lt;%&ndash;<input id="currentjifen" value="<%=rs.getInt(1)%>" style="width: 20px"&ndash;%&gt;--%>
<%--&lt;%&ndash;       disabled="true">&ndash;%&gt;--%>
<%--&lt;%&ndash;&lt;%&ndash;%>--%>
<%--&lt;%&ndash;    }&ndash;%&gt;--%>
<%--&lt;%&ndash;%>&ndash;%&gt;--%>
<%--<table id="dg" class="easyui-datagrid"--%>
<%--       style="width: 100%; height: 100%"--%>
<%--       data-options="rownumbers:true,singleSelect:true,pagination:true"--%>
<%--       url="displayBoundAction" toolbar="#toolbar" rownumbers="true"--%>
<%--       fitColumns="true" singleSelect="true">--%>
<%--</table>--%>

<%--</body>--%>
<%--</html>--%>





<%--<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>--%>
<%--<%--%>
<%--    String path = request.getContextPath();--%>
<%--    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()--%>
<%--            + path + "/";--%>
<%--%>--%>
<%--<!DOCTYPE html>--%>
<%--<html lang="zh-cn">--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <title>已购买的点卡</title>--%>
<%--    <script src="<%=basePath%>eui/jquery.min.js"></script>--%>
<%--    <script src="<%=basePath%>eui/jquery.easyui.min.js"></script>--%>
<%--    <link rel="stylesheet" href="<%=basePath%>eui/themes/icon.css">--%>
<%--    <link rel="stylesheet" href="<%=basePath%>eui/themes/default/easyui.css">--%>
<%--</head>--%>
<%--<style type="text/css">--%>
<%--    #fm {--%>
<%--        margin: 0;--%>
<%--        padding: 10px 30px;--%>
<%--    }--%>

<%--    .ftitle {--%>
<%--        font-size: 14px;--%>
<%--        font-weight: bold;--%>
<%--        padding: 5px 0;--%>
<%--        margin-bottom: 10px;--%>
<%--        border-bottom: 1px solid #ccc;--%>
<%--    }--%>

<%--    .fitem {--%>
<%--        margin-bottom: 5px;--%>
<%--    }--%>

<%--    .fitem label {--%>
<%--        display: inline-block;--%>
<%--        width: 80px;--%>
<%--    }--%>

<%--    .fitem input {--%>
<%--        width: 160px;--%>
<%--    }--%>
<%--</style>--%>
<%--<body>--%>
<%--<table id="dg" title="已购买的点卡" class="easyui-datagrid"--%>
<%--       style="width: 100%; height: 100%"--%>
<%--       data-options="rownumbers:true,singleSelect:true,pagination:true"--%>
<%--       url="displayCardThatHasBuyAction" rownumbers="true" fitColumns="true"--%>
<%--       singleSelect="false">--%>
<%--    <thead>--%>
<%--    <tr>--%>
<%--        <th field="CardNumber" width="22">账号</th>--%>
<%--        <th field="CardPassword" width="22">密码</th>--%>
<%--        <th field="Point" width="22">剩余点数</th>--%>
<%--        <th field="TimeOutDate" width="50">过期时间</th>--%>
<%--        <th field="AddTime" width="22">购买时间</th>--%>
<%--    </tr>--%>
<%--    </thead>--%>
<%--</table>--%>
<%--<div id="dlg" class="easyui-dialog"--%>
<%--     style="width: 400px; height: 280px; padding: 10px 20px" closed="true">--%>

<%--</div>--%>
<%--</body>--%>
<%--</html>--%>

<%--<%@page import="java.text.SimpleDateFormat"%>--%>
<%--<%@ page language="java"--%>
<%--         pageEncoding="utf-8"%>--%>

<%--&lt;%&ndash;&lt;%&ndash;%>--%>
<%--&lt;%&ndash;    String path = request.getContextPath();&ndash;%&gt;--%>
<%--&lt;%&ndash;    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()&ndash;%&gt;--%>
<%--&lt;%&ndash;            + path + "/";&ndash;%&gt;--%>
<%--&lt;%&ndash;%>&ndash;%&gt;--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>编辑公告</title>--%>
<%--    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">--%>
<%--    <meta name="viewport"--%>
<%--          content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">--%>
<%--    <script type="text/javascript" src="index/js/jquery-1.4.2.min.js"></script>--%>
<%--    <title></title>--%>
<%--    <style type="text/css">--%>
<%--        <!----%>
<%--        body {--%>
<%--            background-color: #D7EDFB;--%>
<%--        }--%>
<%--        -->--%>
<%--    </style>--%>
<%--    <script type="text/javascript">--%>
<%--        function addComment() {--%>
<%--            var url = "addCommentAction";--%>
<%--            var data = {--%>
<%--                "aid" : $("#aid").val(),--%>
<%--                "username" : $("#username").val(),--%>
<%--                "contentArea" : $("#contentArea").val()--%>
<%--            };--%>
<%--            var success = function(response) {--%>
<%--                $("#content").append(--%>
<%--                    "<div style='background-color:#CCCCCC; color:#000000 ;margin:5px'>"--%>
<%--                    + response.username + " 于" + response.commentTime--%>
<%--                    + "发表评论:<br>" + response.content + "</div>");--%>
<%--            }--%>
<%--            $.post(url, data, success, "json");--%>
<%--        }--%>
<%--    </script>--%>
<%--</head>--%>
<%--&lt;%&ndash;&lt;%&ndash;%>--%>
<%--&lt;%&ndash;    String announcement = null;&ndash;%&gt;--%>
<%--&lt;%&ndash;    int aid = Integer.parseInt(request.getParameter("aid"));&ndash;%&gt;--%>
<%--&lt;%&ndash;    String sql = "select announcement from announcement WHERE aid=" + aid;&ndash;%&gt;--%>
<%--&lt;%&ndash;    PreparedStatement preparedStatement = JdbcUtils.getConnection().prepareStatement(sql);&ndash;%&gt;--%>
<%--&lt;%&ndash;    ResultSet rs = preparedStatement.executeQuery();&ndash;%&gt;--%>
<%--&lt;%&ndash;    while (rs.next()) {&ndash;%&gt;--%>
<%--&lt;%&ndash;        announcement = rs.getString(1);&ndash;%&gt;--%>
<%--&lt;%&ndash;    }&ndash;%&gt;--%>
<%--&lt;%&ndash;%>&ndash;%&gt;--%>
<%--<body>--%>
<%--<table width="600" border="0" align="center" cellpadding="0"--%>
<%--       cellspacing="0" bgcolor="#D7EDFB">--%>
<%--    <tr>--%>
<%--        <td>&nbsp;</td>--%>
<%--        <td><img src="ggimages/t1.jpg" width="470" height="52"></td>--%>
<%--        <td>&nbsp;</td>--%>
<%--    </tr>--%>
<%--    <tr>--%>
<%--        <td><img src="ggimages/t2.jpg" width="55" height="61"></td>--%>
<%--        <td background="ggimages/t31.jpg"><div align="center">--%>
<%--            <img src="ggimages/t3.jpg" width="470" height="61">--%>
<%--        </div></td>--%>
<%--        <td><img src="ggimages/t4.jpg" width="59" height="61"></td>--%>
<%--    </tr>--%>
<%--    <tr>--%>
<%--        <td background="ggimages/t5.jpg">&nbsp;</td>--%>
<%--        <td height="400">&nbsp;</td>--%>
<%--        <td background="ggimages/t6.jpg">&nbsp;</td>--%>
<%--    </tr>--%>
<%--    <tr>--%>
<%--        <td><img src="ggimages/t7.jpg" width="55" height="61"></td>--%>
<%--        <td background="ggimages/t9.jpg">&nbsp;</td>--%>
<%--        <td><img src="ggimages/t8.jpg" width="59" height="61"></td>--%>
<%--    </tr>--%>
<%--</table>--%>
<%--<div align="center">--%>
<%--    <a href="PersonalAnnouncement.jsp">返回</a>--%>
<%--</div>--%>
<%--<br>--%>
<%--<br> 关于这条公告的评论--%>
<%--<br>--%>
<%--<br>--%>
<%--<div id="content">--%>
<%--&lt;%&ndash;    &lt;%&ndash;%>--%>
<%--&lt;%&ndash;        String sql2 = "select username,content,commentTime from comment where aid=?";&ndash;%&gt;--%>
<%--&lt;%&ndash;        preparedStatement = JdbcUtils.getConnection().prepareStatement(sql2);&ndash;%&gt;--%>
<%--&lt;%&ndash;        preparedStatement.setInt(1, aid);&ndash;%&gt;--%>
<%--&lt;%&ndash;        ResultSet rs2 = preparedStatement.executeQuery();&ndash;%&gt;--%>
<%--&lt;%&ndash;        while (rs2.next()) {&ndash;%&gt;--%>
<%--&lt;%&ndash;            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");&ndash;%&gt;--%>
<%--&lt;%&ndash;            String commentTime = sdf.format(rs2.getTimestamp(3));&ndash;%&gt;--%>
<%--&lt;%&ndash;    %>&ndash;%&gt;--%>
<%--    <div style='background-color: #CCCCCC; color: #000000; margin: 5px'>--%>
<%--        于发表评论:</div>--%>
<%--&lt;%&ndash;    &lt;%&ndash;%>--%>
<%--&lt;%&ndash;        }&ndash;%&gt;--%>
<%--&lt;%&ndash;    %>&ndash;%&gt;--%>
<%--</div>--%>
<%--<br>--%>
<%--<div>发表评论</div>--%>
<%--<br>--%>
<%--<form id="addCommentForm" method="post">--%>
<%--    <table>--%>
<%--        <tr>--%>
<%--            <td colspan="2"><input hidden="hidden" name="aid" id="aid"--%>
<%--                                   value="<%=request.getParameter("aid")%>"></td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td colspan="2"><input hidden="hidden" name="username"--%>
<%--                                   id="username" value="<%=session.getAttribute("adminName")%>"></td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td width="100px"><label>评论内容：</label></td>--%>
<%--            <td><textarea name="contentArea" id="contentArea" rows="10"--%>
<%--                          cols="50"></textarea></td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td align="center" colspan="2"><input type="button" value="提交"--%>
<%--                                                  onclick="addComment()"></td>--%>
<%--        </tr>--%>
<%--    </table>--%>
<%--</form>--%>
<%--</body>--%>
<%--</html>--%>
