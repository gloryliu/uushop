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
<ul class="step3">
  <li class="first"><span>1、</span>我的购物车<i></i></li>
  <li class="second"><span>2、</span>填写订单<i></i></li>
  <li class="third"><span>3、</span>完成订单</li>
</ul>
</div>
<div class="clear"></div>
<div id="order_suc">
<h2 id="order_flag"></span><span class="suc_icon"></span><span class="text">感谢您提交订单，我们将及时为您处理！</span></h2>
<div class="orderEnd-box-top-info" id="top_info_div"><div class="list clearfix"><strong>温馨提示：</strong><div class="list-info"><p>由于系统需进行订单预处理，您可能1~3分钟后才能查询到您提交的订单，请您谅解。</p></div></div><div class="list mt-20 clearfix"><strong>付款须知：</strong><div class="list-info"><p>网上支付的订单，请您在24小时内支付，否则订单将被自动取消。</p></div></div></div>
<div id="item-order">
<h3>订单：<a href="#" target="_blank"><span class="number">6311428140</span></a></h3>
<p>商品信息如下：</p>
<div class="order-price"><p>支付金额：<span class="price-d">¥40.00</span></p><p class="btn-bar"><a class="btn6 btn-p26" href="#" name="go_pay_link" target="_blank" >立即支付</a></p></div>
</div>
</div>

</div>

</div>
<%@include file="../share/footer.jsp" %>

</body>
</html>
