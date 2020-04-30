<%@ page import="com.gx.merchant.domain.TbMerchantPO" %>
<%@page language="java" contentType="text/html; charset=UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    //从session获取店铺信息
    TbMerchantPO tbMerchantPO = (TbMerchantPO) request.getSession().getAttribute("tbMerchantPO");
    System.out.print("在店铺详情页面商家信息=" + tbMerchantPO);
    String merchantId = tbMerchantPO.getMerchantId();
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@include file="../../../common/dqdp_common.jsp" %>
<jsp:include page="../../../common/dqdp_vars.jsp">
    <jsp:param name="dict" value="merchantStatus"></jsp:param>
</jsp:include>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>新增白名单用户库</title>
    <link rel="stylesheet" href="<%=basePath%>css/base.css">>
    <link rel="stylesheet" href="<%=basePath%>css/main.css">
    <!-- 下拉模糊搜索 -->
    <script src="<%=basePath%>js/common/jquery-3.1.1.js"></script>
    <script src="<%=basePath%>js//common/common.js"></script>
    <script src="<%=basePath%>portal/js/jquery/jquery.form.js"></script>
    <script type="text/javascript" src="<%=basePath%>portal/js/layer/layer.js"></script>
    <style type="text/css">
        /*<img>标签不加载图片时，去除边框样式 ，用作预览图片 */
        img[src=""], img:not([src]) {
            opacity: 0;
        }
    </style>
</head>

<body>
<script type="text/javascript">
    $(document).ready(function () {
    });
</script>
<form action="${baseURL}/whitelistMgr/whitelistMgrAction!ajaxAdd.action" method="post" id="form_add"
      enctype="multipart/form-data">
    <div class="check_order_table_div">
        <table class="tableCommon" cellspacing="0" cellpadding="0" border="0" width="100%" id="id_body">
            <thead>
            <tr>
                <th colspan="4">添加用户库</th>
            </tr>
            </thead>
            <input name="merchantId" class="merchantId" type="hidden" value="<%=merchantId%>"/>
<%--            <c:if test="${empty merchant}">--%>
<%--                <tr>--%>
<%--                    <td width="120" class="tdBlue">店铺名称：</td>--%>
<%--                    <td width="280" colspan="3">--%>
<%--                        <select name="merchantId" class="merchantId" id="merchantNames" style="width:100px;">--%>

<%--                        </select>--%>
<%--                    </td>--%>
<%--                </tr>--%>
<%--            </c:if>--%>
<%--            <c:if test="${not empty merchant}">--%>
<%--                <input name="merchantId" class="merchantId" type="hidden" value="${merchant}"/>--%>
<%--            </c:if>--%>
            <tr>
                <td width="180" align="left" class="tdBlue">白名单用户库名称：</td>
                <td colspan="5" class="noborder_lr">
                    <input class="form120px" name="tbWhiteListPO.whiteListName" type="text" style="width:230px;"
                           valid="{must:true,tip:'白名单用户库名称',fieldType:'pattern',length:255}"/><font color="red">*</font>
                </td>
            </tr>
            <tr>
                <td width="180" align="left" class="tdBlue">描述：</td>
                <td colspan="5" class="noborder_lr">
                    <textarea rows="3" cols="50" name="tbWhiteListPO.whiteListDesc" id="shortDesc"></textarea>
                </td>
            </tr>
            <tr>
                <td width="180" align="left" class="tdBlue">绑定商品：
                    <%--                    <input type="checkbox" name="bindType" value="1"/>--%>
                </td>
                <td colspan="5" class="noborder_lr">
                    <a href="javascript:addItem()" class="add-goods js-add-goods"> + 选择商品</a>
                    <table class="assign-goods-list ui-table js-goods-list" id="item_table" style="display:none">
                        <thead>
                        <tr>
                            <th class="cell-80">商品编号</th>
                            <th class="cell-80">商品名称</th>
                            <th class="cell-20">商品详情</th>
                            <th class="cell-20">操作</th>
                        </tr>
                        </thead>
                        <tbody id="tbody">
                        <tr id="after_items" style="display:none"></tr>
                        </tbody>
                    </table>

                </td>
            </tr>

            <tr>
                <td width="180" align="left" class="tdBlue">上传白名单用户群：
                    <%--                    <input type="checkbox" name="whiteListType" id="whiteList" value="3"/>--%>
                </td>
                <td colspan="5" class="noborder_lr">
                    <input id="file0" name="file" type="file"
                           valid="{must:false,tip:'白名单用户群',fieldType:'pattern',regex:'\.(csv|CSV)$'}"/>
                    <div>注意：</div>
                    <div>1. 仅支持CSV文件，格式：每行一条数据。<a href="${baseURL}/whitelistMgr/whitelistMgrAction!downModelCsv.action">下载模板</a>
                    </div>
                    <div>2. 上传数据仅为手机号码，系统会自动去重。</div>
                </td>
            </tr>

            <tr>
                <td width="180" align="left" class="tdBlue">非白名单客户操作失败的提示语：</td>
                <td colspan="5" class="noborder_lr">
                    <input class="form120px" name="tbWhiteListPO.whiteListTips" id="whiteListTips" type="text"
                           style="width:230px;"
                    /><span class="error" style="color: red;font-size: 0.22rem"
                            id="tip"></span>
                </td>

            </tr>

        </table>
    </div>
</form>

<div class="toolBar">
    <div align="center">
        <input class="other_btn" id="save" type="button" value="保存"/>
        <input class="other_btn" type="button" onclick="javascript:history.back();" value="返 回"/>
    </div>
</div>
<div>&nbsp;</div>
<!--工具栏 end-->
<script src="${baseURL}/jsp/component/portal/js/region_select.js"></script>

<script type="text/javascript">
    $(function () {
    })
    //添加商品
    function addItem() {
        layer.open({
            type: 2,
            title: '添加商品',
            area: ['800px', '600px'],
            shadeClose: true, //点击遮罩关闭
            closeBtn: 1,
            moveType: 0, //拖拽模式，0或者1
            content: 'item_List.jsp?merchantIds=' + $(".merchantId").val()
        });
    }
</script>
</body>
</html>
