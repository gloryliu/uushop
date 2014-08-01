//添加地址
function showAddress(){
	$('#addressDiv').slideToggle();
	$('#myaddr_div').remove();
}
//获取cookie中的购物车信息
function getCardCookie(){
	var bookCookies=document.cookie; //alert(bookCookies);
	if(bookCookies!=null){
		var cookieArray=bookCookies.split('; ');
		var bids,counts,images,bnames,prices;
		for(var i=0;i<cookieArray.length;i++){
			var cookieItem=cookieArray[i].split('=');
			if(cookieItem[0]=='bid')bids=cookieItem[1];
			if(cookieItem[0]=='count')counts=cookieItem[1];
			if(cookieItem[0]=='image')images=cookieItem[1];
			if(cookieItem[0]=='bname')bnames=cookieItem[1];
			if(cookieItem[0]=='price')prices=cookieItem[1];
		}
		//填充隐藏表单数据
		$('#bids').val(bids);
		$('#counts').val(counts);
		var bidArray=bids.split('_');
		var countArray=counts.split('_');
		var imageArray=images.split('_');
		var bnameArray=bnames.split('_');
		var priceArray=prices.split('_');
		
		var sureSum=0;
		for(var j=0;j<bidArray.length;j++){
			sureSum+=eval((priceArray[j]*countArray[j]));
			//$('.card_table').html('<br /><img src="../images/load.gif" />&nbsp;&nbsp;正在加载……<br />');
			$('.card_table').append(
					  '<tr class="card_tr">'+
					    '<td width="95px"><a href="#" class="bookPic"><img src='+decodeURIComponent(imageArray[j])+' width="56px" height="56px"/></a></td>'+
					    '<td width="300px"><a href="#">'+unescape(bnameArray[j])+'</a></td>'+
					    '<td width="102px">5</td>'+
					    '<td width="144px"><span class="d_price">¥<item>'+priceArray[j]+'</item></span></td>'+
					    '<td width="141px">无</td>'+
					    '<td width="93px">'+
					    	'<div class="add_cut">'+
					           ' <a href="javacript:void(0);" class="cut a_mini" title="数量减一"></a>'+
					            '<input type="text"  class="input_mini" disabled="disabled" value="'+countArray[j]+'"/>'+
					           ' <a href="javacript:void(0);" class="add a_mini" title="数量加一"></a>'+
					       ' </div>'+
					    '</td>'+
					    '<td width="85px"><a href="#" class="len1">收藏</a><a href="#" class="len1">删除</a></td>'+
					  '</tr>'
			);
			//确认定单时进行数据填充
			$('.bookTitle').after(
					'<p class="bookInfo">'+
					'<span class="cols1">'+unescape(bnameArray[j])+'</span>'+
					'<span class="cols2">¥'+priceArray[j]+'</span>'+
					'<span class="cols3">- -</span>'+
					'<span class="cols4">'+countArray[j]+'</span>'+
					'<span class="cols5 d_price">¥'+(priceArray[j]*countArray[j]).toFixed(1)+'</span>'+
					'</p>'
			);
		}
		$('.card').find('cardaddress').each(function(){
			$(this).text(sureSum.toFixed(1));
		});
		//设置应付总额
		$('shallCost').text((5.0+eval(sureSum)).toFixed(1));
	}
	//填充总价格
	var sumPrice=0.0;
	$('.card_tr').find('item').each(function(i){
		var price=$.trim($(this).text());
		$('.card_tr').find('.input_mini').each(function(j){
			if(i==j){
				var count=$.trim($(this).val());
				sumPrice+=eval(price*count);
			}
		});
		$('#total_account').text(sumPrice.toFixed(1));
		$('#pay_account').text(sumPrice.toFixed(1));		
	});
}

function setCookieExpires(){
	//设置cookie过期
	//alert(document.cookie);
	var date=new Date(); 
	var expiresDays=-1; 
	date.setTime(date.getTime()+expiresDays*8.64e7);
	document.cookie='bid=0; expires='+date.toGMTString()+' ;path=/';
	document.cookie='count=0; expires='+date.toGMTString()+' ;path=/';
	document.cookie='image=0; expires='+date.toGMTString()+' ;path=/';
	document.cookie='bname=0; expires='+date.toGMTString()+' ;path=/';
	document.cookie='price=0; expires='+date.toGMTString()+' ;path=/';
}

$(document).ready(function(){
	//将cookie中的数据提交到服务器进行显示 
	getCardCookie();
	//确认提交地址信息
	$('#sureAddressBtn').click(function(){
		var consignee=$('#consignee').val();
		var selProvince=$('#selProvince').val();
		var selProvinceText=$('#selProvince option:selected').text();
		var selCity=$('#selCity').val();
		var selCityText=$('#selCity option:selected').text();
		var selArea=$('#selArea').val();
		var selAreaText=$('#selArea option:selected').text();
		var addrDetail=$('#addrDetail').val();
		var zipCode=$('#zipCode').val();
		var mobile=$('#mobile').val();
		var telephone=$('#telephone').val();
		var isDefaultAddress=document.getElementById('isDefaultAddress').checked+0;
		//alert($('#selProvince option:selected').text());
		//alert(consignee+"         "+selProvince+"         "+selCity+"         "+selArea+"         "+addrDetail+"         "+zipCode+"         "+mobile+"         "+telephone+"         "+isDefaultAddress);
		//判断各项不能为空
		if(consignee.length>0&&selProvince.length>0&&selCity.length>0&&addrDetail.length>0&&zipCode.length>0&&(mobile.length>0||telephone.length>0)){
			$.post('/uushop/addAddress.do',
					'consignee='+consignee+'&'+'province='+selProvince+'&'+'city='+selCity+'&'+'region='+selArea+'&'+'addrDetail='+addrDetail+'&'+'zipCode='+zipCode+'&'+'mobile='+mobile+'&'+'telephone='+telephone+'&'+'flag='+isDefaultAddress,
					function(data){
						if(eval(data)>0){
							$('#orderForm').prepend('<li>当前地址：'+consignee+'&nbsp;&nbsp;'+selProvinceText+'&nbsp;&nbsp;'+selCityText+'&nbsp;&nbsp;'+selAreaText+'&nbsp;&nbsp;'+addrDetail+'&nbsp;&nbsp;'+zipCode+'&nbsp;&nbsp;'+mobile+'&nbsp;&nbsp;'+telephone+'</li>');
							$('#orderForm').prepend('<input type="hidden" value="'+data+'" id="aid" name="aid"/>');
							$('#addressDiv').toggle();
						}
						if(data=='login')alert('保存失败，请登录先');
					},
					'text'
			);			
		}else{
			alert("请填写完整地址信息");
		}

		//alert('consignee='+consignee+'&'+'province='+selProvince+'&'+'city='+selCity+'&'+'region='+selArea+'&'+'addrDetail='+addrDetail+'&'+'zipCode='+zipCode+'&'+'mobile='+mobile+'&'+'telephone='+telephone+'&'+'flag='+isDefaultAddress);
	});
	//提交订单
	$('#postOrderBtn').click(function(){
		if($('#myaddr_div input:checked').length<1)
			if(typeof($('#aid').val())=='undefined'){
				alert("请填写完整地址信息");
				return;
			}
		setCookieExpires();
		$('#orderForm').submit();
	});
	//设置地址列表中第一项选中
	$('#myaddr_div input:first').attr('checked','checked');
});













