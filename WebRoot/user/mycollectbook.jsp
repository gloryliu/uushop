<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>优优图书</title>
<script type="text/javascript" src="/uushop/js/jquery-1.8.3.js" ></script>
<script type="text/javascript" src="/uushop/js/global.js" ></script>
<script type="text/javascript" src="/uushop/js/userCenter.js" ></script>
<link  rel="stylesheet" href="/uushop/css/global.css" />
<link  rel="stylesheet" href="/uushop/css/userCenter.css" />
</head>
<body>
<jsp:include page="/share/header2.jsp" />
<!-- Content Start -->
<div class="content">

<!-- Position Start -->
<div class="breadcrumb" >
<a href="#" target="_blank" class="domain"><b class="domain">个人中心</b></a>&nbsp;&gt;&nbsp;
<a href="#" target="_blank">我的交易</a>&nbsp;&gt;&nbsp;
<span>我的定单</span>
</div>
<!-- Position End -->

<!-- left Start -->
<div class="content_left">
<div class="user_center">
<ul>
<li class="user_center_header"><h3 class="left_title">我的交易</h3><a class="slideUp"></a>
    <ul>
    	<li><a href="getMyOrder.do">我的订单</a></li>
        <li><a href="book_getCollect.do">我的收藏</a></li>
        <li><a href="getHavePayOrder.do">已购图书</a></li>
    </ul>
</li>
<li class="user_center_header"><h3 class="left_title">我的帐号</h3><a class="slideUp"></a>
    <ul>
    	<li><a href="#">我的礼券</a></li>
        <li><a href="#">我的积分</a></li>
    </ul>
</li>
<li class="user_center_header"><h3 class="left_title">个人信息</h3><a class="slideUp"></a>
    <ul>
    	<li><a href="#">修改头像</a></li>
        <li><a href="#">详细信息</a></li>
        <li><a href="#">地址管理</a></li>
    </ul>
</li>
</ul>
</div>
</div>
<!-- left End -->

<!-- right Start -->
<div class="content_right">
<div class="user_right_div">
<!--定单项 -->
<div class="order_item" style="font-size:14px; font-weight:bold; background:#f2f2f2">
  <table width="716" border="0" cellspacing="0" cellpadding="0">
    <tr height="60">
      <td width="220">图书名字</td>
      <td width="150">图书作者</td>
      <td width="100">图书价格/td>
      <td width="100">出版社</td>
      <td width="146">出版时间</td>
    </tr>
  </table>
</div>
<c:forEach var="book" items="${requestScope.collectBooks }">
<div class="order_item">
  <table width="716" border="0" cellspacing="0" cellpadding="0">
    <tr height="60">
      <td width="220"><a href="/uushop/book_searchById.do?bid=${book.bid }">${book.bname }</a></td>
      <td width="150">${book.author }</td>
      <td width="100" style="color:#F00;">${book.price }￥</td>
      <td width="100">${book.publishCompany }</td>
      <td width="146">${book.publishDate }</td>
    </tr>
  </table>
</div>
</c:forEach>
</div>
</div>
<!-- right End -->
</div>
<!-- Content End -->

<!-- footer Start -->
<jsp:include page="/share/footer.jsp" />
<!-- footer End -->
</body>
</html>
