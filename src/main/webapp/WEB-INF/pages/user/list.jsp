 <%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title>用户管理</title>
    <script src="<%=basePath%>eui/jquery.min.js"></script>
    <script src="<%=basePath%>eui/jquery.easyui.min.js"></script>
    <script src="<%=basePath%>eui/easyui-lang-zh_CN.js"></script>
    <link rel="stylesheet" href="<%=basePath%>eui/themes/icon.css">
    <link rel="stylesheet" href="<%=basePath%>eui/themes/default/easyui.css">
</head>
<style type="text/css">
    #fm {
        margin: 0;
        padding: 10px 30px;
    }

    .ftitle {
        font-size: 14px;
        font-weight: bold;
        padding: 5px 0;
        margin-bottom: 10px;
        border-bottom: 1px solid #ccc;
    }

    .fitem {
        margin-bottom: 5px;
    }

    .fitem label {
        display: inline-block;
        width: 80px;
    }

    .fitem input {
        width: 160px;
    }
</style>
<body>
<div id="toolbar">
    <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newUser()">新增用户</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUser()">编辑用户</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyUser()">删除用户</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyUser()">禁用用户（未）</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyUser()">修改密码（未）</a>
</div>
<table id="dg" title="用户管理" class="easyui-datagrid"
       style="width: 100%; height: 100%"
       data-options="rownumbers:true,singleSelect:true,pagination:true"
       url="<%=basePath%>user/getAllInfo"
       toolbar="#toolbar" idField=""
       rownumbers="true" fitColumns="true"
       singleSelect="false">
    <thead>
    <tr>
        <th hidden field="userId" width="100" align="center">登录ID</th>
        <th field="personName" width="100" align="center">人员名称</th>
        <th field="userName" width="100" align="center">登录账号</th>
    </tr>
    </thead>
</table>
<div id="dlg" class="easyui-dialog"
     style="width: 400px; height: 280px; padding: 10px 20px" closed="true">
</div>

<%--新增--%>
<div id="dlg-buttons">
    <a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveUser()">保存</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dgAdd').dialog('close')">取消</a>
</div>
<div id="dgAdd" class="easyui-dialog" style="width:400px;height:500px;padding:10px 20px"
     closed="true" buttons="#dlg-buttons">
    <div class="ftitle">用户信息</div>
    <form id="fm" method="post">
        <div class="fitem">
            <label>人员名称:</label>
            <input name="personName" class="easyui-validatebox" required="true">
        </div>
        <div class="fitem">
            <label>登录账号:</label>
            <input name="userName" class="easyui-validatebox" required="true">
        </div>
        <div class="fitem">
            <label>登录密码:</label>
            <input name="password" class="easyui-validatebox" required="true">
        </div>
        <div class="fitem">
            <label>确认密码:</label>
            <input name="password2" class="easyui-validatebox" required="true">
        </div>
        <div class="fitem">
            <label>年龄:</label>
            <input name="age" class="easyui-validatebox" required="true">
        </div>
        <div class="fitem">
            <label>性别:</label>
            <select id="sex" class="easyui-combobox" name="sex" style="width:200px;">
                <option value="男">男</option>
                <option value="女">女</option>
            </select>
        </div>
        <div class="fitem">
            <label>店铺名称（未完成）:</label>
            <select id="merchant" class="easyui-combobox" name="merchant" multiple style="width:200px;">
                <option value="M049">终端公司1</option>
                <option value="M050">终端公司2</option>
            </select>
        </div>
        <div class="fitem">
            <label>省份（未完成）:</label>
            <select id="province" class="easyui-combobox" name="province" style="width:200px;">
                <option value="广东">广东</option>
                <option value="广西">广西</option>
            </select>
        </div>
        <div class="fitem">
            <label>角色（未完成）:</label>
            <select id="role" class="easyui-combobox" name="role" style="width:200px;">
                <option value="角色1">角色1</option>
                <option value="角色2">角色2</option>
            </select>
        </div>
    </form>
</div>

<script>
    // 去到新增用户对话框
    function newUser(){
        console.log("新增用户")
        $('#dgAdd').dialog('open').dialog('setTitle','新增用户');
        $('#fm').form('clear');
        url = '<%=basePath%>user/addUserInfo';
    }
    //保存用户信息
    function saveUser(){
        $('#fm').form('submit',{
            url: url,
            onSubmit: function(){
                return $(this).form('validate');
            },
            success: function(result){
                var result = eval('('+result+')');
                console.log(result)
                if(result.code=="001"){
                    $('#dgAdd').dialog('close');		// close the dialog
                    $('#dg').datagrid('reload');	// reload the user data
                    $.messager.show({
                        title:'Success',
                        msg:result.successMessage
                    })
                }else if(result.code=="002"){
                    $('#dgAdd').dialog('close');		// close the dialog
                    $('#dg').datagrid('reload');	// reload the user data
                    $.messager.show({
                        title:'Success',
                        msg:result.successMessage
                    })
                } else{
                    $.messager.show({
                        title:'Error',
                        msg:"保存用户出错"
                    })
                }
            }
        });
    }
    //编辑用户信息
    function editUser(){
        var row = $('#dg').datagrid('getSelected');
        $("#password").hide();
        if (row){
            $('#dgAdd').dialog('open').dialog('setTitle','编辑用户');
            $('#fm').form('load',row);
            var userId = row.userId;
            console.log("userId=" + userId)
            url = '<%=basePath%>user/editUserInfo?userId='+userId;
        }
    }
    //删除用户信息
    function destroyUser(){
        var row = $('#dg').datagrid('getSelected');
        if (row){
            $.messager.confirm('警告','你确认要删除这条用户信息吗?',function(r){
                if (r){
                    $.post('<%=basePath%>user/deleteUserInfo',{userId:row.userId},function(result){
                        $('#dg').datagrid('reload');
                    },'json');
                }
            });
        }
    }
</script>
</body>
</html>