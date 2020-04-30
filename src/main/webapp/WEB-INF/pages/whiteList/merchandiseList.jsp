<%@page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="cn.com.do1.dqdp.core.ConfigMgr" %>
<%
    String DOMAIN = ConfigMgr.get("dqdpDomain", "DOMAIN", "sjsc.cmdc-ecss.cn");//引入配置管理的域名
    pageContext.setAttribute("DOMAIN", DOMAIN);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@include file="../../../common/dqdp_common.jsp" %>
<jsp:include page="../../../common/dqdp_vars.jsp">
    <jsp:param name="permission" value=""></jsp:param>
    <jsp:param name="mustPermission" value=""></jsp:param>
    <jsp:param name="dict" value=""></jsp:param>
</jsp:include>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>添加商品</title>
    <link href="${baseURL}/css/base.css" rel="stylesheet" type="text/css"/>
    <link href="${baseURL}/css/main.css" rel="stylesheet" type="text/css"/>
    <link href="${baseURL}/themes/${style}/css/common.css" rel="stylesheet" type="text/css"/>
    <!--   <script type="text/javascript" src="../js/brand.js"></script> -->
    <script src="${baseURL}/js/do1/common/jquery-3.1.1.js"></script>
    <script src="${baseURL}/js/do1/common/common3.js?ver=<%=jsVer%>"></script>
    <script src="${baseURL}/js/do1/common/error1.0.js"></script>
    <script src="${baseURL}/js/3rd-plug/jquery/jquery.form.js"></script>
    <script src="${baseURL}/js/do1/common/pop_up1.0.js"></script>
    <script src="${baseURL}/js/layer/layer.js"></script>
    <script src="${baseURL}/js/3rd-plug/jquery/jquery.cookie.js"></script>

    <style type="text/css">
    </style>
</head>

<body class='body_over'>
<!--头部 end-->
<!-- 品牌信息搜索表单 -->
<div class="check_order_table_div">
    <form action="${baseURL}/merchandiseManage/merchandiseManageAction!SearchCouponItem.action" method="post"
          id="form_search">
        <%--        保存商家id到searchValue--%>
        <input name="searchValue.merchantIds" type="hidden" value="${param.merchantIds}"/>
        <div class="searchWrap ">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="searchLeft"></td>
                    <td class="searchBg">
                        <table class="search" width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td>
                                    <table class="search" width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td width="110" height="30">商品名称：</td>
                                            <td width="110"><input class="form120px" name="searchValue.merchandiseName"
                                                                   type="text"/></td>
                                            <td width="10px"/>
                                            <td width="110"></td>
                                            <td width="10px"/>
                                            <td width="60" height="30"></td>
                                            <td width="110">
                                                <div class="operation"><input class="other_btn" type="button" value="查询"
                                                                              onclick="javascript:doSearch(1);"/></div>
                                            </td>
                                            <td width="110" align="left">
                                                <div class="operation"><input class="other_btn" type="button"
                                                                              value="确认选择"
                                                                              onclick="javascript:submitMerchandise()"/>
                                                </div>
                                            </td>
                                            <td width="10px"/>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td class="searchRight"></td>
                </tr>
                <tr>
                    <td class="searchButtomLeft"></td>
                    <td class="searchButtom"></td>
                    <td class="searchButtoRight"></td>
                </tr>
            </table>
        </div>
        <div id="form_list"></div>
    </form>
    <%--    查询提示--%>
    <div id="tip"></div>


    <!--表格 end-->
    <%--    工具栏--%>
    <div class="toolBar">
        <!--筛选 end-->
        <div class="pageDown" id="downIdPage">
        </div>
        <!--对表格数据的操作 end-->
    </div>
    <!--主体部分 end-->
    <div>&nbsp;</div>

</div>

