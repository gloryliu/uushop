<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
 <!-- Pagging -->
 <s:if test="pageBean.pageCount<1"></s:if>
 <s:else>
 <div class="devidePage">
 <s:if test="pageBean.currentPage+1==1"></s:if>
 <s:else><a href="showOrder.do?currentPage=<s:property value="pageBean.currentPage-1"/>">上一页</a></s:else>
 <s:if test="0>pageBean.pageCount-7">
 	<s:iterator var="n" begin="1" end="pageBean.pageCount" >
 		<a href="showOrder.do?currentPage=<s:property value="#n-1"/>"><s:property /></a>
 	</s:iterator>
	</s:if>
 <s:else>
 	<s:iterator var="n"  begin="1" end="3" >
 		<a href="showOrder.do?currentPage=<s:property value="#n-1"/>"><s:property /></a>
 	</s:iterator>
 	<span class="splitPage">...</span>
 	<s:iterator var="n"  begin="pageBean.pageCount-1" end="pageBean.pageCount" >
 		<a href="showOrder.do?currentPage=<s:property value="#n-1"/>"><s:property /></a>
 	</s:iterator>
 </s:else>
 <s:if test="pageBean.currentPage+1==pageBean.pageCount"></s:if>
 <s:else><a href="showOrder.do?currentPage=<s:property value="pageBean.currentPage+1"/>">下一页</a></s:else>
 <span style="float:right" ><a href="javascript:void(0);" class="setChecked">全选</a><a href="javascript:void(0);" class="setOtherChecked">反选</a><a href="javascript:void(0);" class="lockAllBtn">锁定</a></span>
 <span style="float:right" class="pageInfo">当前：<s:property value="pageBean.currentPage+1"/>/<s:property value="pageBean.pageCount"/>页&nbsp;&nbsp;显示：<s:property value="pageBean.pageSize"/>条&nbsp;&nbsp;共：<s:property value="pageBean.totalCount"/>条</span>
 </div>
 </s:else>
 <input type="text" hidden="hidden" value="${pageBean.currentPage+1}" class="nowPage"/>
 <!-- End Pagging --> 