<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加商品</title>
<script type="text/javascript" src="../js/jquery-1.8.3.js" ></script>
<script charset="utf-8" src="../kindeditor/kindeditor-min.js"></script>
<script charset="utf-8" src="../kindeditor/lang/zh_CN.js"></script>
<link  rel="stylesheet" href="../css/global.css" />
<link  rel="stylesheet" href="../css/controlContent.css" />
<script>
	var editor;
	KindEditor.ready(function(K) {
		editor = K.create('textarea[name="nContent"]', {
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
	
	function addNotice(){
		var nContent=$.trim(editor.html());
		if(nContent.length<1)
			return;
		$.post('/uushop/addNotice.do',{ncontent:nContent},function(data){
			if(data==0){
				$('.msg.curved li').text('发表公告成功！');
			}else{
				$('.msg.curved li').text('发表公告失败！');
			}
			$('.msg.curved').slideDown(1500,function(){
				$('.msg.curved').slideUp(1500);
			});
			
		});
	}
</script>

</head>

<body>
<div class="msg curved"><ul><li></li></ul></div>
<div id="showGoods">

<div class="box">
<div class="box-head">
    <h2>发布公告</h2>
</div>
<form action="" method="post">
    <div class="form">
    
    <p>
        <span class="req"></span>
        <label>公告内容<span>(必填)</span></label>
        <textarea name="nContent" id="nContent"  style="width:800px;height:200px;visibility:hidden;"></textarea>
    </p>	
   				    
    </div>
    <div class="buttons">
        <input type="reset" class="button" value="重写" />
        <input type="button" onclick="addNotice()" class="button" value="提交" />
    </div>
</form>
</div>

</div>
</body>
</html>
