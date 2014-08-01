<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<s:if test="#request.allBookType==null">
	<c:redirect url="IndexAction.do"></c:redirect> 
</s:if>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>优优图书</title>
<link  rel="stylesheet" href="./css/global.css" />
<link  rel="stylesheet" href="./css/index.css" />
</head>
<body>
<%@include file="./share/header.jsp" %>
<div class="content">

<div class="content_left">
<div class="all_div">
<p class="all_title">所有分类</p>
<div class="all_content">
<s:iterator value="#request.allBookType" >
<h3><s:property value="key"/></h3>
<div class="category"><s:iterator  value="value"><a href="javascript:;" class="search-type"><s:property /></a></s:iterator></div>
</s:iterator>
</div>
</div>

<div class="all_div">
<p class="all_title">系统公告</p>
<div class="all_content">
<div class="reBooks" style="height:140px;color:#e00">
<MARQUEE onmouseover=this.stop() onmouseout=this.start() direction=up height=130 width=172 scrollAmount=3  border="0">
${requestScope.nContent }
</MARQUEE>
</div>
</div>
</div>

<div class="all_div">
<p class="all_title">推荐功能</p>
<div class="all_content">
<div class="reBooks" style="height:100px;">
	<ul class="recommend_function">
    	<li class="first"><a href="view/index.jsp" title="在线读书">
        	<span class="icon" style="background:url(images/icon_19x16_01.png)"></span>
            <span>在线读书</span>
        </a></li>
    	<li><a href="#" title="读书社区">
        	<span class="icon" style="background:url(images/icon_19x16_02.png)"></span>
            <span>读书社区</span>
        </a></li>
    </ul>
</div>
</div>
</div>

<div class="all_div">
<p class="all_title">今日图书</p>
<div class="all_content">
<div class="reBooks">
<ul>
<c:forEach var="book" items="${requestScope.lastlyBook }">
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
<p class="all_title">今日作家</p>
<div class="all_content">
<div class="reBooks">
<ul>
<li>
<a class="author_photo" href="#"><img src="./images/author1.jpg"/></a>
<div class="author_name2"><a href="#">张小娴</a></div>
</li>
<li>
<a class="author_photo" href="#"><img src="./images/author2.jpg"/></a>
<div class="author_name2"><a href="#">郭敬明</a></div>
</li>
<li>
<a class="author_photo" href="#"><img src="./images/author3.jpg"/></a>
<div class="author_name2"><a href="#">巴金</a></div>
</li>

<li>
<a class="author_photo" href="#"><img src="./images/author7.jpg"/></a>
<div class="author_name2"><a href="#">汪曾祺</a></div>
</li>
</ul>
</div>
</div>
</div>

</div>

<div class="content_right">
<div class="pic_show">
	<ul id="slides">
			<li>
				<a href="#"><img src="./images/d1.jpg" width="760" height="270" alt="Pic Mgmt" /></a>				
			</li>
			<li>
				<img src="./images/d2.jpg" width="760" height="270" alt="Pic Lcd" />
			</li>
			<li>
				<img src="./images/d3.jpg" width="760" height="270" alt="Pic Montreal" />
			</li>
			<li>
				<img src="./images/d4.jpg" width="760" height="270" alt="Pic Gorillaz" />
			</li>
	</ul>
</div>

