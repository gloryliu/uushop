<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台头部</title>
<link  rel="stylesheet" href="../css/global.css" />
</head>
<body>
<div class="control_header">
<img src="../images/logo3.png"  style="float:left; margin-top:13px; margin-left:20px;"/>
<p style="display:block; line-height:18px; position:absolute; right:50px; top:30px; font-size:13px; color:#FFF;">

欢迎&nbsp;&nbsp;${manager.nickname }&nbsp;&nbsp;<a href="/uushop/user_adminLogout.do" style="color:#FFF; text-decoration:underline;" target="_top">退出</a>

</p>
</div>
</body>
</html>