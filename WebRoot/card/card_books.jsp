<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>优优图书</title>
<script type="text/javascript" src="../js/jquery-1.8.3.js" ></script>
<script src="../js/card.js" type="text/javascript"></script>
<script type="text/javascript" src="../js/global.js" ></script>
<link  rel="stylesheet" href="../css/global.css" />
<link  rel="stylesheet" href="../css/card.css" />
</head>
<body>

<%@include file="../share/header2.jsp" %>

<div class="content">

<div class="card">

<div class="card_nav">
<ul class="step1">
  <li class="first"><span>1、</span>我的购物车<i></i></li>
  <li class="second"><span>2、</span>填写订单<i></i></li>
  <li class="third"><span>3、</span>完成订单</li>
</ul>
</div>
<div class="clear"></div>
<ul class="shoppingcart_subject" id="ui_shoppingcart_title">
    <li class="row1">商品名称</li>
    <li class="row2">积分</li>
    <li class="row3">价格</li>
    <li class="row4"><span title="在当当价基础上再优惠">&nbsp;&nbsp;&nbsp;优惠&nbsp;&nbsp;&nbsp;</span></li>
    <li class="row5">数量</li>
    <li class="row6">操作</li>
</ul>
<table width="960" border="0" cellspacing="0" cellpadding="0" class="card_table">

</table>
<div class="shoppingcart_total" id="div_total" style="">
    <span class="shoppingcart_total_left">
        <a href="#" class="qk">清空购物车</a><br /><br />
    </span>
    <p class="price_calculation">商品金额总计：<span>¥</span><span id="total_account">0.00</span>
    </p><p class="price">总计(不含运费)：
        <span>¥</span>
        <span id="pay_account">0.00</span>
    </p>
    <p id="balance" class="clearfix">
        <a name="checkout" id="cardSub" href="#" class="clearing" title="结算"></a>
        <a href="${pageContext.request.contextPath }/IndexAction.do"  name="goon" class="goon">继续购物</a>
    </p>
</div>


</div>

</div>

<%@include file="../share/footer.jsp" %>
<script type="text/javascript">
//为什么会是这样呢。。$('body').on('click', '.cut',function(){});
$('body').on('click', '.cut',function(){
	var nowCount=$.trim($(this).next().val());
	if(nowCount>1){
		$(this).next().val(nowCount-1);
		$('#total_account').text((eval($('#total_account').text())-$(this).parent().parent().parent().find('item').text()).toFixed(1));
		$('#pay_account').text((eval($('#pay_account').text())-$(this).parent().parent().parent().find('item').text()).toFixed(1));
	};
});
$('body').on('click', '.add',function(){
	var nowCount=eval($.trim($(this).prev().val()));
	$(this).prev().val(nowCount+1);
	$('#total_account').text((eval($(this).parent().parent().parent().find('item').text())+eval($('#total_account').text())).toFixed(1));
	$('#pay_account').text((eval($(this).parent().parent().parent().find('item').text())+eval($('#pay_account').text())).toFixed(1));
});
//结算前判断用户是否已经登录
$('#cardSub').click(function(){
	if($('#userid').val().length<1)alert("请您先登录！");
	else{window.location.href="/uushop/getAddress.do";}
});
</script>
</body>
</html>