<div class="tab_hot">
<div id="tab-container" class="tab-container">
  <ul class='etabs'>
    <li class='tab'><a href="#tabs-hot">热门图书</a></li>
    <li class='tab'><a href="#tabs-comment">评论最多</a></li>
    <li class='tab'><a href="#tabs-store">收藏最多</a></li>
  </ul>
  <div id="tabs-hot">
    <div class="hot_book">
   	<div class="detail">
        	<div class="pic"><a href="#"><img src="images/bigheader1.jpg" /></a></div>
            <p class="book_title"><a href="#">人间失格</a></p>
            <p>作 者：太宰治 </p>
            <p>出版社：武汉出版社</p>
            <p class="price">价格：<span class="price_d">¥<em>15.20</em></span></p>
            <p class="description">与川端康成，三岛由纪夫并驾齐驱的战后日本文学巨匠日本无赖派的代表作家，日本乃至世界的影响力作家《人间失格》既是遗作</p>
        </div> 
        <ul class="book_ul">
	    	<c:forEach var="book" items="${requestScope.bestSellerBooks }" begin="0" end="5">
	        	<li>
	            	<div class="pic"><a href="${pageContext.request.contextPath }/book_searchById.do?bid=${book.bid }"><img src="/uushop/upload/book/images/${book.image }"  title="${book.bname }" width="120px" height="120px"/></a></div>
	                <p class="title"><a href="${pageContext.request.contextPath }/book_searchById.do?bid=${book.bid }">${book.bname }</a></p>
	                <p class="price">¥${book.price}</p>
	            </li>
			</c:forEach>
        </ul>
    </div>
  </div>
  <div id="tabs-comment">
    <div class="comment_book">
    	<ul class="book_ul">
    	<c:forEach var="book" items="${requestScope.bestCommentBooks }">
        	<li>
            	<div class="pic"><a href="${pageContext.request.contextPath }/book_searchById.do?bid=${book.bid }"><img src="/uushop/upload/book/images/${book.image }"  title="${book.bname }" width="120px" height="120px"/></a></div>
                <p class="title"><a href="${pageContext.request.contextPath }/book_searchById.do?bid=${book.bid }">${book.bname }</a></p>
                <p class="price">¥${book.price}</p>
            </li>
		</c:forEach>
        </ul>    
    </div>
  </div>
  <div id="tabs-store">
    <div class="store_book">
     	<ul class="book_ul">
    	<c:forEach var="book" items="${requestScope.bestCollectBooks }">
        	<li>
            	<div class="pic"><a href="${pageContext.request.contextPath }/book_searchById.do?bid=${book.bid }"><img src="/uushop/upload/book/images/${book.image }"  title="${book.bname }" width="120px" height="120px"/></a></div>
                <p class="title"><a href="${pageContext.request.contextPath }/book_searchById.do?bid=${book.bid }">${book.bname }</a></p>
                <p class="price">¥${book.price}</p>
            </li>
		</c:forEach>
        </ul>       
    </div>
  </div>
</div>
</div>

<div class="showOthers">
<div class="book_guess_top">
  <h2>推荐图书</h2>
</div>
<div class="book_guess_content_panel">
	<div class="recommend">
    	<div class="num num1"></div>
        <div class="pic"><a target="_blank" href="#"><img src="images/bigheader2.jpg" /></a></div>
        <div class="description_content">
            <p class="title">
                <a target="_blank" href="#" title="中国手语：修订版（上下册）（全二册）">平凡的世界</a>
            </p>
            <p>作&nbsp;&nbsp;者：路遥</p>
            <p>出版社：北京十月文艺出版社</p>
            <p class="price"><span class="price_d">¥<em>51.50</em></span><span class="discount">7.2折</span></p>
            <p class="tip">茅盾文学奖皇冠上的明珠，激励千万青年的不朽经典，最受老师和学生喜爱的新课标必读书。</p>
        </div>
    </div>
    <ul class="book_ul">
    	<c:forEach var="book" items="${requestScope.recommendBooks }" begin="0" end="4">
        	<li>
            	<div class="pic"><a href="${pageContext.request.contextPath }/book_searchById.do?bid=${book.bid }"><img src="/uushop/upload/book/images/${book.image }"  title="${book.bname }" width="120px" height="120px"/></a></div>
                <p class="title"><a href="${pageContext.request.contextPath }/book_searchById.do?bid=${book.bid }">${book.bname }</a></p>
                <p class="price">¥${book.price}</p>
            </li>
		</c:forEach>
    </ul>
</div>
</div>
<div class="showOthers">
<div class="book_guess_top">
  <h2>猜你喜欢</h2>
