<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.gx.merchant.domain.TbMerchantPO" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    //从session获取店铺信息
    TbMerchantPO tbMerchantPO = (TbMerchantPO) request.getSession().getAttribute("tbMerchantPO");
    System.out.print("在店铺详情页面商家信息=" + tbMerchantPO);
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title>商家管理</title>
    <script src="<%=basePath%>eui/jquery.min.js"></script>
    <script src="<%=basePath%>eui/jquery.easyui.min.js"></script>
    <script src="<%=basePath%>eui/easyui-lang-zh_CN.js"></script>
    <link rel="stylesheet" href="<%=basePath%>eui/themes/icon.css">
    <link rel="stylesheet" href="<%=basePath%>eui/themes/default/easyui.css">
    <link rel="stylesheet" href="<%=basePath%>css/base.css">
    <link rel="stylesheet" href="<%=basePath%>css/main.css">
    <link rel="stylesheet" href="<%=basePath%>css/common.css">
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
<%--<div id="toolbar">--%>
<%--    <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newUser()">新增商家</a>--%>
<%--    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUser()">编辑商家</a>--%>
<%--    <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyUser()">删除商家</a>--%>
<%--</div>--%>
<%--<table id="dg" title="商家管理" class="easyui-datagrid"--%>
<%--       style="width: 100%; height: 100%"--%>
<%--       data-options="rownumbers:true,singleSelect:true,pagination:true"--%>
<%--       url="<%=basePath%>merchant/getAllMerchantInfo"--%>
<%--       toolbar="#toolbar" idField=""--%>
<%--       rownumbers="true" fitColumns="true"--%>
<%--       singleSelect="false">--%>
<%--    <thead>--%>
<%--    <tr>--%>
<%--        <th field="merchantCode" width="100" align="center">商家编号</th>--%>
<%--        <th field="merchantName" width="100" align="center">商家名称</th>--%>
<%--        <th field="contactPerson" width="100" align="center">联系人</th>--%>
<%--        <th field="contactPhone" width="100" align="center">联系人电话</th>--%>
<%--        <th field="contactQQ" width="100" align="center">联系人QQ</th>--%>
<%--        <th field="createTime" width="100" align="center">创建时间</th>--%>
<%--        <th field="lastUpdateTime" width="100" align="center">最后修改时间</th>--%>
<%--    </tr>--%>
<%--    </thead>--%>
<%--</table>--%>
<%--<div id="dlg" class="easyui-dialog"--%>
<%--     style="width: 400px; height: 280px; padding: 10px 20px" closed="true">--%>
<%--</div>--%>
<%--新增--%>
<%--<div id="dlg-buttons">--%>
<%--    <a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveUser()">保存</a>--%>
<%--    <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dgAdd').dialog('close')">取消</a>--%>
<%--</div>--%>
<%--<div id="dgAdd" class="easyui-dialog" style="width:100%;height:100%"--%>
<%--     closed="true" buttons="#dlg-buttons">--%>
<%--    <div class="ftitle">店铺信息</div>--%>
<%--    <form id="fm" enctype="multipart/form-data" method="post">--%>
<%--        <div class="fitem">--%>
<%--            <label>店铺编号:</label>--%>
<%--            <input name="merchandiseName" class="easyui-validatebox" required="true">--%>
<%--        </div>--%>
<%--        <div class="fitem">--%>
<%--            <label>商店名称:</label>--%>
<%--            <input name="" placeholder="手机" class="easyui-validatebox">--%>
<%--        </div>--%>
<%--        <div class="fitem">--%>
<%--            <label>商品品牌:</label>--%>
<%--            <input name="brandId" placeholder="华为" class="easyui-validatebox">--%>
<%--        </div>--%>
<%--        <div class="fitem">--%>
<%--            <label>商品型号:</label>--%>
<%--            <input name="modelId" class="easyui-validatebox" required="true">--%>
<%--        </div>--%>
<%--        <div class="fitem">--%>
<%--            <label>商品销售价格（元）:</label>--%>
<%--            <input name="salePrice" class="easyui-validatebox" required="true">--%>
<%--        </div>--%>
<%--        <div class="fitem">--%>
<%--            <label>商品描述:</label>--%>
<%--            <input name="shortDesc" class="easyui-validatebox" required="true">--%>
<%--        </div>--%>
<%--        <div class="fitem">--%>
<%--            <label>总库存:</label>--%>
<%--            <input name="totalStock" placeholder="100" class="easyui-validatebox">--%>
<%--        </div>--%>
<%--        <div class="fitem">--%>
<%--            <label>商品详细描述:</label>--%>
<%--            <textarea name="detailDesc" class="easyui-validatebox" required="true"></textarea>--%>
<%--        </div>--%>
<%--        <div class="fitem">--%>
<%--            <label>商品图片:</label>--%>
<%--            &lt;%&ndash;            <input name="" placeholder="图片路径" class="easyui-validatebox">&ndash;%&gt;--%>
<%--            &lt;%&ndash;            <%=basePath%>merchandise/uploadFile&ndash;%&gt;--%>
<%--            &lt;%&ndash;            <form id="upload_form" enctype="multipart/form-data" action="" method="post">&ndash;%&gt;--%>
<%--            <input class="easyui-filebox" style="width:300px" data-options='onChange:change_photo' id="file_upload" name="file_upload2"/><br/>--%>
<%--            &lt;%&ndash;                <input type="submit" value="上传"/> <br/>&ndash;%&gt;--%>
<%--            &lt;%&ndash;            </form>&ndash;%&gt;--%>
<%--            <div id="Imgdiv">--%>
<%--                <img id="Img" width="200px" height="200px"/>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </form>--%>
<%--</div>--%>