<!--工具栏 end-->
<script type="text/javascript">


    //保存查询的分页数据
    var searchData;

    //获取该商家域名
    var domainName

    //ready函数
    $(document).ready(function () {
        //初始化页面，page为1
        doSearch(1);
        //商家域名
        domainName = '${merchantPO.domainName}.${DOMAIN}';
    });


    //提交确认商品的选项
    //回保存到add_whiteList_list页面
    function submitMerchandise() {
        //从Cookies获取值
        var array = JSON.parse($.cookie("checkValue"));
        var items = "";
        var item = "";
        array.forEach(function (merchandise, index) {
            console.log("merchandise="+merchandise.address)
            item = '<tr>'
                + '    <td>'
                + '      <input type="hidden" name="code" value="' + merchandise.code + '" /><input type="hidden" name="merchandiseCodeS" value="' + merchandise.code + '" /><input type="hidden" name="merchandiseNameS" value="' + merchandise.name + '" /><input type="hidden" name="publishAddressS" value="' + merchandise.address + '" />                       '
                + merchandise.code
                + '    </td>'
                + '    <td>'
                + '      <input type="hidden" name="exitItem" value="' + merchandise.code + '" />'
                + merchandise.name
                + '    </td>'
                + '    <td>'
                + '      <a class="single-goods" target="_blank" href="${baseURL}/merchandiseManage/merchandiseManageAction!skipToEditPage.action?type=view&merchandiseCode=' + merchandise.code + '" target="_blank">查看</a>'
                + '    </td>'
                + '    <td>'
                + '      <a href="javascript:void(0)"><span  onclick="deleteItem(this)"  >删除</span></a>'
                + '    </td>'
                + ' </tr>';
            items += item;
        });
        $("#item_table", window.parent.document).show();
        $("#tbody", window.parent.document).html(items);
        parent.layer.closeAll();
    }


    /**
     * 根据页码查询信息分页列表
     * @param $pageIndex
     */
    function doSearch($pageIndex) {
        //根据块id来进行ajaxSubmit
        $('#form_search').ajaxSubmit({
            dataType: 'json',
            data: {page: $pageIndex},
            success: function (result) {
                if ("0" == result.code) {
                    //将分页查询的数据保存在searchData
                    searchData = result.data.pageData;
                    //渲染页面
                    var list1 = new ListTable(
                        {
                            checkableColumn: "merchandiseCode",
                            title: [
                                {width: "10%", name: "imagePath", showName: "商品图片"},
                                {width: "10%", name: "merchandiseName", showName: "商品名称"},
                                {width: "10%", name: "lastModifyTime", showName: "更新时间"},
                                {width: "2%", name: "", showName: "选取", isCheckColunm: true},
                            ],
                            data: result.data.pageData,
                            trStyle: ["trWhite"]
                        });
                    list1.createList("form_list");
                    //构造Page
                    var pager = new Pager({
                        totalPages: result.data.maxPage,
                        totalRows: result.data.totalRows,
                        currentPage: result.data.currPage,
                        funcName: "doSearch",
                        pageSize: 5
                    });
                    //pager.createPageBar("topIdPage");
                    pager.createPageBar("downIdPage");

                    //转换为图片
                    $("#form_list").find("tbody").find("tr").children("td:first-child").each(function (index, dom) {
                        var path = $(dom).html();
                        $(dom).html('<img src="' + path + '"  style=\'height: 50px;width: 50px;\'>');
                    });

                    //动态更新ifram高度
                    //_resetFrameHeight();
                    _resetFrameHeightMy();

                    //父页面的exitItem
                    var exitItem = $("#item_table", window.parent.document).find("input[name=exitItem]");
                    exitItem.each(function (index2, dom2) {
                        $("input[name='ids']").each(function (index3, dom3) {
                            if ($(dom2).val() == $(dom3).val()) {
                                dom3.checked = true;
                            }
                        })

                    })
                    var num = 0;
                    $("input[name='ids']").each(function (index3, dom3) {
                        if (dom3.checked) {
                            num++;
                        }
                    });
                    if (num == $("input[name='ids']").length && num != 0) {
                        $("input[id='allCheck']").prop('checked', true);
                    }
                } else {
                    $("#tip").error({title: "错误", content: result.desc, button: [{name: "确定", event: "_hideMsg()"}]});
                }
            },
            error: function () {
            }
        });
    }
</script>

