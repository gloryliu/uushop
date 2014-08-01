
//根据调整图书数量进行价格变化
function reductCount(){
	var nowCount=$.trim($('.input_mini').val());
	if(nowCount>1){
		$('.input_mini').val(nowCount-1);
		var itemPrice=$('.item_price').text();
		$('.allPrice').text('¥'+(itemPrice.substring(1,itemPrice.lenght)*$('.input_mini').val()).toFixed(1));
	};
}
function addCount(){
	var nowCount=eval($.trim($('.input_mini').val()));
	$('.input_mini').val(nowCount+1);
	var itemPrice=$('.item_price').text();
	$('.allPrice').text('¥'+(itemPrice.substring(1,itemPrice.lenght)*$('.input_mini').val()).toFixed(1));
}
/*检查信息提示是否为空 然后提示*/
function alertMsg(){
	if($.trim($('.msg2.curved').text())!=""){
		$('.msg2.curved').slideDown(1500,function(){
			$('.msg2.curved').slideUp(1500);
		});		
	}
}
//收藏图书
function addCollect(){
	var bid=$.trim($('uumark').text());
	$.post("/uushop/book_addCollect.do","bid="+bid,function(data){$('.msg2.curved ul li').text(data);alertMsg();},"text");
}
//购买图书 数量   ID 
//8.64e7 一天 3.6e6 一小时
function buyBook(){
	var bid=$.trim($('uumark').text());		//图书ID
	var count=$.trim($('.input_mini').val());		//图书对应的数量
	var image=encodeURIComponent ($.trim($('#book_image').attr("src")));	//图书的图片
	var bname=escape($.trim($('.bookTitle').text()));	//图书名称
	var startPrice=$.trim($('.item_price').text());
	var price=startPrice.substring(1,startPrice.length);	//图书的价格
	//获取当前时间 
	var date=new Date(); 
	var expiresDays=7; 
	//将date设置为10天以后的时间 
	date.setTime(date.getTime()+expiresDays*8.64e7);
	//cookie样式 bid=2_4; count=1_1 image  bname
	var allCookie=document.cookie;    //alert(allCookie);
	if(allCookie!=null){
		var cookieArray=allCookie.split('; ');
		var idCookie='';
		var countCookie='';
		var imageCookie='';
		var bnameCookie='';
		var priceCookie='';
		for(var i=0;i<cookieArray.length;i++){
			if($.trim(cookieArray[i]).length>0){
				var cookieSet=cookieArray[i].split('=');
				if(cookieSet[0]=='bid')idCookie=cookieSet[1]+'_'+bid;
				else if(cookieSet[0]=='count')countCookie=cookieSet[1]+'_'+count;
				else if(cookieSet[0]=='image')imageCookie=cookieSet[1]+'_'+image;
				else if(cookieSet[0]=='bname')bnameCookie=cookieSet[1]+'_'+bname;
				else if(cookieSet[0]=='price')priceCookie=cookieSet[1]+'_'+price;
			}
		}
		if(idCookie.length<1){
			document.cookie='bid='+bid+'; expires='+date.toGMTString()+' ;path=/';
			document.cookie='count='+count+'; expires='+date.toGMTString()+' ;path=/';
			document.cookie='image='+image+'; expires='+date.toGMTString()+' ;path=/';
			document.cookie='bname='+bname+'; expires='+date.toGMTString()+' ;path=/';
			document.cookie='price='+price+'; expires='+date.toGMTString()+' ;path=/';
		}else{
			document.cookie='bid='+idCookie+'; expires='+date.toGMTString()+' ;path=/';
			document.cookie='count='+countCookie+'; expires='+date.toGMTString()+' ;path=/';
			document.cookie='image='+imageCookie+'; expires='+date.toGMTString()+' ;path=/';
			document.cookie='bname='+bnameCookie+'; expires='+date.toGMTString()+' ;path=/';
			document.cookie='price='+priceCookie+'; expires='+date.toGMTString()+' ;path=/';
		}
	}else{
		document.cookie='bid='+bid+'; expires='+date.toGMTString()+' ;path=/';
		document.cookie='count='+count+'; expires='+date.toGMTString()+' ;path=/';
		document.cookie='image='+image+'; expires='+date.toGMTString()+' ;path=/';
		document.cookie='bname='+bname+'; expires='+date.toGMTString()+' ;path=/';
		document.cookie='price='+price+'; expires='+date.toGMTString()+' ;path=/';
	}
	//完成购物 对用户进行提示
	$('.msg2.curved ul li').text("已加入购物车，请您进入购物车进行查看！");
	alertMsg();
}




$(document).ready(function(){
	$('#tab-other').easytabs({
		animate:false,		
		cycle: 5000	
	});
});