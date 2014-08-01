<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>优优图书-商品评价</title>
<script type="text/javascript" src="../js/jquery-1.8.3.js" ></script>
<script charset="utf-8" src="../kindeditor/kindeditor-min.js"></script>
<script charset="utf-8" src="../kindeditor/lang/zh_CN.js"></script>
<script type="text/javascript" src="../js/global.js" ></script>
<link  rel="stylesheet" href="../css/global.css" />
<link  rel="stylesheet" href="../css/card.css" />
<script>
	var editor;
	KindEditor.ready(function(K) {
		editor = K.create('textarea[name="content"]', {
			resizeType : 1,
			newlineTag : 'br',
			allowPreviewEmoticons : false,
			allowImageUpload : false,
			items : [
				'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
				'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
				'insertunorderedlist', '|', 'emoticons', 'image', 'link']
		});
	});
	//添加评论
	function addComment(){
		editor.sync(); 
		if($.trim(editor.html()).length<1)return;
		$('#commentForm').submit();
	}
</script>
</head>
<body>

<%@include file="../share/header2.jsp" %>

<div class="content">

<div class="card">

<div class="clear"></div>
<ul class="shoppingcart_subject" id="ui_shoppingcart_title">
	<li style="width:200px;">图片</li>
    <li class="row1">商品名称</li>
    <li style="width:224px;">价格</li>
    <li class="row4"><span title="在当当价基础上再优惠">&nbsp;&nbsp;&nbsp;优惠&nbsp;&nbsp;&nbsp;</span></li>
</ul>
<table width="960" border="0" cellspacing="0" cellpadding="0" class="card_table">
<tr class="card_tr">
	<td width="200px"><a href="/uushop/book_searchById.do?bid=${bookDetail.bid }" class="bookPic"><img src="/uushop/upload/book/images/${bookDetail.image }"  width="56px" height="56px"/></a></td>
	<td width="395px"><a href="/uushop/book_searchById.do?bid=${bookDetail.bid }">${bookDetail.bname }</a></td>
	<td width="224px"><span class="d_price">¥${bookDetail.price }</span></td>
	<td width="141px">无</td>
</tr>
</table>
<div class="shoppingcart_total" id="div_total" style="">
<form action="/uushop/addComment.do" method="post" id="commentForm">
<input type="hidden" value="${param.bid }" name="bid"/>
<input type="hidden" value="${param.oid }" name="oid"/>
<p style="text-align:left; line-height:32px;">评价内容：</p>
<textarea  name="content" id="pContent" style="width:888px;height:300px;"></textarea>
</form>
    <p id="balance" class="clearfix">
        <a href="javascript:;" name="goon" class="goon" onclick="addComment()">评价</a>
    </p>
</div>


</div>

</div>

<%@include file="../share/footer.jsp" %>
</body>
</html>
