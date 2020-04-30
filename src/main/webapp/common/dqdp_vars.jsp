<%@page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="cn.com.do1.common.dictionary.DictOperater" %>
<%@ page import="cn.com.do1.common.dictionary.vo.ExItemObj" %>
<%@ page import="cn.com.do1.common.exception.BaseException" %>
<%@ page import="cn.com.do1.common.util.AssertUtil" %>
<%@ page import="cn.com.do1.common.util.string.StringUtil" %>
<%@ page import="cn.com.do1.common.util.web.WebUtil" %>
<%@ page import="cn.com.do1.component.systemmgr.user.model.User" %>
<%@ page import="cn.com.do1.dqdp.core.DqdpAppContext" %>
<%@ page import="org.springframework.security.core.GrantedAuthority" %>
<%@ page import="org.springframework.security.core.userdetails.UserDetails" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.util.List" %>
<%@ page import="org.slf4j.LoggerFactory" %>
<%@ page import="cn.com.do1.component.dqdpsecurity.core.UrlIllegalCharConvert" %>
<%@ page import="java.net.URLDecoder" %>
<%
//    if (WebUtil.checkIlegalChar(request) && !request.getQueryString().contains("transdata")) {
//        response.setStatus(500);
//        out.println("带有非法字符的请求!");
//        out.flush();
//        out.close();
//    }
    String dict = WebUtil.getParm(request, "dict", "");
    String permission = WebUtil.getParm(request, "permission", "");
    String mustPermission = WebUtil.getParm(request, "mustPermission", "");
    UserDetails currentUser = DqdpAppContext.getCurrentUser();
    if (!AssertUtil.isEmpty(mustPermission)) {
        if (!((User) currentUser).isAuthoritiyFor(mustPermission)) {
            try {
                LoggerFactory.getLogger(this.getClass()).warn(String.format("%s会话的%s用户没有%s权限，不能访问%s页面！", session.getId(), currentUser.getUsername(), mustPermission, this.getClass().getName()));
                request.getRequestDispatcher("/jsp/default/login/login_in.jsp").forward(request, response);
//                response.sendRedirect("/jsp/default/login/login_in.jsp");
                return;
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
    StringBuilder sb = new StringBuilder();
    sb.append("<script type=\"text/javascript\">var _dqdp_dict={");
    if (!AssertUtil.isEmpty(dict)) {
        int j = 0;
        for (String typeName : StringUtil.splitString(dict, ",")) {
            if (j > 0) sb.append(",");
            List<ExItemObj> allItemByType = null;
            try {
                allItemByType = DictOperater.getChildItemByType(typeName);
            } catch (BaseException e) {
                e.printStackTrace();
            }
            sb.append("'").append(typeName).append("':[").append(DictOperater.outDictJson(allItemByType)).append("]");
            j++;
        }
    }
    sb.append("};var _dqdp_permissions={");
    if (!AssertUtil.isEmpty(permission)) {
        if (!"no".equals(permission)) {
            int i = 0;
            String[] permissions = StringUtil.splitString(permission, ",");
            for (GrantedAuthority grantedAuthority : currentUser.getAuthorities()) {
                if ("all".equals(permission) || StringUtil.isInContainer(permissions, grantedAuthority.getAuthority())) {
                    if (i > 0) sb.append(",");
                    sb.append(grantedAuthority).append(":true");
                    i++;
                }
            }
        }
    }
    sb.append("};</script>");
    out.print(sb.toString());
%>
