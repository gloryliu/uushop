//------------------------------屏蔽右键-------------------------------------------
/*
function click() {
	if (event.button==2) {  //改成button==1为禁止左键
	alert('对不起,禁止使用此功能.')
	}
	}
	document.onmousedown=click
*/
///-------------------------清除签名--------------------------------
function ClearName(Obj,Val){
	if(Obj.value==""){
		Obj.value=Val;
	}
	else{
		Obj.value="";
	}
}
//-----------------------------no shift--------------------------------------
	function NoShift(){
			if(window.event.keyCode==16){
				alert("操作禁止！");
				window.event.keyCode=0;
				return false;
			}
			return true;
		}
//------------------------------屏蔽按键-------------------------------------------
function ctlent(){ //Ctrl+Enter提交信息
	if(event.ctrlKey && window.event.keyCode==13)
	{
	this.document.frmAnnounce.submit();
	}
}
function DisabledKey(){
	//alert(window.event.keyCode);
	if(window.event.keyCode==8){ //backspace
		window.event.keyCode=0;
	}
	//禁止Ctrl组合键操作
	if(event.ctrlKey){
			if(window.event.keyCode==80){//Ctrl+P 打印
				window.event.keyCode=0;
				return false;
			}
			if(window.event.keyCode==79){//Ctrl+O 打开
				window.event.keyCode=0;
				return false;
			}
			if(window.event.keyCode==78){ //Ctrl+N  新建
				window.event.keyCode=0;
		        return false;
				}
			if(window.event.keyCode==87){ //Ctrl+W  关闭窗口
				window.event.keyCode=0;
		        return false;
				}
			if(window.event.keyCode==66){ //Ctrl+B  整理收藏夹
				window.event.keyCode=0;
		        return false;
				}
			if(window.event.keyCode==68){ //Ctrl+D  
				window.event.keyCode=0;
				return false;
				}
			if(window.event.keyCode==69){ //Ctrl+E  [3721]
				window.event.keyCode=0;
				return false;
				}
			if(window.event.keyCode==82){ //Ctrl+R 强行关闭程序
				window.event.keyCode=0;
				return false;
				}
			if(window.event.keyCode==73){ //Ctrl+I 打开收藏夹
				window.event.keyCode=0;
				return false;
				}
			if(window.event.keyCode==76){ //Ctrl+L 打开运行窗口
				window.event.keyCode=0;
				return false;
				}
			if(window.event.keyCode==70){ //Ctrl+F 打开查找窗口
				window.event.keyCode=0;
				return false;
				}
			if(window.event.keyCode==72){ //Ctrl+H 打开历史
				window.event.keyCode=0;
				return false;
				}
			if(window.event.keyCode==65){ //Ctrl+A 全选
				window.event.keyCode=0;
				return false;
				}
	}
	
	if(window.event.keyCode==114){ //F3 查找
		window.event.keyCode=0;
		return false;
	}
	if(window.event.keyCode==116){ //F5 刷新
		window.event.keyCode=0;
		return false;
	}
	if(window.event.keyCode==112){ //F1 帮助
		window.event.keyCode=0;
		return false;
	}
	}
//--------------------------------代码快速查看-----------------------------------
	/*	function ViewCode(CodeName,Field){
		var CodeWin=window.open('../code.php?CodeName=' + CodeName + '&Field=' + Field,'CodeWin','scrollbars=yes,toolbar=no,location=no,directories=no,status=no,menubar=no,resizable=yes,width=400,height=400');	
			CodeWin.focus();
	}
*/
//--------------------------------代码快速查看2-----------------------------------
/*	function ViewCode2(CodeName,Field,f){
		var CodeWin=window.open('../code.php?CodeName=' + CodeName + '&Field=' + Field + '&f=' + f,'CodeWin','scrollbars=yes,toolbar=no,location=no,directories=no,status=no,menubar=no,resizable=no,width=400,height=400');	
			CodeWin.focus();
	}
*/
//----------------------------菜单的展开（可用）与隐藏（不可用）----------------
	function MenuHidden(){
		top.bottom.cols = "0,0,*";
	}
	function MenuDisplay(){
		top.bottom.cols = "150,7,*";
	}
//--------------------------------验证填写的数字是否合法---------------	
//function IsNum(Field,FieldValue,TheNum1,TheNum2,Price){
function IsNum(Field,FieldValue){
		var Len=FieldValue.length;
		var flag=0; //只允许 .  出现一次
         	var flag2=0; //只允许 -  出现一次
		var err=0;
		if(Len!=0){
			for(var i=0;i<=Len;i++){
				var pos = FieldValue.charCodeAt(i);
				if(((pos<48&&pos!=45&&pos!=46)||pos>57)||flag>=2||flag2>=2){
					err=1;
				}
				if(pos==46){
					flag++;
					if(i==Len-1) flag=2;
				}
				if(pos==45){
					flag2++;
					if(i==Len-1) flag2=2;
				}			
			}
		}
		if(err==1){
			alert("请正确填写数字！");
			Field.focus();
			return false;
		}
	}

//----------------------------修改校徽----------------------------
function chgxh(){
   chgWin=window.showModalDialog("chgxh.php","","dialogWidth=480px;dialogHeight=160px;scroll=no;help=no");
}