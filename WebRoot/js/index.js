$(function(){
	$('#slides').bxSlider({
		prev_image: './images/btn_arrow_left.png',
		next_image: './images/btn_arrow_right.png',
		wrapper_class: 'slides_wrap',
		margin: 70,
		auto: true,
		auto_controls: false
	});
	/*tab事件*/
	$('#tab-container').easytabs({
		animate:false,		
		cycle: 5000	
	});
	/*去除分类中第一个顶部的边线*/
	$('.all_div .all_content>h3').css('border-top','none');
	/*去除分类中最后一个的边线*/
	$('.all_div .all_content .category a:last-child').css('background','none');
	

});