</body>
<script type="text/javascript">
    window.onload = function () {
        _resetFrameHeightMy();
        var array = new Array();
        //本页面记载完成后立刻获得父页面的东西
        //初始化merchandisCodeS
        var merchandiseCodeS = $("#item_table", window.parent.document).find("input[name=merchandiseCodeS]");
        //找到merchandiseNameS用初始化
        var merchandiseNameS = $("#item_table", window.parent.document).find("input[name=merchandiseNameS]");
        //找到publishAddressS用来初始化，ip地址，有值
        var publishAddressS = $("#item_table", window.parent.document).find("input[name=publishAddressS]");

        for (var i = 0; i < merchandiseCodeS.length; i++) {
            array.push({
                code: $(merchandiseCodeS[i]).val(),
                name: $(merchandiseNameS[i]).val(),
                adress: $(publishAddressS[i]).val()
            })
        }
        // 保存到cookies
        $.cookie("checkValue", JSON.stringify(array));
    }

    function _resetFrameHeightMy() {
        var a = this.frameElement;
        a && (a.height = a.contentDocument ? a.contentDocument.documentElement.scrollHeight + 0 : "MSIE9.0" == _browser_Version ? a.document.documentElement.scrollHeight : a.contentWindow.document.body.scrollHeight + 0, _heightSeted = !0)
    }

    //父页面到本页面，将选择的分页数据带到本页面
    //单选按钮
    $(document).on('click', "input[name='ids']", function () {
        /*先不管这个checkbx在不在cookie中，遍历数组去掉当前这个值*/
        var val = $(this).val();
        var array;
        //初始化array
        if ($.cookie("checkValue") == undefined || ($.cookie("checkValue") == '')) {
            array = new Array();
        } else {
            array = JSON.parse($.cookie("checkValue"));
        }
        array.forEach(function (item, index) {
            if (val == item.code) {
                array.splice(index, 1);
            }
        });
        //商品码、商品名称、商品图片、发布地址
        var merchandiseCode, merchandiseName, merchandisePic, publishAddress;
        //发布地址并不在分呀数据里面
        /*判断当前的checkbox是不是选中，选中的话在将这个值加进去*/
        if ($(this).prop('checked')) {
            //array.push($(this).val());
            for (var i = 0; i < searchData.length; i++) {
                if ($(this).val() == searchData[i].merchandiseCode) {
                    merchandiseName = searchData[i].merchandiseName;
                    merchandisePic = searchData[i].imagePath;
                    publishAddress = searchData[i].publishAddress;

                }
            }
            merchandiseCode = $(this).val();
            array.push({code: merchandiseCode, name: merchandiseName, pic: merchandisePic, adress: publishAddress})
        }
        /*最后把处理完的值存入cookie*/
        $.cookie("checkValue", JSON.stringify(array));
    });

    //全选按钮
    $(document).on('click', "input[id='allCheck']", function () {
        var array;
        if ($.cookie("checkValue") == undefined || ($.cookie("checkValue") == '')) {
            array = new Array();
        } else {
            array = JSON.parse($.cookie("checkValue"));
        }
        for (var i = 0; i < searchData.length; i++) {
            array.forEach(function (item, index) {
                if (searchData[i].merchandiseCode == item.code) {
                    array.splice(index, 1);
                }
            });
        }
        var merchandiseCode, merchandiseName, merchandisePic, publishAddress;
        if ($(this).prop('checked')) {
            $("input[name='ids']").each(function (index3, dom3) {
                dom3.checked = true;
            });
            for (var i = 0; i < searchData.length; i++) {
                merchandiseName = searchData[i].merchandiseName;
                merchandisePic = searchData[i].imagePath;
                publishAddress = searchData[i].publishAddress;
                merchandiseCode = searchData[i].merchandiseCode;
                array.push({code: merchandiseCode, name: merchandiseName, pic: merchandisePic, adress: publishAddress})
            }
        } else {
            $("input[name='ids']").each(function (index3, dom3) {
                dom3.checked = false;
            });
        }
        $.cookie("checkValue", JSON.stringify(array));
    });
</script>
</html>
