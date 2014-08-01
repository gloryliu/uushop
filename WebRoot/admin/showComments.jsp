<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>显示所有评论</title>
<link  rel="stylesheet" href="../css/global.css" />
<link  rel="stylesheet" href="../css/controlContent.css" />
</head>
<body>
<div class="msg curved"><ul><s:iterator value="actionMessages"><li><s:property /></li></s:iterator></ul></div>
<div id="showGoods">

<div class="box">
    <!-- Box Head -->
    <div class="box-head">
        <h2 class="left">所有评论</h2>
    </div>
    <!-- End Box Head -->	
    <!-- Table -->
    <div class="table">
    	<form action="/uushop/deleteComment.do" method="post" name="showForm" id="showForm">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tbody>
            <tr>
                <th width="13"></th>
                <th>评论内容</th>
                <th>评论时间</th>
                <th>下单时间</th>
                <th>评论者</th>
                <th>图书名称</th>
                <th>删除操作</th>
            </tr>
        <s:iterator var="comment" value="#request.comments">
            <tr>
                <td><input type="checkbox" class="item" name="item" value="${comment.cid }"/></td>
                <td width="280px" style="overflow: hidden"><c:out value="${comment.content }" escapeXml="true"></c:out></td>
                <td>${comment.pdate }</td>
                <td>${comment.bdate }</td>
                <td>${comment.user.nickname }</td>
                <td>${comment.book.bname }</td>
                <td><a href="javascript:void(0);" onclick="javascript:if(confirm('确定删除该评论吗？')){location='/uushop/deleteComment.do?item=${comment.cid }';};">
	                <span class="delSpan"></span></a></td>
            </tr>
         </s:iterator>   
        	</tbody>
        </table>
        <jsp:include page="/share/divideCommentPage.jsp" />
        </form>
    </div>
    <!-- Table --> 
</div>
<!-- BoxEnd -->
</div>
<script type="text/javascript" src="../js/jquery-1.8.3.js" ></script>
<script type="text/javascript" src="../js/listControl.js" ></script>
</body>
</html>
