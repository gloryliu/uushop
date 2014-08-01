<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>编辑源码</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js" ></script>
<link  rel="stylesheet" href="${pageContext.request.contextPath }/css/global.css" />
<link  rel="stylesheet" href="${pageContext.request.contextPath }/css/controlContent.css" />
<style type="text/css">
#fileContent{ border:1px solid #ccc; width:900px; height:400px; padding:5px;font-family:"黑体;font-size:15px;}
</style>

</head>

<body>
<div id="showGoods">

<div class="box">
<div class="box-head">
    <h2>编辑${requestScope.fileName}</h2>
</div>
<form action="${pageContext.request.contextPath }/saveSource.do" method="post">
    <div class="form">   
    <p>
        <span class="req"></span>
        <label>文件内容</label>
        <textarea name="fileContent" id="fileContent" >${requestScope.str}</textarea>
    </p>	
   	<input type="hidden" value="${requestScope.path}" name="path"/>		    
    </div>
    <div class="buttons">
        <input type="button" class="button" value="取消" onclick="history.back()"/>
        <input type="submit" class="button" value="提交" />
    </div>
</form>
</div>

</div>
</body>
</html>
