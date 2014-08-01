// 控制后台表格显示相关
//全选
function SetChecked(boxname,f) {
	//f=document.showBookForm;
	// change form1 if you change your form name.
	for(var  i=0 ; i<f.elements.length ; i++) {
		if (f.elements[i].name==boxname) {
		f.elements[i].checked=true;
		}
	}
}
//反选
function SetOtherChecked(boxname,f) {
	//f=document.managerForm;
	// change form1 if you change your form name.
	for(var  i=0 ; i<f.elements.length ; i++) {
		if (f.elements[i].checked) {
		f.elements[i].checked=false;
		}else{
			f.elements[i].checked=true;
		}
	}
}

$(function(){
	$('.setChecked').click(function(){
		SetChecked('item',document.showForm);
	});
	$('.setOtherChecked').click(function(){
		SetOtherChecked('item',document.showForm);
	});
	//设置当前页的按钮颜色变化
	$(".devidePage>a").each(function(){
		if($(this).text()==$('.nowPage').val())$(this).css('background','#ba4c32');
	});
	//批量删除选中项
	$('.deleteAll').click(function(){
		if($('#showForm input:checked').size()<1)alert('请选中要删除的项');
		else {
			if(confirm('确定删除这批数据吗?'))$('#showForm').submit();
		}
	});
	//批量锁定选中项
	$('.lockAllBtn').click(function(){
		if($('#showForm input:checked').size()<1)alert('请选中要锁定的项');
		else {
			if(confirm('确定锁定这批数据吗?'))$('#showForm').submit();
		}
	});

});