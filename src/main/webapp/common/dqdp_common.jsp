<%@ page import="cn.com.do1.dqdp.core.DqdpAppContext" %>
<%@ page import="java.util.UUID" %>
<%@ page import="cn.com.do1.common.util.web.WebUtil" %>
<%--<%@ page import="cn.com.do1.component.merchantmgr.merchant.model.TbMerchantPO" %>--%>
<%@ page import="cn.com.do1.common.util.AssertUtil" %>
<%@page language="java" contentType="text/html; charset=UTF-8" %>
<%--<%--%>
<%--    String baseURL = request.getContextPath();--%>
<%--    String jsVer = "2.23";--%>
<%--    pageContext.setAttribute("baseURL", baseURL);--%>
<%--    pageContext.setAttribute("style", "default");--%>
<%--    pageContext.setAttribute("currUser", DqdpAppContext.getCurrentUser());--%>
<%--    WebUtil.checkParamIlegalChar(request, "id");--%>
<%--    TbMerchantPO tbMerchantPO=(TbMerchantPO) request.getSession().getAttribute("tbMerchantPO");--%>
<%--    if(!AssertUtil.isEmpty(tbMerchantPO)){--%>
<%--        pageContext.setAttribute("merchantName",tbMerchantPO.getMerchantName());--%>
<%--    }--%>
<%--%>--%>
<script type="text/javascript">
    var baseURL = "${baseURL}";
    var dqdp_csrf_token = "${sessionScope.dqdp_csrf_token}";
    var _crashToken = "<%=UUID.randomUUID().toString()%>";
    var merchantName="${merchantName}";
    window.onload=function () {
        var oldTitle=$("title").text();
        if(merchantName!=null&&merchantName!=""&&typeof merchantName!="undefined"){
            $("title").text(merchantName+"-"+oldTitle);
        }
    }
</script>
<%--<script src="${baseURL}/JavaScriptServlet"></script>--%>
<div id="id_dqdp_tip" style="position: absolute;"></div>