<%--<script>--%>
<%--    // function uploadFile(){--%>
<%--    //     $("#upload_form").form('submit',{--%>
<%--    //         url: url,--%>
<%--    //         success: function(result){--%>
<%--    //         }--%>
<%--    //     });--%>
<%--    // }--%>

<%--    // 去到新增商品对话框--%>
<%--    function newUser(){--%>
<%--        console.log("新增商品")--%>
<%--        $('#dgAdd').dialog('open').dialog('setTitle','新增商品');--%>
<%--        $('#fm').form('clear');--%>
<%--        url = '<%=basePath%>merchandise/addMerchandiseInfo';--%>
<%--    }--%>
<%--    //保存商品信息--%>
<%--    function saveUser(){--%>
<%--        $('#fm').form('submit',{--%>
<%--            url: url,--%>
<%--            onSubmit: function(){--%>
<%--                return $(this).form('validate');--%>
<%--            },--%>
<%--            success: function(result){--%>
<%--                var result = eval('('+result+')');--%>
<%--                console.log(result)--%>
<%--                // console.log("result=" + result)--%>
<%--                // if (result.errorMsg){--%>
<%--                //     $.messager.show({--%>
<%--                //         title: 'Error',--%>
<%--                //         msg: result.errorMsg--%>
<%--                //     });--%>
<%--                // } else {--%>
<%--                //     $('#dgAdd').dialog('close');		// close the dialog--%>
<%--                //     $('#dg').datagrid('reload');	// reload the user data--%>
<%--                // }--%>
<%--                if(result.code=="001"){--%>
<%--                    $('#dgAdd').dialog('close');		// close the dialog--%>
<%--                    $('#dg').datagrid('reload');	// reload the user data--%>
<%--                    $.messager.show({--%>
<%--                        title:'Success',--%>
<%--                        msg:result.successMessage--%>
<%--                    })--%>
<%--                }else if(result.code=="002"){--%>
<%--                    $('#dgAdd').dialog('close');		// close the dialog--%>
<%--                    $('#dg').datagrid('reload');	// reload the user data--%>
<%--                    $.messager.show({--%>
<%--                        title:'Success',--%>
<%--                        msg:result.successMessage--%>
<%--                    })--%>
<%--                } else{--%>
<%--                    $.messager.show({--%>
<%--                        title:'Error',--%>
<%--                        msg:"保存商品出错"--%>
<%--                    })--%>
<%--                }--%>
<%--            }--%>
<%--        });--%>
<%--    }--%>
<%--    //编辑商品信息--%>
<%--    function editUser(){--%>
<%--        var row = $('#dg').datagrid('getSelected');--%>
<%--        if (row){--%>
<%--            $('#dgAdd').dialog('open').dialog('setTitle','编辑商品');--%>
<%--            $('#fm').form('load',row);--%>
<%--            url = '<%=basePath%>merchandise/editMerchandiseInfo?merchandiseCode='+row.merchandiseCode;--%>
<%--        }--%>
<%--    }--%>
<%--    //删除商品信息--%>
<%--    function destroyUser(){--%>
<%--        var row = $('#dg').datagrid('getSelected');--%>
<%--        if (row){--%>
<%--            $.messager.confirm('警告','你确认要删除这条商品信息吗?',function(r){--%>
<%--                if (r){--%>
<%--                    $.post('<%=basePath%>merchandise/deleteMerchandiseInfo',{merchandiseCode:row.merchandiseCode},function(result){--%>
<%--                        $('#dg').datagrid('reload');--%>
<%--                        // console.log("code=" + result.code)--%>
<%--                        // if (result.code=="003"){--%>
<%--                        //     // $.messager.show({--%>
<%--                        //     //     title:'Success',--%>
<%--                        //     //     msg:result.successMessage--%>
<%--                        //     // })--%>
<%--                        //     $('#dg').datagrid('reload');	// reload the user data--%>
<%--                        // } else {--%>
<%--                        //     $.messager.show({	// show error message--%>
<%--                        //         title: 'Error',--%>
<%--                        //         msg: "商品删除失败"--%>
<%--                        //     });--%>
<%--                        // }--%>
<%--                    },'json');--%>
<%--                }--%>
<%--            });--%>
<%--        }--%>
<%--    }--%>
<%--    function change_photo() {--%>
<%--        console.log($("input[name='file_upload2']")[0]);--%>
<%--        PreviewImage($("input[name='file_upload2']")[0], 'Img', 'Imgdiv');--%>
<%--    }--%>
<%--    function PreviewImage(fileObj,imgPreviewId,divPreviewId){--%>
<%--        var allowExtention=".jpg,.bmp,.gif,.png";//允许上传文件的后缀名document.getElementById("hfAllowPicSuffix").value;--%>
<%--        var extention=fileObj.value.substring(fileObj.value.lastIndexOf(".")+1).toLowerCase();--%>
<%--        var browserVersion= window.navigator.userAgent.toUpperCase();--%>
<%--        if(allowExtention.indexOf(extention)>-1){--%>
<%--            if(fileObj.files){//HTML5实现预览，兼容chrome、火狐7+等--%>
<%--                if(window.FileReader){--%>
<%--                    var reader = new FileReader();--%>
<%--                    reader.onload = function(e){--%>
<%--                        document.getElementById(imgPreviewId).setAttribute("src",e.target.result);--%>
<%--                    }--%>
<%--                    reader.readAsDataURL(fileObj.files[0]);--%>
<%--                }else if(browserVersion.indexOf("SAFARI")>-1){--%>
<%--                    alert("不支持Safari6.0以下浏览器的图片预览!");--%>
<%--                }--%>
<%--            }else if (browserVersion.indexOf("MSIE")>-1){--%>
<%--                if(browserVersion.indexOf("MSIE 6")>-1){//ie6--%>
<%--                    document.getElementById(imgPreviewId).setAttribute("src",fileObj.value);--%>
<%--                }else{//ie[7-9]--%>
<%--                    fileObj.select();--%>
<%--                    if(browserVersion.indexOf("MSIE 9")>-1)--%>
<%--                        fileObj.blur();//不加上document.selection.createRange().text在ie9会拒绝访问--%>
<%--                    var newPreview =document.getElementById(divPreviewId+"New");--%>
<%--                    if(newPreview==null){--%>
<%--                        newPreview =document.createElement("div");--%>
<%--                        newPreview.setAttribute("id",divPreviewId+"New");--%>
<%--                        newPreview.style.width = document.getElementById(imgPreviewId).width+"px";--%>
<%--                        newPreview.style.height = document.getElementById(imgPreviewId).height+"px";--%>
<%--                        newPreview.style.border="solid 1px #d2e2e2";--%>
<%--                    }--%>
<%--                    newPreview.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='scale',src='" + document.selection.createRange().text + "')";--%>
<%--                    var tempDivPreview=document.getElementById(divPreviewId);--%>
<%--                    tempDivPreview.parentNode.insertBefore(newPreview,tempDivPreview);--%>
<%--                    tempDivPreview.style.display="none";--%>
<%--                }--%>
<%--            }else if(browserVersion.indexOf("FIREFOX")>-1){//firefox--%>
<%--                var firefoxVersion= parseFloat(browserVersion.toLowerCase().match(/firefox\/([\d.]+)/)[1]);--%>
<%--                if(firefoxVersion<7){//firefox7以下版本--%>
<%--                    document.getElementById(imgPreviewId).setAttribute("src",fileObj.files[0].getAsDataURL());--%>
<%--                }else{//firefox7.0+--%>
<%--                    document.getElementById(imgPreviewId).setAttribute("src",window.URL.createObjectURL(fileObj.files[0]));--%>
<%--                }--%>
<%--            }else{--%>
<%--                document.getElementById(imgPreviewId).setAttribute("src",fileObj.value);--%>
<%--            }--%>
<%--        }else{--%>
<%--            alert("仅支持"+allowExtention+"为后缀名的文件!");--%>
<%--            fileObj.value="";//清空选中文件--%>
<%--            if(browserVersion.indexOf("MSIE")>-1){--%>
<%--                fileObj.select();--%>
<%--                document.selection.clear();--%>
<%--            }--%>
<%--            fileObj.outerHTML=fileObj.outerHTML;--%>
<%--        }--%>
<%--    }--%>
<%--    //发布商品--%>
<%--    function publishMerchandise() {--%>
<%--        var row = $('#dg').datagrid('getSelected');--%>
<%--        if (row){--%>
<%--            $.messager.confirm('提示','你确认要发布商品信息吗?',function(r){--%>
<%--                if (r){--%>
<%--                    $.post('<%=basePath%>merchandise/publish',{merchandiseCode:row.merchandiseCode},function(result){--%>
<%--                        $('#dg').datagrid('reload');--%>
<%--                        // console.log("code=" + result.code)--%>
<%--                        // if (result.code=="003"){--%>
<%--                        //     // $.messager.show({--%>
<%--                        //     //     title:'Success',--%>
<%--                        //     //     msg:result.successMessage--%>
<%--                        //     // })--%>
<%--                        //     $('#dg').datagrid('reload');	// reload the user data--%>
<%--                        // } else {--%>
<%--                        //     $.messager.show({	// show error message--%>
<%--                        //         title: 'Error',--%>
<%--                        //         msg: "商品删除失败"--%>
<%--                        //     });--%>
<%--                        // }--%>
<%--                    },'json');--%>
<%--                }--%>
<%--            });--%>
<%--        }--%>
<%--    }--%>
<%--    &lt;%&ndash;$(document).ready(function () {&ndash;%&gt;--%>
<%--    &lt;%&ndash;   fLoadTable();&ndash;%&gt;--%>
<%--    &lt;%&ndash;   show();&ndash;%&gt;--%>
<%--    &lt;%&ndash;});&ndash;%&gt;--%>
<%--    &lt;%&ndash;function show(){&ndash;%&gt;--%>
<%--    &lt;%&ndash;    $.ajax({&ndash;%&gt;--%>
<%--    &lt;%&ndash;        url:"<%=basePath%>merchandise/getAllMerchandiseInfo",&ndash;%&gt;--%>
<%--    &lt;%&ndash;        type:"get",&ndash;%&gt;--%>
<%--    &lt;%&ndash;        dataType:"json",&ndash;%&gt;--%>
<%--    &lt;%&ndash;        success:function (data) {&ndash;%&gt;--%>
<%--    &lt;%&ndash;            console.log(data)&ndash;%&gt;--%>
<%--    &lt;%&ndash;            $('#dg').datagrid('loadData',data);&ndash;%&gt;--%>
<%--    &lt;%&ndash;        },&ndash;%&gt;--%>
<%--    &lt;%&ndash;        error:function(xhr){&ndash;%&gt;--%>
<%--    &lt;%&ndash;            console.log("查询错误")&ndash;%&gt;--%>
<%--    &lt;%&ndash;        }&ndash;%&gt;--%>
<%--    &lt;%&ndash;    })&ndash;%&gt;--%>
<%--    &lt;%&ndash;};&ndash;%&gt;--%>
<%--    &lt;%&ndash;function  fLoadTable() {&ndash;%&gt;--%>
<%--    &lt;%&ndash;    $('#dg').datagrid({&ndash;%&gt;--%>
<%--    &lt;%&ndash;        title:'商品列表',&ndash;%&gt;--%>
<%--    &lt;%&ndash;        width:700,&ndash;%&gt;--%>
<%--    &lt;%&ndash;        height:300,&ndash;%&gt;--%>
<%--    &lt;%&ndash;        fitColumns:true,&ndash;%&gt;--%>

<%--    &lt;%&ndash;        columns:[[{&ndash;%&gt;--%>
<%--    &lt;%&ndash;            field:'merchandiseCode',&ndash;%&gt;--%>
<%--    &lt;%&ndash;            width:'100',&ndash;%&gt;--%>
<%--    &lt;%&ndash;            title:'商品编码',&ndash;%&gt;--%>
<%--    &lt;%&ndash;            checkbox:true&ndash;%&gt;--%>
<%--    &lt;%&ndash;        },{&ndash;%&gt;--%>
<%--    &lt;%&ndash;            field:'merchandiseName',&ndash;%&gt;--%>
<%--    &lt;%&ndash;            width:'100',&ndash;%&gt;--%>
<%--    &lt;%&ndash;            title:'商品名称',&ndash;%&gt;--%>
<%--    &lt;%&ndash;            align:'center'&ndash;%&gt;--%>
<%--    &lt;%&ndash;        },{&ndash;%&gt;--%>
<%--    &lt;%&ndash;            field:'merchantCode',&ndash;%&gt;--%>
<%--    &lt;%&ndash;            width:'100',&ndash;%&gt;--%>
<%--    &lt;%&ndash;            title:'商家编码',&ndash;%&gt;--%>
<%--    &lt;%&ndash;            align:'center'&ndash;%&gt;--%>
<%--    &lt;%&ndash;        },{&ndash;%&gt;--%>
<%--    &lt;%&ndash;            field:'salePrice',&ndash;%&gt;--%>
<%--    &lt;%&ndash;            width:'100',&ndash;%&gt;--%>
<%--    &lt;%&ndash;            title:'销售价格',&ndash;%&gt;--%>
<%--    &lt;%&ndash;            align:'center'&ndash;%&gt;--%>
<%--    &lt;%&ndash;        },{&ndash;%&gt;--%>
<%--    &lt;%&ndash;            field:'shortDesc',&ndash;%&gt;--%>
<%--    &lt;%&ndash;            width:'100',&ndash;%&gt;--%>
<%--    &lt;%&ndash;            title:'商品描述',&ndash;%&gt;--%>
<%--    &lt;%&ndash;            align:'center'&ndash;%&gt;--%>
<%--    &lt;%&ndash;        }&ndash;%&gt;--%>
<%--    &lt;%&ndash;        ]],&ndash;%&gt;--%>
<%--    &lt;%&ndash;        idField:'merchandiseCode',&ndash;%&gt;--%>
<%--    &lt;%&ndash;        loadMsg:'Loading,please waite...',&ndash;%&gt;--%>
<%--    &lt;%&ndash;        pagination:true&ndash;%&gt;--%>
<%--    &lt;%&ndash;    })&ndash;%&gt;--%>
<%--    &lt;%&ndash;}&ndash;%&gt;--%>
<%--</script>--%>
<div id="tabs-1" style="text-align: left;"
     dataSrc="<%=basePath%>merchant/ajaxView">
    <table class="tableCommon" cellspacing="0" cellpadding="0" border="0" width="100%">
        <tr>
            <td width="100" align="left" class="tdBlue">店铺编号：</td>
            <td width="250" align="left" name="">
                <%=tbMerchantPO.getMerchantCode()%>
            </td>
            <td width="100" align="left" class="tdBlue">店铺名称：</td>
            <td width="250" align="left" name="">
                <%=tbMerchantPO.getMerchantName()%>
            </td>
        </tr>
        <tr>
            <td width="100" align="left" class="tdBlue">创建时间：</td>
            <td width="250" align="left" name="">
                <%=tbMerchantPO.getCreateTime()%>
            </td>
            <td width="100" align="left" class="tdBlue">联系人名称：</td>
            <td width="250" align="left">
                <input class="form170px" name="" type="text"
                       valid="{must:true,tip:'联系人名称',fieldType:'pattern',length:10}" value="<%=tbMerchantPO.getContactPerson()%>"/><font color="red">*</font>
            </td>
        </tr>

        <tr>
            <td width="100" align="left" class="tdBlue">联系人电话：</td>
            <td width="250" align="left">
                <input class="form120px" name="" type="text"
                       valid="{must:true,tip:'联系人电话',fieldType:'pattern',regex:'^[1][358][0-9]{9}$',length:255}" value="<%=tbMerchantPO.getContactPhone()%>"/><font
                    color="red">*</font>
            </td>
            <td width="100" align="left" class="tdBlue">客服QQ：</td>
            <td width="250" align="left">
                <input class="form120px" name="contactQq" type="text"
                       valid="{must:true,tip:'客服QQ',fieldType:'pattern',length:255}" value="<%=tbMerchantPO.getContactQQ()%>"/><font color="red">*</font>
                <a target="_blank" href="http://shang.qq.com/v3/form.html" >登录客服QQ</a>
            </td>
        </tr>

