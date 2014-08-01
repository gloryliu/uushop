<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改商品信息</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui-1.10.2.custom.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/global.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/controlContent.css" />
</head>

<body>
<div class="msg curved"><ul><s:iterator value="actionMessages"><li><s:property /></li></s:iterator></ul></div>
<div id="showGoods">
<div class="box">
<div class="box-head">
    <h2>添加新商品</h2>
</div>
<form action="${pageContext.request.contextPath}/book_editBook.do?bid=${book.bid}" enctype="multipart/form-data" id="addBookForm" method="post">
    <div class="form">
    <p class="form_box_p margin_right1">
        <span class="req">最多50个字</span>
        <label>商品名称<span>(必填)</span></label>
        <input name="bname" id="bname" type="text" class="field size4"  value="${ book.bname}"/>
        <span class="clear"></span>
    </p>	
    <p class="form_box_p">
        <span class="req">单位为元</span>
        <label>商品价格<span>(必填)</span></label>
        <input name="price" id="price" type="text" class="field size4"  value="${ book.price}"/>
        <span class="clear"></span>
    </p>
    <p class="form_box_p margin_right1">
        <span class="req"></span>
        <label>图书作者<span>(必填)</span></label>
        <input name="author" id="author" type="text" class="field size4"  value="${ book.author}"/>
        <span class="clear"></span>
    </p>
    <p class="form_box_p">
        <span class="req"></span>
        <label>出版商<span>(必填)</span></label>
        <input name="publishCompany" id="publishCompany" type="text" class="field size4"  value="${ book.publishCompany}"/>
        <span class="clear"></span>
    </p>	
    <p class="form_box_p margin_right1">
        <span class="req">格式为：2012/3/23</span>
        <label>出版日期<span>(必填)</span></label>
        <input name="publishDate" id="publishDate" type="text" class="field size4" value="${ book.publishDate}"/>
        <span class="clear"></span>
    </p>	
    <p class="form_box_p">
        <span class="req">图片大小小于1M</span>
        <label>上传图片<span>(非必填)</span></label>
        <input name="bimage" id="image" type="file" class="field size4" />
        <input name="image" id="image" type="hidden" value="${ book.image}" />
        <span class="clear"></span>
    </p>	
    <div class="clear" ></div>
    <p class="inline-field" >
       <label>商品类别<span>(必填)</span></label>
       <input type="text" name="btype" id="bType" class="field size3" style="text-align:left;"  value="${ book.bookType.bType}"/>
       <input type="text" name="stype" id="sType" class="field size3"  value="${ book.bookType.sType}"/>
        <span class="clear"></span>
    </p>   
    <p>
        <span class="req"></span>
        <label>商品描述<span>(非必填)</span></label>
        <textarea name="bookInfo" id="bookInfo"  style="width:820px;height:100px;">${ book.bookInfo}</textarea>
    </p>	 				    
    </div>
    <div class="buttons">
        <input type="button"  class="button" value="取消" onclick="history.back();"/>
        <input type="submit" id="addBookBtn" class="button" value="提交" />
    </div>
</form>
</div>

</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui-1.10.2.custom.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/kindeditor/kindeditor-min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/kindeditor/lang/zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/addBook.js" ></script>
<script>
	var editor;
	KindEditor.ready(function(K) {
		editor = K.create('textarea[name="bookInfo"]', {
			resizeType :2,
			newlineTag : 'br',
			allowPreviewEmoticons : true,
			allowImageUpload : true,
			items : [
				'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
				'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
				'insertunorderedlist', '|', 'emoticons', 'image', 'link']
		});
	});
</script>

</body>
</html>
