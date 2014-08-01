<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>优优图书-个人信息</title>
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
<span>修改</span>
</div>
<!-- Position End -->

<!-- left Start -->
<div class="content_left">
<div class="user_center">
<ul>
<li class="user_center_header"><h3 class="left_title">我的交易</h3><a class="slideUp"></a>
    <ul>
    	<li><a href="getMyOrder.do">我的订单</a></li>
        <li><a href="book_getCollect.do">我的收藏</a></li>
        <li><a href="getHavePayOrder.do">已购图书</a></li>
    </ul>
</li>
<li class="user_center_header"><h3 class="left_title">我的帐号</h3><a class="slideUp"></a>
    <ul>
    	<li><a href="#">我的礼券</a></li>
        <li><a href="#">我的积分</a></li>
    </ul>
</li>
<li class="user_center_header"><h3 class="left_title">个人信息</h3><a class="slideUp"></a>
    <ul>
    	<li><a href="#">修改头像</a></li>
        <li><a href="#">详细信息</a></li>
        <li><a href="#">地址管理</a></li>
    </ul>
</li>
</ul>
</div>
</div>
<!-- left End -->

<!-- right Start -->
<div class="content_right">
<div class="user_right_div">
<!-- 显示个人基本信息开始 -->
<div class="info_left">
<p class="info_p">未读信息：<font color="#FF0000"><a href="#">${sessionScope.user.messageCount }</a></font>条</p>
<div class="ope_div"><a href="#" class="btn7 mini_btn" id="editNicknameBtn" onclick="setNicknameEditable()">修改</a></div>
<p class="info_p">昵称：<input  readonly="readonly" type="text" class="input4" id="showNickname" value="${sessionScope.user.nickname }"/></p>
<p>注册邮箱：${sessionScope.user.account }</p>
<p class="info_p">积分：0</p>
<p><a href="javascript:;" onclick="showPasswordDiv();">修改密码</a></p>
<div id="change_password_div" style="width:460px; height:200px; display:none;">
<p class="info_p"><span class="cpassword_span">当前密码：</span><input type="password" name="password" id="password" class="input4" /></p>
<p class="info_p"><span class="cpassword_span">输入新密码：</span><input type="password" name="npassword" id="npassword" class="input4" /></p>
<p class="info_p"><span class="cpassword_span">再次输入密码：</span><input type="password" name="rnpassword" id="rnpassword" class="input4" /></p>
<div class="ope_div"><a href="#" class="btn7 mini_btn" onclick="changePassword()">完成</a></div>
</div>
</div>
<!-- 显示个人基本信息结束 -->
<!-- 修改头像开始 -->
<div class="info_right">
<form action="${pageContext.request.contextPath}/user_updatePhoto.do" enctype="multipart/form-data" id="updatePhotoForm" method="post">
<!--  
	<a href="javascript:void(0);" class="btn_addPic"><span><em>+</em>添加图片</span><input tabindex="3" title="支持jpg、jpeg、gif、png格式，文件小于5M" size="3" name="pic" class="filePrew" type="file"></a>
-->
	<input type="file"  id="header_file" name="image"/>
	<input type="hidden" value="${sessionScope.user.uid }" id="user_id" name="uid"/> 
	<a href="#" class="btn7 mini_btn" style="float:right; position:absolute; right:40px;" onclick="uploadPhoto()">完成</a>
</form>
<p class="info_p" style="padding-left:22px;">当前头像&nbsp;&nbsp;<a href="javascript:;" onclick="changePhoto()">点击修改</a></p>
<div class="user_header curved"><a href="javascript:;" onclick="changePhoto()">
<img src="/uushop/upload/user/images/${sessionScope.user.photo }"  width="200px" height="200px;" title="点击修改头像" alt="我的头像"/>
</a></div>
</div>
<!-- 修改头像结束 -->
</div>
</div>
<!-- right End -->
</div>
<!-- Content Start -->

<!-- footer Start -->
<jsp:include page="/share/footer.jsp" />
<!-- footer End -->
</body>
</html>
