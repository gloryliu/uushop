package com.liaoyu.web.book;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.liaoyu.bean.PageBean;
import com.liaoyu.bean.QueryResult;
import com.liaoyu.bean.book.Comment;
import com.liaoyu.service.book.CommentService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Controller
public class ShowLimitCommentAction  extends ActionSupport implements ModelDriven<PageBean>{
	private static final long serialVersionUID = 1L;
	@Resource CommentService cs;
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
		int count=(int)cs.getCount();
		pageBean.setTotalCount(count);
		pageBean.setPageCount();
		if(currentPage>=pageBean.getPageCount()&&currentPage!=0)pageBean.setCurrentPage(pageBean.getPageCount()-1);
		else if(currentPage<0)pageBean.setCurrentPage(0);
		QueryResult<Comment> qr=cs.getScrollData(pageBean.getCurrentPage()*pageBean.getPageSize(), pageBean.getPageSize());
		ActionContext.getContext().put("comments", qr.getResultlist());
		return SUCCESS;
	}
}
