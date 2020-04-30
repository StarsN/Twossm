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
    <title>白名单管理</title>
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
    <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newUser()">新增白名单</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUser()">编辑白名单</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyUser()">删除白名单</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="">查看白名单（未）</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="">导出白名单（未）</a>
</div>
<table id="dg" title="白名单管理" class="easyui-datagrid"
       style="width: 100%; height: 100%"
       data-options="rownumbers:true,singleSelect:true,pagination:true"
       url="<%=basePath%>whiteList/getAllWhiteListInfo"
       toolbar="#toolbar" idField=""
       rownumbers="true" fitColumns="true"
       singleSelect="false">
    <thead>
    <tr>
        <th field="whiteListName" width="100" align="center">白名单名称</th>
        <th field="merchantName" width="100" align="center">店铺名称</th>
        <th field="whiteListDesc" width="100" align="center">白名单描述</th>
        <th field="memberNum" width="100" align="center">用户数</th>
        <th field="createTime" width="100" align="center">创建时间</th>
        <th field="updateTime" width="100" align="center">更新时间</th>
        <th field="whiteListTips" width="100" align="center">不符合白名单返回提示语</th>
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
<div id="dgAdd" class="easyui-dialog" style="width:420px;height:500px;padding:10px 20px"
     closed="true" buttons="#dlg-buttons">
    <div class="ftitle">白名单信息</div>
    <form id="fm" enctype="multipart/form-data" method="post">
        <div class="fitem">
            <label>白名单名称:</label>
            <input name="whiteListName" class="easyui-validatebox" required="true">
        </div>
        <div class="fitem">
            <label>描述:</label>
            <input name="whiteListDesc" class="easyui-validatebox">
        </div>
        <div class="fitem">
            <label>绑定商品:</label>
            <select id="merchandiseNames" class="easyui-combobox" name="merchandiseCode" multiple style="width:200px;">
            </select>
        </div>
        <div class="fitem">
            <label>下载文件模板:</label>
            <a id="downLoad" href="<%=basePath%>whiteList/downModelCsv" class="easyui-linkbutton" data-options="iconCls:'icon-search'">downLoad</a>
        </div>
        <div class="fitem">
            <label>上传文件:</label>
            <input class="easyui-filebox" style="" data-options='' id="file_upload" name="file_upload2"/><br/>
        </div>
        <div class="fitem">
            <label>失败的提示语:</label>
            <textarea name="whiteListTips" class="easyui-validatebox" required="true"></textarea>
        </div>
    </form>
</div>

<script>
    $(function () {
        $('#downLoad').bind('click', function(){
        });
    })
    function getMerchandiseList() {
        $('#merchandiseNames').combobox({
            url:'<%=basePath%>merchandise/getAllMerchandise',
            valueField:'merchandiseCode',
            textField:'merchandiseName'
        });
    }
    // 去到新增商品对话框
    function newUser(){
        console.log("新增白名单")
        $('#dgAdd').dialog('open').dialog('setTitle','新增商品');
        getMerchandiseList();
        $('#fm').form('clear');
        url = '<%=basePath%>whiteList/ajaxAdd';
    }
    //保存商品信息
    function saveUser(){
        $('#fm').form('submit',{
            url: url,
            onSubmit: function(){
                return $(this).form('validate');
            },
            success: function(result){
                var result = eval('('+result+')');
                console.log(result)
                if(result.code=="0"){
                    $('#dgAdd').dialog('close');		// close the dialog
                    $('#dg').datagrid('reload');	// reload the user data
                    $.messager.show({
                        title:'Success',
                        msg:"保存白名单成功"
                    })
                }else{
                    $.messager.show({
                        title:'Error',
                        msg:"保存商品出错"
                    })
                }
            }
        });
    }
    //编辑商品信息
    function editUser(){
        var row = $('#dg').datagrid('getSelected');
        if (row){
            $('#dgAdd').dialog('open').dialog('setTitle','编辑商品');
            $('#fm').form('load',row);
            url = '<%=basePath%>merchandise/editMerchandiseInfo?merchandiseCode='+row.merchandiseCode;
        }
    }
    //删除商品信息
    function destroyUser(){
        var row = $('#dg').datagrid('getSelected');
        if (row){
            $.messager.confirm('警告','你确认要删除这条商品信息吗?',function(r){
                if (r){
                    $.post('<%=basePath%>merchandise/deleteMerchandiseInfo',{merchandiseCode:row.merchandiseCode},function(result){
                        $('#dg').datagrid('reload');
                        // console.log("code=" + result.code)
                        // if (result.code=="003"){
                        //     // $.messager.show({
                        //     //     title:'Success',
                        //     //     msg:result.successMessage
                        //     // })
                        //     $('#dg').datagrid('reload');	// reload the user data
                        // } else {
                        //     $.messager.show({	// show error message
                        //         title: 'Error',
                        //         msg: "商品删除失败"
                        //     });
                        // }
                    },'json');
                }
            });
        }
    }
    <%--$(document).ready(function () {--%>
    <%--   fLoadTable();--%>
    <%--   show();--%>
    <%--});--%>
    <%--function show(){--%>
    <%--    $.ajax({--%>
    <%--        url:"<%=basePath%>merchandise/getAllMerchandiseInfo",--%>
    <%--        type:"get",--%>
    <%--        dataType:"json",--%>
    <%--        success:function (data) {--%>
    <%--            console.log(data)--%>
    <%--            $('#dg').datagrid('loadData',data);--%>
    <%--        },--%>
    <%--        error:function(xhr){--%>
    <%--            console.log("查询错误")--%>
    <%--        }--%>
    <%--    })--%>
    <%--};--%>
    <%--function  fLoadTable() {--%>
    <%--    $('#dg').datagrid({--%>
    <%--        title:'商品列表',--%>
    <%--        width:700,--%>
    <%--        height:300,--%>
    <%--        fitColumns:true,--%>

    <%--        columns:[[{--%>
    <%--            field:'merchandiseCode',--%>
    <%--            width:'100',--%>
    <%--            title:'商品编码',--%>
    <%--            checkbox:true--%>
    <%--        },{--%>
    <%--            field:'merchandiseName',--%>
    <%--            width:'100',--%>
    <%--            title:'商品名称',--%>
    <%--            align:'center'--%>
    <%--        },{--%>
    <%--            field:'merchantCode',--%>
    <%--            width:'100',--%>
    <%--            title:'商家编码',--%>
    <%--            align:'center'--%>
    <%--        },{--%>
    <%--            field:'salePrice',--%>
    <%--            width:'100',--%>
    <%--            title:'销售价格',--%>
    <%--            align:'center'--%>
    <%--        },{--%>
    <%--            field:'shortDesc',--%>
    <%--            width:'100',--%>
    <%--            title:'商品描述',--%>
    <%--            align:'center'--%>
    <%--        }--%>
    <%--        ]],--%>
    <%--        idField:'merchandiseCode',--%>
    <%--        loadMsg:'Loading,please waite...',--%>
    <%--        pagination:true--%>
    <%--    })--%>
    <%--}--%>
</script>
</body>
</html>