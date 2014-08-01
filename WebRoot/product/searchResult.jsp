<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>优优图书</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js" ></script>
<script src="${pageContext.request.contextPath }/js/jquery.hashchange.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/js/jquery.easytabs.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/global.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/pdetails.js" ></script>
<link  rel="stylesheet" href="${pageContext.request.contextPath }/css/global.css" />
<link  rel="stylesheet" href="${pageContext.request.contextPath }/css/pdetails.css" />
</head>
<body>
<div class="msg2 curved"><ul><li>保存成功！</li></ul></div>
<%@include file="/share/header.jsp" %>

<!-- 内容体开始 -->
<div class="content">

<div class="breadcrumb" >
<a href="#" target="_blank" class="domain"><b class="domain">查询结果</b></a>&nbsp;&gt;&nbsp;
<span>共找到关于"<font color="#f00"><s:property value="keyWord"/></font>"<s:property value="#request.searchResults.getRecordtotal()"/>条记录</span>
</div>

<!--  内容左侧开始 -->
<div class="content_left">

<div class="all_div">
<p class="all_title">热卖图书</p>
<div class="all_content">
<div class="reBooks">
<ul>
<c:forEach var="book" items="${requestScope.bestSellerBooks }">
	<li>
		<a class="pic1" href="${pageContext.request.contextPath }/book_searchById.do?bid=${book.bid }"><img src="/uushop/upload/book/images/${book.image }"  title="${book.bname }" width="54px" height="54px"/></a>
		<a class="bookName" href="${pageContext.request.contextPath }/book_searchById.do?bid=${book.bid }">${book.bname }</a>
		<span class="d_price">¥${book.price }</span>
	</li>
</c:forEach>
</ul>
</div>
</div>
</div>

<div class="all_div">
<p class="all_title">您的浏览历史</p>
<div class="all_content">
<div class="reBooks">
<ul>
<c:forEach var="book" items="${requestScope.haveScanBooks }">
	<li>
		<a class="pic1" href="${pageContext.request.contextPath }/book_searchById.do?bid=${book.bid }"><img src="/uushop/upload/book/images/${book.image }"  title="${book.bname }" width="54px" height="54px"/></a>
		<a class="bookName" href="${pageContext.request.contextPath }/book_searchById.do?bid=${book.bid }">${book.bname }</a>
		<span class="d_price">¥${book.price }</span>
	</li>
</c:forEach>
</ul>
</div>
</div>
</div>

</div>
<!--  内容左侧结束 -->

<!--  内容右侧开始 -->
<div class="content_right">

<s:iterator id="book"  value="#request.searchResults.getResultlist()">
<div class="result_div">
<!-- 显示图片开始 -->
<div class="search_pic">
<a href="/uushop/book_searchById.do?bid=${book.bid }" class="search_pic_a">
<img src="/uushop/upload/book/images/${book.image }" width="140px" height="160px"/>
</a>
</div>
<!-- 显示图片结束 -->
<!-- 显示图书详情开始 -->
<div class="search_right_content"> 
<p class="search_book_title">图书名称：<a href="/uushop/book_searchById.do?bid=${book.bid }">${book.bname }</a>&nbsp;&nbsp;&nbsp;&nbsp;售价：<font color="#c30">￥${book.price }</font>&nbsp;&nbsp;&nbsp;&nbsp;销售数量：${book.saleCount }&nbsp;&nbsp;&nbsp;&nbsp;评论数量：${book.commentCount }</p>
<p style="font-size:14px;">图书作者：${book.author }<span style="margin-left:124px;">图书类型：${book.bookType.bType }</span><span style="margin-left:20px;">${book.bookType.sType }</span></p>
<div class="book_info"><font style="font-size:14px;">图书详情：</font><c:out value="${book.bookInfo }" escapeXml="false"></c:out></div>
<a href="/uushop/book_searchById.do?bid=${book.bid }" class="btn btn_buy search_buy_btn" title="购买" id="part_buy_button" ></a>
</div>
<!-- 显示图书详情结束 -->
</div>
</s:iterator>

<!-- 前台分页开始 -->
<p class="f_dividePage">
 <!-- Pagging -->
 <s:if test="pageBean.pageCount<1"></s:if>
 <s:else>
 <s:if test="pageBean.currentPage+1==1"></s:if>
 <s:else><a href="searchAction.do?currentPage=<s:property value="pageBean.currentPage-1"/>">上一页</a></s:else>
 <s:if test="0>pageBean.pageCount-7">
 	<s:iterator var="n" begin="1" end="pageBean.pageCount" >
 		<a href="searchAction.do?currentPage=<s:property value="#n-1"/>"><s:property /></a>
 	</s:iterator>
	</s:if>
 <s:else>
 	<s:iterator var="n"  begin="1" end="3" >
 		<a href="searchAction.do?currentPage=<s:property value="#n-1"/>"><s:property /></a>
 	</s:iterator>
 	<span class="splitPage">...</span>
 	<s:iterator var="n"  begin="pageBean.pageCount-1" end="pageBean.pageCount" >
 		<a href="searchAction.do?currentPage=<s:property value="#n-1"/>"><s:property /></a>
 	</s:iterator>
 </s:else>
 <s:if test="pageBean.currentPage+1==pageBean.pageCount"></s:if>
 <s:else><a href="searchAction.do?currentPage=<s:property value="pageBean.currentPage+1"/>">下一页</a></s:else>
 <span style="float:right" class="pageInfo">当前：<s:property value="pageBean.currentPage+1"/>/<s:property value="pageBean.pageCount"/>页&nbsp;&nbsp;显示：<s:property value="pageBean.pageSize"/>条&nbsp;&nbsp;共：<s:property value="pageBean.totalCount"/>条</span>
 </s:else>
 <!-- End Pagging --> 
</p>
<!-- 前台分页结束 -->

</div>
<!--  内容右侧结束 -->
</div>
<!-- 内容体结束 -->

<jsp:include page="../share/footer.jsp" />
</body>
</html>
