<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>优优图书-忘记密码</title>
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
<a href="#" target="_blank">个人信息</a>&nbsp;&gt;&nbsp;
<span>忘记密码</span>
</div>
<!-- Position End -->

<!-- right Start -->

<div class="user_unlogin">
<div class="send_email_div">
<form id="sendMailForm" method="post" action="/uushop/findPassword_sendEmail.do">
<p class="info_p" style="margin-bottom:20px;">输入注册时的邮箱：<input type="text" class="input4" name="username" id="username" /></p>
<a href="#" class="mini_btn btn7" style="margin-left:70px;" onclick="sendEmail()">发送</a>
</form>
</div>
</div>

<!-- right End -->
</div>
<!-- Content end -->

<!-- footer Start -->
<jsp:include page="/share/footer.jsp" />
<!-- footer End -->
<script type="text/javascript">
function sendEmail(){
	var email=$.trim($('#username').val());
	if(email.length<1){
		alert("请填写邮箱地址");
		return;
	}
	if(!/^\w+((\.\w+)|(-\w+))*\@[a-zA-Z0-9]+((\.|-)[a-zA-Z0-9]+)*\.[a-zA-Z0-9]+$/.test(email)){
		alert("请输入合法的邮箱地址");
		return;
	}
	$('#sendMailForm').submit();
}
</script>
</body>
</html>
