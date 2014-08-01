/**
控制后台菜单
*/
$(document).ready(function(){
	$('.menuitem').click(function(){
		var nowId=$(this).attr('id');
		//$('#'+nowId+'2').toggleClass('on');
		$('#'+nowId+'2').slideToggle();
		$('#'+nowId+' .statusicon').toggleClass('on');
		//$('#'+nowId+' .statusicon').attr('src','../images/minus.gif');
	});
});