<%--        <tr>--%>
<%--            <td width="100" align="left" class="tdBlue">营业执照代码：</td>--%>
<%--            <td width="250" align="left" name="tbMerchantPO.merchantCode">--%>
<%--            <td width="100" align="left" class="tdBlue">店铺网址：</td>--%>
<%--            <td width="250" align="left">--%>
<%--                <a target="_blank" name="tbMerchantPO.domainName" href="" id="domainName"/>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td width="150" align="left" class="tdBlue">公司地址：</td>--%>
<%--            <td colspan="5" class="noborder_lr">--%>
<%--                <div class="control-group">--%>
<%--                    <div class="controls">--%>
<%--                        <select name="location_p1" id="location_p1">--%>
<%--                        </select>--%>
<%--                        <select name="location_c1" id="location_c1">--%>
<%--                        </select>--%>
<%--                        <select name="location_a1" id="location_a1">--%>
<%--                        </select>--%>
<%--                        <input type="hidden" name="tbMerchantPO.merchantProvince" id="province_id1"/>--%>
<%--                        <input type="hidden" name="tbMerchantPO.merchantCity" id="city_id1"/>--%>
<%--                        <input type="hidden" name="tbMerchantPO.merchantRegion" id="region_id1"/>--%>
<%--                        <input type="hidden" name="tbMerchantPO.merchantAddr" id="address_id1"/>--%>
<%--                        <!-- 公司地址：省市区+详细街道地址 -->--%>
<%--                        <input type="text" name="tbMerchantPO.merchantStreet" id="street_id1"--%>
<%--                               style="width:230px" ;--%>
<%--                               placeholder="详细街道地址"/>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td width="150" align="left" class="tdBlue">售后收货地址：</td>--%>
<%--            <td colspan="5" class="noborder_lr">--%>
<%--                <div class="control-group">--%>
<%--                    <div class="controls">--%>
<%--                        <select name="location_p" id="location_p">--%>
<%--                        </select>--%>
<%--                        <select name="location_c" id="location_c">--%>
<%--                        </select>--%>
<%--                        <select name="location_a" id="location_a">--%>
<%--                        </select>--%>
<%--                        <input type="hidden" name="tbMerchantPO.afterSaleProvince" id="province_id"/>--%>
<%--                        <input type="hidden" name="tbMerchantPO.afterSaleCity" id="city_id"/>--%>
<%--                        <input type="hidden" name="tbMerchantPO.afterSaleRegion" id="region_id"/>--%>
<%--                        <input type="hidden" name="tbMerchantPO.afterSaleAddress" id="address_id"/>--%>
<%--                        <!-- 售后地址：省市区+详细街道地址 -->--%>
<%--                        <input type="text" name="tbMerchantPO.afterSaleStreet" id="street_id"--%>
<%--                               style="width:230px" ;--%>
<%--                               placeholder="详细街道地址"/>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td width="150" align="left" class="tdBlue">ECSS发货仓库编码：</td>--%>
<%--            <td colspan="5" class="noborder_lr">--%>
<%--                <input class="form170px" name="tbMerchantPO.storehouseCode" type="text"/><font color="red">*不填则为默认发货仓</font>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td width="150" align="left" class="tdBlue">百度统计代码ID：</td>--%>
<%--            <td colspan="5" class="noborder_lr">--%>
<%--                <input class="form170px" name="tbMerchantPO.baiduCode" type="text"/>--%>
<%--            </td>--%>
<%--        </tr>--%>
        <tr>
            <td width="150" align="left" class="tdBlue">店铺简介：</td>
            <td colspan="5" class="noborder_lr">
                    <textarea id="merchantDesc" rows="5" cols="100" name="merchantDesc"
                              valid="{must:false,tip:'',fieldType:'pattern',length:255}"></textarea>
                <font color="red">*</font>
            </td>
        </tr>
<%--        <tr>--%>
<%--            <td width="150" align="left" class="tdBlue">店铺Logo：</td>--%>
<%--            <td colspan="5" class="noborder_lr">--%>
<%--                <img src="" alt="" name="tbMerchantPO.merchantLogo" onload='setImgAutoSize(this)'/>--%>
<%--                <input id="file0" name="merchantLogo" type="file"--%>
<%--                       valid="{must:false,tip:'店铺Logo图片',fieldType:'pattern',length:255,regex:'\.(gif|jpg|jpeg|png|GIF|JPG|PNG)$'}"/>--%>
<%--                <span style="color: red;">*</span> <span>只能上传格式为：jpg、jpeg、gif、png的图片，大小不能超过1M</span>--%>
<%--                <img src="" alt="" style="" id="img0" width='60px' height=60px'/>--%>
<%--            </td>--%>
<%--        </tr>--%>
    </table>
</div>
</body>
<script>
    $(function () {
        init();
    })
    function init() {
        console.log("数据初始化")
        //给店铺详细描述赋值
        var merchantDesc = "<%=tbMerchantPO.getMerchantDesc()%>";
        console.log(merchantDesc)
        $("#merchantDesc").val(merchantDesc)
    }
</script>
</html>