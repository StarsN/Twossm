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
    <title>优惠券管理</title>
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
    <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newUser()">新增优惠券</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUser()">编辑优惠券</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="">取消领取</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="">恢复可领取</a>
</div>
<table id="dg" title="商品管理" class="easyui-datagrid"
       style="width: 100%; height: 100%"
       data-options="rownumbers:true,singleSelect:true,pagination:true"
       url="<%=basePath%>coupon/getAllCouponInfo"
       toolbar="#toolbar" idField=""
       rownumbers="true" fitColumns="true"
       singleSelect="false">
    <thead>
    <tr>
        <th field="merchantName" width="100" align="center">店铺名称</th>
        <th field="couponName" width="100" align="center">优惠券名称</th>
        <th field="value" width="100" align="center">价值描述</th>
        <th field="numerLimitDesc" width="100" align="center">领取限制描述</th>
        <th field="effectiveTimedesc" width="100" align="center">有效期描述</th>
        <th field="couponNumAndSku" width="100" align="center">库存/总发放量</th>
        <th field="couponInUse" width="100" align="center">已使用张数</th>
        <th field="createTime" width="100" align="center">创建时间</th>
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
    <div class="ftitle">优惠券信息</div>
    <form id="fm" enctype="multipart/form-data" method="post">
        <div class="fitem">
            <label>优惠券名称:</label>
            <input name="couponName" class="easyui-validatebox" required="true">
        </div>
        <div class="fitem">
            <label>发放总量:</label>
            <input name="couponTotalNum" placeholder="" class="easyui-validatebox">
        </div>
        <div class="fitem">
            <label>优惠金额：</label>
            <input name="discountAmount" placeholder="" class="easyui-validatebox">

        </div>
        <div class="fitem">
            <label>满多少元使用：</label>
            <input name="limitAmount" placeholder="" class="easyui-validatebox">

        </div>
        <div class="fitem">
            <label>生效时间:</label>
<%--            <input name="effectiveTime" class="easyui-validatebox" required="true">--%>
            <input  name="effectiveTime" id="dd" type="text" class="easyui-datebox" required="required">
        </div>
        <div class="fitem">
            <label>过期时间:</label>
<%--            <input name="expirationTime" class="easyui-validatebox" required="true">--%>
            <input name="expirationTime" id="dd" type="text" class="easyui-datebox" required="required">
        </div>
        <div class="fitem">
            <label>使用说明:</label>
            <textarea name="instructions" class="easyui-validatebox" required="true"></textarea>
        </div>
    </form>
</div>

<script>
    // 去到新增商品对话框
    function newUser(){
        console.log("新增优惠券")
        $('#dgAdd').dialog('open').dialog('setTitle','新增优惠券');
        $('#fm').form('clear');
        url = '<%=basePath%>coupon/ajaxAdd';
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
                        msg:"保存优惠券出错"
                    })
                }
            }
        });
    }
    //编辑商品信息
    function editUser(){
        var row = $('#dg').datagrid('getSelected');
        if(row.status == "0" || row.status == "2"){
            if (row){
                $('#dgAdd').dialog('open').dialog('setTitle','编辑商品');
                $('#fm').form('load',row);
                url = '<%=basePath%>merchandise/editMerchandiseInfo?merchandiseCode='+row.merchandiseCode;
            }
        }else{
            $.messager.show({
                title:"Error",
                msg:"商品并非草稿状态和下架状态不能进行编辑！"
            })
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