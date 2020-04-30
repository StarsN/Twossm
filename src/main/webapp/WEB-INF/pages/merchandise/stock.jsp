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
    <title>库存管理</title>
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
    <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="">导出库存</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUser()">编辑库存</a>
</div>
<table id="dg" title="库存管理" class="easyui-datagrid"
       style="width: 100%; height: 100%"
       data-options="rownumbers:true,singleSelect:true,pagination:true"
       url="<%=basePath%>merchandise/getMerchandiseStock"
       toolbar="#toolbar" idField=""
       rownumbers="true" fitColumns="true"
       singleSelect="false">
    <thead>
    <tr>
        <th field="merchandiseCode" width="100" align="center">商品编号</th>
        <th field="merchantName" width="100" align="center">店铺名称</th>
        <th field="merchandiseName" width="100" align="center">商品名称</th>
        <th field="stock" width="100" align="center">库存</th>
        <th field="price" width="100" align="center">价格</th>
        <th field="status" width="100" align="center">商品状态</th>
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
<div id="dgAdd" class="easyui-dialog" style="width:500px;height:500px;padding:10px 20px"
     closed="true" buttons="#dlg-buttons">
    <div class="ftitle">库存信息</div>
    <form id="fm" enctype="multipart/form-data" method="post">
        <div class="fitem" style="display: none">
            <label>商品编号:</label>
            <input name="merchandiseCode" class="easyui-validatebox">
        </div>
        <div class="fitem">
            <label>商品名称:</label>
            <input name="merchandiseName" class="easyui-validatebox" required="true">
        </div>
        <div class="fitem">
            <label>商品库存:</label>
            <input name="stock" class="easyui-validatebox" required="true">
        </div>
        <div class="fitem">
            <label>零售价（元）:</label>
            <input name="price"  class="easyui-validatebox" required="true">
        </div>
    </form>
</div>

<script>
    //保存库存信息
    function saveUser(){
        $('#fm').form('submit',{
            url: url,
            onSubmit: function(){
                return $(this).form('validate');
            },
            success: function(result){
                var result = eval('('+result+')');
                console.log(result)
                // console.log("result=" + result)
                // if (result.errorMsg){
                //     $.messager.show({
                //         title: 'Error',
                //         msg: result.errorMsg
                //     });
                // } else {
                //     $('#dgAdd').dialog('close');		// close the dialog
                //     $('#dg').datagrid('reload');	// reload the user data
                // }
                if(result.code=="0"){
                    $('#dgAdd').dialog('close');		// close the dialog
                    $('#dg').datagrid('reload');	// reload the user data
                    $.messager.show({
                        title:'Success',
                        msg:result.successMessage
                    })
                }else{
                    $.messager.show({
                        title:'Error',
                        msg:"保存库存出错"
                    })
                }
            }
        });
    }
    //编辑库存信息
    function editUser(){
        var row = $('#dg').datagrid('getSelected');
        if (row){
            $('#dgAdd').dialog('open').dialog('setTitle','编辑库存');
            $('#fm').form('load',row);
            url = '<%=basePath%>merchandise/editMerchandiseStock?merchandiseCode='+row.merchandiseCode + "&&stock=" + row.stock +"&&price=" + row.price;
        }
    }
</script>
</body>
</html>