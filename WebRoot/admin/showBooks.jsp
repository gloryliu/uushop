<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>显示图书</title>
<link  rel="stylesheet" href="../css/global.css" />
<link  rel="stylesheet" href="../css/controlContent.css" />
</head>
<body>
<div class="msg curved"><ul><s:iterator value="actionMessages"><li><s:property /></li></s:iterator></ul></div>
<div id="showGoods">

<div class="box">
    <!-- Box Head -->
    <div class="box-head">
        <h2 class="left">所有图书</h2>
    </div>
    <!-- End Box Head -->	
    <!-- Table -->
    <div class="table">
    	<form action="book_deleteBook.do" method="post" name="showForm" id="showForm">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tbody>
            <tr>
                <th width="13"></th>
                <th>图书名</th>
                <th>作者</th>
                <th>价格</th>
                <th>图书类型</th>
                <th>出版社</th>
                <th>出版日期</th>
                <th>评论数</th>
                <th>库存数量</th>
                <th>已售出</th>
                <th>编辑</th>
                <th>删除</th>
            </tr>
        <s:iterator var="book" value="#request.books">
            <tr>
                <td><input type="checkbox" class="item" name="item" value="<s:property value="#book.bid"/>"/></td>
                <td><a href="#" class="w_h_size"><s:property value="#book.bname"/></a></td>
                <td><s:property value="#book.bid"/></td>
                <td><s:property value="#book.price"/>￥</td>
                <td><s:iterator id="bookType" value="#book.bookType"><s:property value="#bookType.getsType()"/></s:iterator></td>
                <td><s:property value="#book.publishCompany"/></td>
               <td><s:property value="#book.publishDate"/></td>
                <td><s:property value="#book.commentCount"/></td>
                <td><s:property value="#book.inventoryCount"/></td>
                <td><s:property value="#book.saleCount"/></td>
                <td><a href="javascript:void(0);" onclick="javascript:location='/uushop/book_searchBook.do?bid=${book.bid }';"><span class="editSpan"></span></a></td>
                <td><a href="javascript:void(0);" onclick="javascript:if(confirm('确定删除该条记录吗？')){location='/uushop/book_deleteBook.do?item=${book.bid }'};">
                <span class="delSpan"></span></a></td>
            </tr>
         </s:iterator>   
        	</tbody>
        </table>
        <jsp:include page="/share/dividePage.jsp" />
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
