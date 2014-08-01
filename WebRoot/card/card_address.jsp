<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>优优图书</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/cityData.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/areaselector.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/global.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/card.js" ></script>
<link  rel="stylesheet" href="${pageContext.request.contextPath }/css/global.css" />
<link  rel="stylesheet" href="${pageContext.request.contextPath }/css/card.css" />
</head>
<body>
<%@include file="../share/header2.jsp" %>
<div class="content">

<div class="card">

<div class="card_nav">
<ul class="step2">
  <li class="first"><span>1、</span>我的购物车<i></i></li>
  <li class="second"><span>2、</span>填写订单<i></i></li>
  <li class="third"><span>3、</span>完成订单</li>
</ul>
</div>

<p class="peisong_title">订单(优优网配送)</p>
<div class="peisong_body">
<p class="bookTitle">
<span class="cols1">商品名称</span>
<span class="cols2">优优价</span>
<span class="cols3">促销价</span>
<span class="cols4">数量</span>
<span class="cols5">小计</span>
</p>
<p class="card_mini"><strong>运费：</strong>¥5.00<strong  style="margin-left:20px;">小计总额：</strong><span class="d_price">¥<cardaddress>0.00</cardaddress></span></p>
<div id="order_info_title"><h3>收货相关信息</h3></div>
<div class="clear"></div>
<div id="order_div">

<ul id="order_all">
<li id="addAddress">收货地址：&nbsp;&nbsp;<a href="javascript:void(0);" id="addAddress" onclick="showAddress()">使用新地址</a>
<div class="order_address" id="addressDiv">
<p><strong>*</strong>收　货人：<input  type="text" class="input4" name="consignee" id="consignee"/></p>
<p><strong>*</strong>收货地区：
    <span>*</span> 省
    <select id="selProvince" name="selProvince" class="select1" style="width:80px">
    </select>
    <span>*</span> 市
    <select id="selCity" name="selCity" class="select1">
    </select>
    <span>*</span> 县/区
    <select id="selArea" name="selArea" class="select1">
    </select>
</p>
<p><strong>*</strong>详细地址：<input  type="text" class="input5" name="addrDetail" id="addrDetail"/></p>
<p><strong>*</strong>邮政编码：<input  type="text" class="input4" name="zipCode" id="zipCode"/></p>
<p><strong>*</strong>手　　机：<input  type="text" class="input4" name="mobile" id="mobile"/>&nbsp;&nbsp;或&nbsp;&nbsp;
固定电话：<input  type="text" class="input4" name="telephone" id="telephone"/></p>
<p class="address1"><input type="checkbox" id="isDefaultAddress"/>&nbsp;&nbsp;设为默认地址</p>
<p class="address1"><a class="order_a btn5" id="sureAddressBtn">确认收获地址</a></p>
</div>
</li>
<form action="/uushop/addOrder.do" method="post"  id="orderForm">
 
 <div id="myaddr_div">
 <p>我的地址：</p>
 <ul>
<c:forEach var="address" items="${addresss }">
	<li><input type="radio" name="aid" value="${address.aid}" />${address.consignee }&nbsp;&nbsp;<province>${address.province }</province>&nbsp;&nbsp;
	<city>${address.city }</city>&nbsp;&nbsp;<region>${address.region }</region>&nbsp;&nbsp;${address.addrDetail }&nbsp;&nbsp;
	${address.zipCode }&nbsp;&nbsp;${address.mobile }&nbsp;&nbsp;${address.telephone }</li>
</c:forEach>
</ul>
</div>
<!--
<li>当前地址：liaoyu&nbsp;&nbsp;江西&nbsp;&nbsp;赣州市&nbsp;&nbsp;于都县&nbsp;&nbsp;梅屋&nbsp;&nbsp;342323&nbsp;&nbsp;13820106356&nbsp;&nbsp;</li>
<input type="hidden" value="1" id="aid" name="aid">
 -->
<input type="hidden" id="bids" name="bids"/>
<input type="hidden" id="counts" name="counts"/>
<li>送货方式：</li>
<div class="order_address">
<p><input type="radio" name="kuaidi" checked="checked" value="gen_deliver"/>普通快递<input type="radio" name="kuaidi"  value="fast_deliver" style="margin-left:30px;"/>特快快递</p>
</div>
<li>支付方式：</li>
<div class="order_address">
<p><input type="radio" name="huokuan" checked="checked" value="online_pay"/>网上支付<input type="radio" name="huokuan"  value="face_pay" style="margin-left:30px;"/>货到付款</p>
</div>
<li>用户留言：</li><br />
<p><input type="text" id="note" name="note"  class="input5"/></p>
</form>
</ul>

</div>
<div id="sure_card">
<span class="sure_span">商品金额：</span>¥<cardaddress>35.00</cardaddress><div class="clear"></div>
<span class="sure_span">运　　费：</span>¥5.00<div class="clear"></div>
<span class="sure_span">应付总额：</span><span class="d_price" style="font-size:14px">¥<shallCost>40.00</shallCost></span><div class="clear"></div>
<span class="sure_span"></span><a class="order_a btn5" id="postOrderBtn">提交订单</a>
</div>
</div>

</div>
</div>
<%@include file="..//share/footer.jsp" %>
<script>
initAreaSelector(3,7,64);
$(document).ready(function(){
	//遍历地址列表 对数据进行初始化
	var provinceNum,cityNum, areaNum;
	//alert(_ds_data[12].city[3].area[0].id);
	$('#myaddr_div li').each(function(){
		provinceNum=eval($(this).find($('province')).text())-1;
		cityNum=eval($(this).find($('city')).text())-1;
		areaNum=eval($(this).find($('region')).text())-1;
		//alert(provinceNum+','+cityNum+','+areaNum);
		$(this).find($('province')).text(_ds_data[provinceNum].name);
		$(this).find($('city')).text(_ds_data[provinceNum].city[cityNum].name);
		//$(this).find($('region')).text(_ds_data[provinceNum].city[cityNum].area[areaNum].name);
	});
});
</script>
</body>
</html>
