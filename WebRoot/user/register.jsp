<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户注册</title>
<script type="text/javascript" src="../js/jquery-1.8.3.js" ></script>
<script type="text/javascript" src="../js/register.js" ></script>
<link  rel="stylesheet" href="../css/global.css" />
<link  rel="stylesheet" href="../css/register.css" />
</head>

<body>

<%@ include file="../share/header2.jsp" %>

<div class="content">
<div class="register_div">
<div class="register_head"><p>注册新用户</p></div>
<div class="register_body">
<form action="/uushop/userRegister.do" method="post" id="register_form">
  <table width="958" border="365" cellspacing="0" cellpadding="0" id="register_table">
    <tr>
      <td class="t">邮箱/手机号码：</td>
      <td width="293px"><input type="text" name="account" id="account"  class="input1"/></td>
      <td  class="account_span">邮箱/手机号码为用户名,并用于找回密码,接收订单通知等服务</td>
    </tr>
    <tr>
      <td class="t">登录密码：</td>
      <td><input type="password" name="password" id="password"  class="input1" /></td>
      <td class="password_span">密码为6-20个字符,可由英文、数字及符号组成</td>
    </tr>
    <tr>
      <td class="t">确认密码：</td>
      <td><input type="password" name="rpassword" id="rpassword"  class="input1"/></td>
      <td class="rpassword_span">请再次输入密码</td>
    </tr>
    <tr >
      <td class="t">图形验证码：</td>
      <td><input type="text" name="valcode" id="valcode"  class="input1"/></td>
      <td class="valcode_span">请输入图片中的字符,不区分大小写</td>
    </tr>
    <tr class="register_val">
      <td class="t"></td>
      <td><img src="valcode.do" id="Verify"  style="cursor:pointer;" alt="看不清，换一张" align="absmiddle"/>&nbsp;&nbsp;
      <a href="javascript:void(0);" id="myValcode">看不清，换一张</a>
      </td>
      <td><s:token /></td>
    </tr>
    <tr >
      <td class="t">&nbsp;</td>
      <td><input type="button" id="register_btn" /></td>
      <td>已有帐号?&nbsp;&nbsp;<a href="login.jsp">立即登录</a></td>
    </tr>
    <tr>
      <td class="t">&nbsp;</td>
      <td><input type="checkbox"  checked="checked" name="isAgree" id="isAgree"/>我已阅读并同意优优商城交易条款</td>
      <td>&nbsp;</td>
    </tr>
  </table>
 </form>
</div>
</div>
</div>

<div class="footer">
<div class="footer_div">
<p><a href="javascript:void(0);">公司简介</a>|<a href="javascript:void(0);">诚征英才</a>|<a href="javascript:void(0);">网站联盟</a>|<a href="javascript:void(0);">网站联盟</a>|<a href="javascript:void(0);">百货招商</a>|<a href="javascript:void(0);">官方Blog</a></p><br/>
<p>Copyright优优图书商城2004-2013,author_liaoyu，版权所有</p>
</div>
</div>
</body>
</html>
