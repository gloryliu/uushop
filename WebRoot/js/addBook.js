$(function(){
	/*检查信息提示是否为空*/
	if($.trim($('.msg.curved').text())!=""){
		$('.msg.curved').slideDown(1500,function(){
			$('.msg.curved').slideUp(1500);
		});
	}
	
	/*设置图书类别默认的文字*/
	if($('#bType').val()==""){
		$('#bType').val("主类别").css('color',"#ccc");
	}
	if($('#sType').val()==""){
		$('#sType').val("子类别").css('color',"#ccc");
	}
	$('#bType').focus(function(){
		$('#bType').val("").css('color',"#000");
		$.ajax({
			   type: "GET",
			   url: "/uushop/bookType_showBigType.do",
			   success: function(data){
				   var bTypeSource = data.split(',');
					$("#bType").autocomplete({
						source: bTypeSource
					});
					$('.ui-corner-all').css({'text-align':'left','color':'#0088cc'});	//设置智能输入框中文字的显示样式
			   }
		});
	});
		
	$('#sType').focus(function(){
		$('#sType').val("").css('color',"#000");
		var bType=$('#bType').val();
		$.ajax({
			   type: "POST",
			   url: "/uushop/bookType_showSmallType.do",
			   data:"btype="+bType,
			   success: function(data){
				   var sTypeSource = data.split(',');
					$("#sType").autocomplete({
						source: sTypeSource
					});
					$('.ui-corner-all').css({'text-align':'left','color':'#0088cc'});	//设置智能输入框中文字的显示样式
			   }
		});
	});
	
	//提交表单验证
	var cname=false;
	var cprice=false;
	var cauthor=false;
	var cpublish=false;
	var cpdate=false;
	var ctype=false;
	
	function checkName(){
		if($.trim($('#bname').val())!='')cname=true;
	}
	function checkPrice(){
		if($.trim($('#price').val())!='')cprice=true;
	}
	function checkAuthor(){
		if($.trim($('#author').val())!='')cauthor=true;
	}
	function checkPublish(){
		if($.trim($('#publishCompany').val())!='')cpublish=true;
	}
	function checkPdate(){
		if($.trim($('#publishDate').val())!='')cpdate=true;
	}

	function checkType(){
		if(($.trim($('#bType').val())!='')&&($.trim($('#bType').val())!='主类别')&&($.trim($('#sType').val())!='')&&($.trim($('#sType').val())!='子类别'))ctype=true;
	}

	
	$('#addBookBtn').click(function(){
		//alert(editor.html());
		//$('#addBookForm').submit();		竟然不能用这种方法 
		checkName();
		checkPrice();
		checkAuthor();
		checkPublish();
		checkPdate();
		checkType();
		if(cname==true&&cprice==true&&cauthor==true&&cpublish==true&&cpdate==true&&ctype==true){
			return true;
		}else{
			alert("请填写完整信息");
			return false;
		}
	});
});