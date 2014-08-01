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
<div style="margin-top:80px;" ></div>
<form method="post" action="/uushop/findPassword_resetPassword.do" id="resetPasswordForm">
<table width="400" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="40">输入密码：</td>
    <td height="40" align="left"><label for="password"></label>
      <input name="password" type="password" class="input4" id="password" /></td>
  </tr>
  <tr>
    <td height="40">确认密码：</td>
    <td height="40" align="left"><label for="rpassword"></label>
      <input  type="password" class="input4" id="rpassword" /></td>
  </tr>
  <tr>
    <td height="40">&nbsp;</td>
    <td height="40" align="left"><a href="#" class="btn7 mini_btn"  onclick="resetPassword();">提交</a></td>
  </tr>
</table>
<input type="hidden" value="${param.username }" name="username" />
</form>
</div>

<!-- right End -->
</div>
<!-- Content end -->

<!-- footer Start -->
<jsp:include page="/share/footer.jsp" />
<!-- footer End -->
<script type="text/javascript">
function resetPassword(){
	var password=$.trim($('#password').val());
	var rpassword=$.trim($('#rpassword').val());
	if(password.length<1||rpassword.length<1){
		alert("请将密码填写完整!");
		return;
	}	
	if(password!=rpassword){
		alert("俩次密码必须相同!");
		return;
	}
	if (password.length < 6 || password.length > 20) {
		alert("密码格式需合法!");
		return;
	}
	$('#resetPasswordForm').submit();
}
</script>
</body>
</html>
