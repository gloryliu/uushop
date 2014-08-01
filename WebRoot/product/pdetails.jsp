<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

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

<div class="content">

<div class="breadcrumb" >
<a href="#" target="_blank" class="domain"><b class="domain">图书</b></a>&nbsp;&gt;&nbsp;
<a href="#" target="_blank">古籍</a>&nbsp;&gt;&nbsp;
<span>商品详情</span>
</div>

<div class="content_left">

<div class="all_div">
<p class="all_title">浏览本商品的顾客还看过</p>
<div class="all_content">
<div class="reBooks">
<ul>
<c:forEach var="book" items="${requestScope.sameTypeBooks }">
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
</div>

<div class="content_right">
<p class="bookTitle">${resultBook.bname}</p>
<div class="showPic">
<div class="big"><a href="#"><img id="book_image" src="${pageContext.request.contextPath }/upload/book/images/${resultBook.image}" width="350" height="350"/></a></div>
</div>
<div class="bookDetails">
<p>商品编号：<uumark class="book_id">${resultBook.bid}</uumark></p>
<p>优 优 价：<b class="b_price item_price">¥${resultBook.price}</b></p>
<p>丛 书 名：尚无消息</p>
<p>作 者：${resultBook.author}</p>
<p>出 版 社：${resultBook.publishCompany}</p>
<p>出版时间：${resultBook.publishDate}</p>
<p><span>版　　次：1</span><span>页　　数：2160</span><span>字　　数：386000</span></p>
<p><span>印刷时间：2009-10-1</span><span>开　　本：64开</span><span>纸　　张：胶版纸</span></p>
<p><span>印　　次：1</span><span>I S B N：23229473</span><span>包　　装：精装</span></p>
<div class="clear"></div>
<div class="buy_area">
<p class="wannaBuy">我要买：
            <a href="javascript:void(0);" class="cut a_mini" title="数量减一" onclick="reductCount()"></a>
            <input type="text"  class="input_mini" value="1" disabled="disabled"/>
            <a href="javascript:void(0);" class="add a_mini" title="数量加一" onclick="addCount()"></a>
            <span class="allCount">总额为：<b class="b_price allPrice">¥${resultBook.price}</b></span>
</p>
<div class="btn_p">
<a href="javascript:void(0);" class="btn btn_buy" title="购买" id="part_buy_button" onclick="buyBook()"></a>
<a href="javascript:void(0);"  id="collect" title="收藏" class="btn btn_collect" onclick="addCollect()"></a>
</div>
</div>
</div>

<div class="clear"></div>
<div class="bunket">
<h3>购买本商品的顾客还买过</h3>
<div class="over">
<ul id="targetUL">
<li>
<a href="#"><img src="${pageContext.request.contextPath }/images/default2.jpg" width="150" height="150"/></a>
<p><a href="#">套装（全六册）</a></p>
<p class="d_price">¥30.00</p>
</li>
<li>
<a href="#"><img src="${pageContext.request.contextPath }/images/author6.jpg" width="150" height="150"/></a>
<p><a href="#">套装（全六册）</a></p>
<p class="d_price">¥30.00</p>
</li>
<li>
<a href="#"><img src="${pageContext.request.contextPath }/images/default7.jpg" width="150" height="150"/></a>
<p><a href="#">套装（全六册）</a></p>
<p class="d_price">¥30.00</p>
</li>
<li>
<a href="#"><img src="${pageContext.request.contextPath }/images/default2.jpg" width="150" height="150"/></a>
<p><a href="#">套装（全六册）</a></p>
<p class="d_price">¥30.00</p>
</li>
<li>
<a href="#"><img src="${pageContext.request.contextPath }/images/author5.jpg" width="150" height="150"/></a>
<p><a href="#">套装（全六册）</a></p>
<p class="d_price">¥30.00</p>
</li>

</ul>
</div>
<a id="a_alsobuy_pic_pre" class="btn_a prev_none" style="display:block;"><span class="btn"></span></a>
<a id="alsobuy_pic_next"  class="btn_a next_none" style="display:block;"><span class="btn"></span></a>
</div>
<div class="tab_re">
<div id="tab-other" class="tab-other">
  <ul class='etabs'>
    <li class='tab'><a href="#tabs-detail">图书详情</a></li>
    <li class='tab'><a href="#tabs-commend">图书评价</a></li>
    <li class='tab'><a href="#tabs-dis">图书讨论</a></li>
  </ul>
  <div id="tabs-detail">
    <div class="b_detail">${resultBook.bookInfo}</div>
  </div>
  <div id="tabs-commend">
    <div class="b_detail">
    <c:forEach var="comment" items="${resultBook.comments }">
    	<div class="comment">
    		<div class="pl_photo">
    			<p><img src="/uushop/upload/user/images/${comment.user.photo }"  width="60px" height="60px"/></p>
    			<p class="name">${comment.user.nickname }</p>
    		</div>
    		<div class="title_top">非常喜欢</div>
    		<div class="title">
    			<span class="level">发表于${comment.pdate }</span>
    			<span class="starlevel s5"></span>
    			<span class="time">购买于${comment.bdate }</span>
    		</div>
    		<div class="clear"></div>
    		<div class="s_cont">${comment.content }</div>
    		<div class="operation"><a href="#"><span>赞</span></a><a href="#" class="icon_hf"><span>回复</span></a></div>
    	</div>
    	</c:forEach>
    </div>
  </div>
  <div id="tabs-dis">
     <div class="b_detail"></div>
  </div>
</div>
</div>
</div>

</div>

<jsp:include page="../share/footer.jsp" />
<script type="text/javascript">
$(function(){
	//设置评论边框
	$('.b_detail .comment:last').css('border-bottom','none');
	//购买本商品的顾客还买过  翻页动画
	$('#a_alsobuy_pic_pre').click(function(){
		var marginLeft=$('#targetUL').css('margin-left');
		if(eval(marginLeft.replace(/px/i,''))==0)return;
		$('#targetUL').animate({'margin-left':(eval(marginLeft.replace(/px/i,''))+168)+'px'});
	});
	$('#alsobuy_pic_next').click(function(){
		var marginLeft=$('#targetUL').css('margin-left');
		$('#targetUL').animate({'margin-left':(eval(marginLeft.replace(/px/i,''))-168)+'px'});
	});
});
</script>
</body>
</html>

