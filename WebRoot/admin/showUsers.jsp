<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>显示所有用户</title>
<link  rel="stylesheet" href="../css/global.css" />
<link  rel="stylesheet" href="../css/controlContent.css" />
</head>
<body>
<div class="msg curved"><ul><s:iterator value="actionMessages"><li><s:property /></li></s:iterator></ul></div>
<div id="showGoods">

<div class="box">
    <!-- Box Head -->
    <div class="box-head">
        <h2 class="left">所有用户</h2>
    </div>
    <!-- End Box Head -->	
    <!-- Table -->
    <div class="table">
    	<form action="/uushop/user_lock.do" method="post" name="showForm" id="showForm">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tbody>
            <tr>
                <th width="13"></th>
                <th>昵称</th>
                <th>邮箱</th>
                <th>头像</th>
                <th>用户类型</th>
                <th>用户状态</th>
                <th>积分</th>
                <th>锁定用户</th>
            </tr>
        <s:iterator var="user" value="#request.users">
            <tr>
                <td><input type="checkbox" class="item" name="item" value="<s:property value="#user.uid"/>"/></td>
                <td><a href="#" class="w_h_size"><s:property value="#user.nickname"/></a></td>
                <td><s:property value="#user.account"/></td>
                <td><s:property value="#user.photo"/></td>
                <td><s:property value="#user.type"/></td>
                <td><s:property value="#user.status"/></td>
                <td><s:property value="#user.pointsCount"/></td>
	            <c:if test="${user.status==0 }">
	                <td><a href="javascript:void(0);" onclick="javascript:if(confirm('确定锁定该用户吗？')){location='/uushop/user_lock.do?item=${user.uid }';};">
	                <span class="editSpan"></span></a></td>
                </c:if>
	            <c:if test="${user.status==1 }">
	                <td><a href="javascript:void(0);" onclick="javascript:if(confirm('确定解锁该用户吗？')){location='/uushop/user_unlock.do?item=${user.uid }';};">
	                <span class="editSpan"></span></a></td>
                </c:if>
            </tr>
         </s:iterator>   
        	</tbody>
        </table>
        <jsp:include page="/share/divideUserPage.jsp" />
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
