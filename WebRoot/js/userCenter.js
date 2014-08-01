// JavaScript Document
//修改密码
function showPasswordDiv(){
	$('#change_password_div').toggle();
}
//修改头像
function changePhoto(){
	$('#header_file').click();
}
//修改昵称
function setNicknameEditable(){
	$('#showNickname').removeAttr("readonly");
	$('#showNickname').focus();
	$('#editNicknameBtn').before('<a href="#" class="btn7 mini_btn" onclick="changeNickname()">完成</a>');
}
function changeNickname(){
	var nickname=$.trim($('#showNickname').val());
	var uid=$.trim($('#user_id').val());
	$.post('/uushop/user_changeNickname.do',{nickname:nickname,uid:uid},function(data){
		if(data==0){
			alert("更新成功");
			window.location.reload();
		}
		else if(data==2){
			alert("非常抱歉，系统异常");
		}
	});
}
//修改密码
function changePassword(){
	var password=$.trim($('#password').val());
	var npassword=$.trim($('#npassword').val());
	var rnpassword=$.trim($('#rnpassword').val());
	var uid=$.trim($('#user_id').val());
	if(password.length<1||npassword.length<1||rnpassword.length<1){
		alert('密码不能为空');
		return;
	}
	if(npassword!=rnpassword){
		alert('重复密码不一致');
		return;
	}
	$.post('/uushop/user_changePassword.do',{password:password,uid:uid,npassword:npassword},function(data){
		if(data==0){
			alert("更新成功");
			window.location.reload();
		}
		else if(data==2){
			alert("非常抱歉，系统异常");
		}
		else if(data==1){
			alert("请将信息填写完整");
		}
		else if(data==3){
			alert("您输入的密码错误，无法进行修改");
		}
		else alert(data);
	});
}
//修改头像
function uploadPhoto(){
	var image=$.trim($('#header_file').val());
	if(image.length>0){
		$('#updatePhotoForm').submit();
	}
}

$(document).ready(function(){
	$('.slideUp').click(function(){
		$(this).toggleClass('slideDown');
		$(this).next().toggle();
	});	

});





