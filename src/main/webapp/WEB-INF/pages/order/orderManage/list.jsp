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
    <title>订单管理</title>
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
    <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newUser()">查询</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUser()">批量导出</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyUser()">发货</a>
</div>
<table id="dg" title="订单管理" class="easyui-datagrid"
       style="width: 100%; height: 100%"
       data-options="rownumbers:true,singleSelect:true,pagination:true"
       url="<%=basePath%>order/getAllOrderInfo"
       toolbar="#toolbar" idField=""
       rownumbers="true" fitColumns="true"
       singleSelect="false">
    <thead>
    <tr>
        <th field="orderId" width="100" align="center">订单编号</th>
        <th field="province" width="100" align="center">省份名称</th>
        <th field="merchantName" width="100" align="center">所属店铺</th>
        <th field="merchandiseName" width="100" align="center">商品名称</th>
        <th field="buyNum" width="100" align="center">购买数量</th>
        <th field="subtotal" width="100" align="center">订单项金额</th>
        <th field="totalAmount" width="100" align="center">订单项总金额</th>
        <th field="phoneNumber" width="100" align="center">买家手机号</th>
        <th field="inceptPeople" width="100" align="center">收货人</th>
        <th field="inceptTel" width="100" align="center">收货人电话</th>
        <th field="generateTime" width="100" align="center">下单时间</th>
        <th field="payTime" width="100" align="center">支付时间</th>
        <th field="orderStatus" width="100" align="center">订单状态</th>
        <th field="payStatus" width="100" align="center">支付状态</th>
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
    <div class="ftitle">商品信息</div>
    <form id="fm" enctype="multipart/form-data" method="post">
        <div class="fitem">
            <label>商品名称:</label>
            <input name="merchandiseName" class="easyui-validatebox" required="true">
        </div>
        <div class="fitem">
            <label>商品分类:</label>
            <input name="" placeholder="手机" class="easyui-validatebox">
        </div>
        <div class="fitem">
            <label>商品品牌:</label>
            <input name="brandId" placeholder="华为" class="easyui-validatebox">
        </div>
        <div class="fitem">
            <label>商品型号:</label>
            <input name="modelId" class="easyui-validatebox" required="true">
        </div>
        <div class="fitem">
            <label>商品销售价格（元）:</label>
            <input name="salePrice" class="easyui-validatebox" required="true">
        </div>
        <div class="fitem">
            <label>商品描述:</label>
            <input name="shortDesc" class="easyui-validatebox" required="true">
        </div>
        <div class="fitem">
            <label>总库存:</label>
            <input name="totalStock" placeholder="100" class="easyui-validatebox">
        </div>
        <div class="fitem">
            <label>商品详细描述:</label>
            <textarea name="detailDesc" class="easyui-validatebox" required="true"></textarea>
        </div>
        <div class="fitem">
            <label>商品图片:</label>
            <%--            <input name="" placeholder="图片路径" class="easyui-validatebox">--%>
            <%--            <%=basePath%>merchandise/uploadFile--%>
            <%--            <form id="upload_form" enctype="multipart/form-data" action="" method="post">--%>
            <input class="easyui-filebox" style="width:300px" data-options='onChange:change_photo' id="file_upload" name="file_upload2"/><br/>
            <%--                <input type="submit" value="上传"/> <br/>--%>
            <%--            </form>--%>
            <div id="Imgdiv">
                <img id="Img" width="200px" height="200px"/>
            </div>
        </div>
    </form>
</div>

<script>
    // function uploadFile(){
    //     $("#upload_form").form('submit',{
    //         url: url,
    //         success: function(result){
    //         }
    //     });
    // }

    // 去到新增商品对话框
    function newUser(){
        console.log("新增商品")
        $('#dgAdd').dialog('open').dialog('setTitle','新增商品');
        $('#fm').form('clear');
        url = '<%=basePath%>merchandise/addMerchandiseInfo';
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
    function change_photo() {
        console.log($("input[name='file_upload2']")[0]);
        PreviewImage($("input[name='file_upload2']")[0], 'Img', 'Imgdiv');
    }
    function PreviewImage(fileObj,imgPreviewId,divPreviewId){
        var allowExtention=".jpg,.bmp,.gif,.png";//允许上传文件的后缀名document.getElementById("hfAllowPicSuffix").value;
        var extention=fileObj.value.substring(fileObj.value.lastIndexOf(".")+1).toLowerCase();
        var browserVersion= window.navigator.userAgent.toUpperCase();
        if(allowExtention.indexOf(extention)>-1){
            if(fileObj.files){//HTML5实现预览，兼容chrome、火狐7+等
                if(window.FileReader){
                    var reader = new FileReader();
                    reader.onload = function(e){
                        document.getElementById(imgPreviewId).setAttribute("src",e.target.result);
                    }
                    reader.readAsDataURL(fileObj.files[0]);
                }else if(browserVersion.indexOf("SAFARI")>-1){
                    alert("不支持Safari6.0以下浏览器的图片预览!");
                }
            }else if (browserVersion.indexOf("MSIE")>-1){
                if(browserVersion.indexOf("MSIE 6")>-1){//ie6
                    document.getElementById(imgPreviewId).setAttribute("src",fileObj.value);
                }else{//ie[7-9]
                    fileObj.select();
                    if(browserVersion.indexOf("MSIE 9")>-1)
                        fileObj.blur();//不加上document.selection.createRange().text在ie9会拒绝访问
                    var newPreview =document.getElementById(divPreviewId+"New");
                    if(newPreview==null){
                        newPreview =document.createElement("div");
                        newPreview.setAttribute("id",divPreviewId+"New");
                        newPreview.style.width = document.getElementById(imgPreviewId).width+"px";
                        newPreview.style.height = document.getElementById(imgPreviewId).height+"px";
                        newPreview.style.border="solid 1px #d2e2e2";
                    }
                    newPreview.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='scale',src='" + document.selection.createRange().text + "')";
                    var tempDivPreview=document.getElementById(divPreviewId);
                    tempDivPreview.parentNode.insertBefore(newPreview,tempDivPreview);
                    tempDivPreview.style.display="none";
                }
            }else if(browserVersion.indexOf("FIREFOX")>-1){//firefox
                var firefoxVersion= parseFloat(browserVersion.toLowerCase().match(/firefox\/([\d.]+)/)[1]);
                if(firefoxVersion<7){//firefox7以下版本
                    document.getElementById(imgPreviewId).setAttribute("src",fileObj.files[0].getAsDataURL());
                }else{//firefox7.0+
                    document.getElementById(imgPreviewId).setAttribute("src",window.URL.createObjectURL(fileObj.files[0]));
                }
            }else{
                document.getElementById(imgPreviewId).setAttribute("src",fileObj.value);
            }
        }else{
            alert("仅支持"+allowExtention+"为后缀名的文件!");
            fileObj.value="";//清空选中文件
            if(browserVersion.indexOf("MSIE")>-1){
                fileObj.select();
                document.selection.clear();
            }
            fileObj.outerHTML=fileObj.outerHTML;
        }
    }
    //发布商品
    function publishMerchandise() {
        var row = $('#dg').datagrid('getSelected');
        if (row){
            $.messager.confirm('提示','你确认要发布商品信息吗?',function(r){
                if (r){
                    $.post('<%=basePath%>merchandise/publish',{merchandiseCode:row.merchandiseCode},function(result){
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