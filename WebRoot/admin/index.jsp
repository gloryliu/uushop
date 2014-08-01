<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<s:if test="#session.manager==null">
	<c:redirect url="/admin/login.html" ></c:redirect>
</s:if>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>优优商城后台管理</title>
</head>
<frameset rows="89,*" frameborder="0" framespacing="0" border="0" style=" overflow:hidden">
<frame src="header.jsp">
<frameset cols="235,10,*" id="bottom">
<frame src="control.html" style="overflow-x:hidden">
<frame src="switch.html" name="switch" frameborder="no" scrolling="no">
<frame name="content" src="about.html" >
</frameset>
</frameset><noframes></noframes>
</html>