</div>
<div class="book_guess_content_panel">
    <ul class="book_ul">
        <li>
            <div class="pic"><a href="#"><img src="./images/maylike1.jpg" width="100px" height="100px"/></a></div>
            <p class="title"><a href="#">白夜行</a></p>
            <p class="price">¥29.80</p>
        </li>
        <li>
            <div class="pic"><a href="#"><img src="./images/maylike2.jpg" width="100px" height="100px"/></a></div>
            <p class="title"><a href="#">幻夜</a></p>
            <p class="price">¥22.80</p>
        </li>
        <li>
            <div class="pic"><a href="#"><img src="./images/maylike3.jpg" width="100px" height="100px"/></a></div>
            <p class="title"><a href="#">新参者</a></p>
            <p class="price">¥20.80</p>
        </li>
        <li>
            <div class="pic"><a href="#"><img src="./images/maylike4.jpg" width="100px" height="100px"/></a></div>
            <p class="title"><a href="#">毕业</a></p>
            <p class="price">¥20.50</p>
        </li>
        <li>
            <div class="pic"><a href="#"><img src="./images/maylike5.jpg" width="100px" height="100px"/></a></div>
            <p class="title"><a href="#">比特币</a></p>
            <p class="price">¥15.60</p>
        </li>
        <li>
            <div class="pic"><a href="#"><img src="./images/maylike6.jpg" width="100px" height="100px"/></a></div>
            <p class="title"><a href="#">一个陌生女人的来信</a></p>
            <p class="price">¥20.00</p>
        </li>
        <li>
            <div class="pic"><a href="#"><img src="./images/maylike7.jpg" width="100px" height="100px"/></a></div>
            <p class="title"><a href="#">起风了</a></p>
            <p class="price">¥26.00</p>
        </li>
        <li>
            <div class="pic"><a href="#"><img src="./images/maylike8.jpg" width="100px" height="100px"/></a></div>
            <p class="title"><a href="#">死亡如此多情</a></p>
            <p class="price">¥12.00</p>
        </li>
        <li>
            <div class="pic"><a href="#"><img src="./images/maylike9.jpg" width="100px" height="100px"/></a></div>
            <p class="title"><a href="#">他是否还在人间</a></p>
            <p class="price">¥6.00</p>
        </li>
        <li>
            <div class="pic"><a href="#"><img src="./images/maylike10.jpg" width="100px" height="100px"/></a></div>
            <p class="title"><a href="#">丢失的谎言</a></p>
            <p class="price">¥12.00</p>
        </li>
    </ul></div>
</div>
<div class="showOthers">
<div class="book_guess_top">
  <h2>推荐作家</h2>
</div>
<div class="book_guess_content_panel">
	<div class="hot_author">
    	<div class="num"><span></span></div>
        <div class="pic"><a href="javascript:void(0);" class="none"><img alt="" src="images/author6.jpg" width="100px" height="120px"></a></div>
        <div class="author_detail">
            <p class="author_name"><a href="#">三毛</a></p>
            <p class="author_info">本名陈懋平，因为学不会写"懋＂字，就自己改名为陈平。十三岁就跷家去小琉球玩，初中时逃学去坟墓堆读闲书。旅行和读书是她生命中的两颗一级星，最快乐与最疼痛都夹杂其中。</p>
        </div>
        <div class="clear"></div>
        <p style="margin-top:30px; margin-bottom:30px;">作品：</p>
        <div class="author_books">
        	<div class="pic">
        	<a href="#"><img src="images/likebook1.jpg" /></a>
            </div>
            <p class="title"><a href="#">撒哈拉的故事</a></p>
            <p class="price"><span class="price_d">¥<em>15.60</em></span><span class="discount">60折</span></p>
        </div>
        <div class="author_books">
        	<div class="pic">
        	<a href="#"><img src="images/likebook2.jpg" /></a>
            </div>
            <p class="title"><a href="#">温柔的夜</a></p>
            <p class="price"><span class="price_d">¥<em>16.50</em></span><span class="discount">60折</span></p>
        </div>
    </div>
	<div id="rmzz_text">
		<ul>
        	<li><a href="#">几米</a></li>
            <li><a href="#">张小娴</a></li>
            <li><a href="#">高木直子</a></li>
            <li><a href="#">三毛</a></li>
            <li><a href="#">韩寒</a></li>
        	<li><a href="#">几米</a></li>
            <li><a href="#">张小娴</a></li>
            <li><a href="#">高木直子</a></li>
            <li><a href="#">三毛</a></li>
            <li class="last"><a href="#">韩寒</a></li>
        </ul>
    </div>
</div>
</div>


</div>
</div>

<%@include file="./share/footer.jsp" %>
<script type="text/javascript" src="./js/jquery-1.8.3.js" ></script>
<script type="text/javascript" src="./js/jquery.bxslider2.min.js" ></script>
<script type="text/javascript" src="./js/jquery.hashchange.min.js"></script>
<script type="text/javascript" src="./js/jquery.easytabs.min.js"></script>
<script type="text/javascript" src="./js/global.js" ></script>
<script type="text/javascript" src="./js/index.js" ></script>
<script>
//alert(document.cookie);
</script>
</body>
</html>
