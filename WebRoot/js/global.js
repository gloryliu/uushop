	
/*	// 图片预加载
	function loadImage(url, callback) {
		var img = new Image(); // 创建一个Image对象，实现图片的预下载
		img.src = url;

		if (img.complete) { // 如果图片已经存在于浏览器缓存，直接调用回调函数
			callback.call(img);
			return; // 直接返回，不用再处理onload事件
		}
		img.onload = function() { // 图片下载完毕时异步调用callback函数。
			callback.call(img);// 将回调函数的this替换为Image对象
		};
	}*/

$(document).ready(function() {
	// 首先将#back-to-top隐藏
	$("#back-to-top").hide();
	// 当滚动条的位置处于距顶部100像素以下时，跳转链接出现，否则消失
	$(function() {
		$(window).scroll(function() {
			if ($(window).scrollTop() > 300) {
				$("#back-to-top").fadeIn(1500);
			} else {
				$("#back-to-top").fadeOut(1500);
			}
		});
		// 当点击跳转链接后，回到页面顶部位置
		$("#back-to-top").click(function() {
			$('body,html').animate({
				scrollTop : 0
			}, 200);
			return false;
		});
	});
	/*顶部导航下拉菜单*/
	$(".tools_right>li:last").css('border','none');
	 var li = $(".tools_right>li"); //找到tools_right中子元素li；
	 li.each(function(i){ //循环每一个LI
	  li.hover(
	   function(){
		$(this).find("ul").show(); //找到li里面的ul元素设置为显示
	   },
	   function(){
		$(this).find("ul").hide(); 
	   }
	  );
	 });
	 //给所有图片设置默认
	 $('img').error(function(){
		 $(this).attr('src','/uushop/images/default.jpg');
	 });
	 //绑定搜索功能
	 $('.search-type').click(function(){
		 var searchContent=$.trim($(this).text());
		 $('.search_content').val(searchContent);
		 $('.search_form').submit();
	 });
});