<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%@ include file="header2.jsp" %>

<div class="nav_top">
<div class="search_all">
<form action="searchAction.do" method="post" class="search_form">
<input type="text" class="search_content" name="keyWord" />
<select class="search_option">
<option>全部搜索</option>
</select>
<input type="button" value="搜索" class="search_btn" onclick="checkSearchInput();"/>
</form>
</div>
<p class="search_help">
<a href="#">高级搜索</a>&nbsp;&nbsp;热搜：<a href="#">沉默的羔羊</a>&nbsp;&nbsp;<a href="#">德州电锯杀人狂</a>&nbsp;&nbsp;<a href="#">人间失格</a>&nbsp;&nbsp;<a href="#">人生</a>&nbsp;&nbsp;<a href="#">兄弟</a>
</p>
</div>
<script>
function checkSearchInput(){
	var content=$.trim($('.search_content').val());
	if(content.length<2){
		$('.search_form').css({'border-color':'#f00'});
		return;
	}
	$('.search_form').submit();
}
</script>