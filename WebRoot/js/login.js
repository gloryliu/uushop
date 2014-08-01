function checkLogin(){
	var username=$.trim($('#username').val());
	var password=$.trim($('#password').val());
	if(username==''||password==''){
		alert('内容不能为空');
		return;
	}
	$('#login_form').submit();
	$('#login_btn').attr("disabled", true);
}
$(document).ready(function() {
	$('#login_btn').click(checkLogin);
});