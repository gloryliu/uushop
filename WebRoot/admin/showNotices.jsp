<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>显示所有公告</title>
<link  rel="stylesheet" href="../css/global.css" />
<link  rel="stylesheet" href="../css/controlContent.css" />
</head>
<body>
<div class="msg curved"><ul><s:iterator value="actionMessages"><li><s:property /></li></s:iterator></ul></div>
<div id="showGoods">

<div class="box">
    <!-- Box Head -->
    <div class="box-head">
        <h2 class="left">所有公告</h2>
    </div>
    <!-- End Box Head -->	
    <!-- Table -->
    <div class="table">
    	<form action="/uushop/deleteNotice.do" method="post" name="showForm" id="showForm">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tbody>
            <tr>
                <th width="13"></th>
                <th>公告内容</th>
                <th>发布时间</th>
                <th>删除公告</th>
            </tr>
        <s:iterator var="notice" value="#request.notices">
            <tr>
                <td><input type="checkbox" class="item" name="item" value="${notice.nid }"/></td>
                <td>${notice.nContent }</td>
                <td>${notice.nTime }</td>
                <td><a href="javascript:void(0);" onclick="javascript:if(confirm('确定删除该公告吗？')){location='/uushop/deleteNotice.do?item=${notice.nid }';};">
	                <span class="delSpan"></span></a></td>
            </tr>
         </s:iterator>   
        	</tbody>
        </table>
        <jsp:include page="/share/divideNoticePage.jsp" />
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
