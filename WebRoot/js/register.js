var msg = new Array();
msg[0] = '<span class="error">此手机号已注册,请更换其它手机号</span>';
msg[1] = '<span class="error">内容不能为空</span>';
msg[2] = '<span class="error">邮箱/手机格式不正确,请重新输入</span>';
msg[3] = '<span class="ok"></span>';
msg[4] = '<span class="error">密码长度6-20个字符,请重新输入</span>';
msg[5] = '<span class="error">密码不能包含“空格”,请重新输入</span>';
msg[6] = '<span class="error">两次输入的密码不一致,请重新输入</span>';
msg[7] = '<span class="error">验证码错误</span>';
var cAccount = false;
var cPassword = false;
var cRpassword = false;
var cValcode = false;
var isAgree = false;
function checkAccount() {
	var username = $.trim($('#account').val());
	if (username == '') {
		$('.account_span').html(msg[1]);
		return;
	} else {
		if (!/^\d+$/.test(username)) {
			if (username.length > 40
					|| !/^\w+((\.\w+)|(-\w+))*\@[a-zA-Z0-9]+((\.|-)[a-zA-Z0-9]+)*\.[a-zA-Z0-9]+$/
							.test(username)) {
				$('.account_span').html(msg[2]);
				return;
			}
			cAccount = true;
		} else {
			if (!/^1[3,4,5,8][0-9]{9}$/.test(username)) {
				$('.account_span').html(msg[2]);
				return;
			}
			cAccount = true;
		}
		//判断用户名是否可用
		if(cAccount){
			$.ajax({
				   type: "POST",
				   url: "/uushop/user_exist.do",
				   data: "account="+username,
				   dataType:'html',
				   success: function(msg){
				    if(msg=='true'){
				    	 $('.account_span').html('<span class="error">此手机号已注册,请更换其它手机号</span>');
				    	 return;
				     }
				     $('.account_span').html('<span class="ok"></span>');
				   }
				});
		}
	}
}
function checkPassword() {
	var password = $.trim($('#password').val());
	if (password == '') {
		$('.password_span').html(msg[1]);
		return;
	} else {
		if (password.length < 6 || password.length > 20) {
			$('.password_span').html(msg[4]);
			return;
		}
		if (!/^\S{1,20}$/.test(password)) {
			$('.password_span').html(msg[5]);
			return;
		}
		$('.password_span').html(msg[3]);
		cPassword = true;
	}
}

function checkRpassword() {
	var rpassword = $.trim($('#rpassword').val());
	if (rpassword == '') {
		$('.rpassword_span').html(msg[1]);
		return;
	} else {
		if (rpassword != $.trim($('#password').val())) {
			$('.rpassword_span').html(msg[6]);
			return;
		}
		$('.rpassword_span').html(msg[3]);
		cRpassword = true;
	}
}
function checkValcode() {
	var vcode = $.trim($('#valcode').val());
	if (vcode == '') {
		$('.valcode_span').html(msg[1]);
		return;
	} else {
		if (!/\w{4}/.test(vcode)) {
			$('.valcode_span').html(msg[7]);
			return;
		}
		//判断验证码是否正确
		$.ajax({
			   type: "POST",
			   url: "/uushop/user_checkValcode.do",
			   data: "valcode="+vcode,
			   dataType:'html',
			   success: function(msg){
			    if('true'==msg){
			    	$('.valcode_span').html('<span class="ok"></span>');
					cValcode = true;
					 return;
			     }
			    $('.valcode_span').html('<span class="error">验证码不匹配</span>');
			   }
		});
	}
}
function checkRegister() {
	if ( document.getElementById('isAgree').checked==false) {
		alert('请同意相关条款');
	} else {
		if (cAccount == true && cPassword == true && cRpassword == true
				&& cValcode == true) {
			$('#register_form').submit();
		}
	}
}
function checkMyStrong() {
	var password = $.trim($('#password').val());
	pwStrength(password);
}
function passwordFocus() {
	$('.password_span')
			.html(
					'<table align="center" cellpadding="0" bordercolor="#cccccc" style="display:inline; ">'
							+ ' <tr height="16px">'
							+ ' <td width="40px" align="center" valign="middle" id="strength_L"><font size="2">弱</font></td>'
							+ ' <td width="40px" align="center" valign="middle" id="strength_M"><font size="2">中</font></td>'
							+ '<td width="40px" align="center" valign="middle" id="strength_H"><font size="2">强</font></td>'
							+ '</tr>' + '</table>');
}
// CharMode函数
// 测试某个字符是属于哪一类.
function CharMode(iN) {
	if (iN >= 48 && iN <= 57) // 数字
		return 1;
	if (iN >= 65 && iN <= 90) // 大写字母
		return 2;
	if (iN >= 97 && iN <= 122) // 小写
		return 4;
	else
		return 8; // 特殊字符
}
// bitTotal函数
// 计算出当前密码当中一共有多少种模式
function bitTotal(num) {
	modes = 0;
	var i;
	for (i = 0; i < 4; i++) {
		if (num & 1)
			modes++;
		num >>>= 1;
	}
	return modes;
}
// checkStrong函数
// 返回密码的强度级别
function checkStrong(sPW) {
	if (sPW.length <= 4)
		return 0; // 密码太短
	Modes = 0;
	var i;
	for (i = 0; i < sPW.length; i++) {
		// 测试每一个字符的类别并统计一共有多少种模式.
		Modes |= CharMode(sPW.charCodeAt(i));
	}
	return bitTotal(Modes);
}
// pwStrength函数
// 当用户放开键盘或密码输入框失去焦点时,根据不同的级别显示不同的颜色
function pwStrength(pwd) {
	O_color = "#eeeeee";
	L_color = "#FF0000";
	M_color = "#FF9900";
	H_color = "#33CC00";
	if (pwd == null || pwd == '') {
		Lcolor = Mcolor = Hcolor = O_color;
	} else {
		S_level = checkStrong(pwd);
		switch (S_level) {
		case 0:
			Lcolor = Mcolor = Hcolor = O_color;
		case 1:
			Lcolor = L_color;
			Mcolor = Hcolor = O_color;
			break;
		case 2:
			Lcolor = Mcolor = M_color;
			Hcolor = O_color;
			break;
		default:
			Lcolor = Mcolor = Hcolor = H_color;
		}
	}
	$("#strength_L").css('background-color', Lcolor);
	$("#strength_M").css('background-color', Mcolor);
	$("#strength_H").css('background-color', Hcolor);
}



$(document).ready(function() {
	$('#account').blur(checkAccount);
	$('#password').blur(checkPassword);
	$('#password').keyup(checkMyStrong);
	$('#password').focus(passwordFocus);
	$('#rpassword').blur(checkRpassword);
	$('#valcode').blur(checkValcode);
	$('#register_btn').click(checkRegister);
	//点击图片更换验证码
    $("#Verify").click(function(){
        $(this).attr("src","valcode.do?timestamp="+new Date().getTime());
    });
    $("#myValcode").click(function(){
    	$("#Verify").attr("src","valcode.do?timestamp="+new Date().getTime());
    });
});