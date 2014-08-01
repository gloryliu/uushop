<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<p id="back-to-top"><a href="#top" ><span></span>回到顶部</a></p>

<div class="tools" >
<div class="tools_content">
<ul class="tools_right" >
<li class="tools_myCard"><a href="${pageContext.request.contextPath }/card/card_books.jsp">购物车</a></li>
<li class="tools_myBook"><a href="#">我的图书</a>
<ul class="nav2"><li><a href="/uushop/getHavePayOrder.do">已经购买</a></li><li><a href="/uushop/book_getCollect.do">我的收藏</a></li></ul>
</li>
<li><a href="#">自助服务</a></li>
<li><a href="#">投诉与建议</a></li>
<li><a href="#">优优服务</a></li>
<li class="tools_right_last"><a href="javascript:;"  onclick="window.external.addFavorite('http://localhost/uushop','优优图书商城')">加入收藏</a></li>
</ul>
<p class="tools_left">
欢迎来到优优商城&nbsp;&nbsp;
<s:if test="#session.user==null">
<a href="${pageContext.request.contextPath}/user/login.jsp">登录</a>&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/user/register.jsp">免费注册</a>
</s:if>
<s:else>
亲爱的<a href="${pageContext.request.contextPath}/user/userCenter.jsp" ><font color="#00F"><s:property value="#session.user.nickname"/></font></a>你好&nbsp;&nbsp;
<a href="/uushop/user_logout.do"  style="color:#f00">注销</a>
</s:else>
</p>
</div>
<input type="hidden" value="${sessionScope.user.uid }" id="userid"/>
</div>



<div class="logo_content">
<a href="${pageContext.request.contextPath}/index.jsp" class="logo_bg"><img src="/uushop/images/logo.png" /></a>
<a href="#" class="adv_b1"><img src="/uushop/images/a1.png" /></a>
</div>

<div class="nav_all">
<p class="nav_content">
<a href="javascript:;" >特价图书</a><a href="view/index.jsp" >在线阅读</a>
<a href="javascript:;" class="search-type"> 青春文学</a><a href="javascript:;" class="search-type">小说</a>
<a href="javascript:;" class="search-type"> 数据库</a><a href="javascript:;" class="search-type">编程语言</a>
<a href="javascript:;" class="search-type"> 艺术</a><a href="javascript:;" class="search-type">心理学</a>
</p>
</div>
