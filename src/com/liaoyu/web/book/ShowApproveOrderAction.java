package com.liaoyu.web.book;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.liaoyu.bean.PageBean;
import com.liaoyu.bean.QueryResult;
import com.liaoyu.bean.book.Order;
import com.liaoyu.service.book.OrderService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Controller
public class ShowApproveOrderAction  extends ActionSupport implements ModelDriven<PageBean>{
	private static final long serialVersionUID = 1L;
	@Resource OrderService os;
	PageBean pageBean=new PageBean();
	public PageBean getPageBean() {
		return pageBean;
	}
	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}
	@Override
	public PageBean getModel() {
		return pageBean;
	}
	public String execute(){
		/*定义分页信息*/
		int currentPage=pageBean.getCurrentPage();
		int count=(int)os.getCount();
		pageBean.setTotalCount(count);
		pageBean.setPageCount();
		if(currentPage>=pageBean.getPageCount()&&currentPage!=0)pageBean.setCurrentPage(pageBean.getPageCount()-1);
		else if(currentPage<0)pageBean.setCurrentPage(0);
		QueryResult<Order> qr=os.getScrollData(pageBean.getCurrentPage()*pageBean.getPageSize(), pageBean.getPageSize()," orderStatus<=1",new Object[]{});
		ActionContext.getContext().put("orders", qr.getResultlist());
		return SUCCESS;
	}
}
