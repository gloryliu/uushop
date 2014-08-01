<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>显示订单</title>
<link  rel="stylesheet" href="../css/global.css" />
<link  rel="stylesheet" href="../css/controlContent.css" />
</head>
<body>
<div class="msg curved"><ul><s:iterator value="actionMessages"><li><s:property /></li></s:iterator></ul></div>
<div id="showGoods">

<div class="box">
    <!-- Box Head -->
    <div class="box-head">
        <h2 class="left">显示订单</h2>
    </div>
    <!-- End Box Head -->	
    <!-- Table -->
    <div class="table">
    	<form action="lockOrder.do" method="post" name="showForm" id="showForm">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tbody>
            <tr>
                <th width="13"></th>
                <th>订单编号</th>
                <th>订单时间</th>
                <th>商品总金额 </th>
                <th>配送费</th>
                <th>订单总金额 </th>
                <th>应付款</th>
                <th>顾客附言</th>
                <th>送货方式 </th>
                <th>支付方式</th>
                <th>订单状态</th>
            </tr> 
        <s:iterator var="order" value="#request.orders">
            <tr>
                <td><input type="checkbox" class="item" name="item" value="<s:property value="#order.oid"/>"/></td>
                <td><s:property value="#order.oid"/></td>
                <td><s:property value="#order.createDate"/></td>
                <td>￥<s:property value="#order.productTotalPrice"/></td>
                <td>￥<s:property value="#order.deliverFee"/></td>
               <td>￥<s:property value="#order.totalPrice"/></td>
                <td>￥<s:property value="#order.payablefee"/></td>
                <td><s:property value="#order.note"/></td>
                <td><s:property value="#order.deliverWay"/></td>
                <td><s:property value="#order.paymentWay"/></td>
                <c:if test="${order.orderStatus==0 }">
                <td>未支付</td>
                </c:if>
                <c:if test="${order.orderStatus==1 }">
                <td>已锁定</td>
                </c:if>
                <c:if test="${order.orderStatus==2 }">
                <td>已支付</td>
                </c:if>
                <c:if test="${order.orderStatus==5 }">
                <td>已评论</td>
                </c:if>
            </tr>
         </s:iterator>   
        	</tbody>
        </table>
        <jsp:include page="/share/divideOrderPage.jsp" />
        </form>
    </div>
    <!-- Table --> 
</div>
<!-- BoxEnd -->
</div>
<script type="text/javascript" src="../js/jquery-1.8.3.js" ></script>
<script type="text/javascript" src="../js/listControl.js" ></script>
</body>
</html>
