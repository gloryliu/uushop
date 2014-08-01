<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>信息提示</title>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js" ></script>
    <link  rel="stylesheet" href="${pageContext.request.contextPath }/css/global.css" />
  </head>
  <body>
  <div style=" width: 400px; height:300px; margin-top:100px; font-size:14px; border:1px solid  #ccc; padding-top:80px;">
    <s:actionmessage/>
    <input  type="button" class="btn3" value="返回" style="margin-top:80px;" onclick="javascript:history.back();"/> 
    </div>
  </body>
</html>
