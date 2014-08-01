package com.liaoyu.web.system;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.liaoyu.bean.Notice;
import com.liaoyu.bean.PageBean;
import com.liaoyu.bean.QueryResult;
import com.liaoyu.service.user.NoticeService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Controller
public class ShowLimitNoticeAction  extends ActionSupport implements ModelDriven<PageBean> {
	private static final long serialVersionUID = 1L;
	@Resource NoticeService ns;
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
		/*获取所有用户*/
		int currentPage=pageBean.getCurrentPage();
		int count=(int)ns.getCount();
		pageBean.setTotalCount(count);
		pageBean.setPageCount();
		if(currentPage>=pageBean.getPageCount()&&currentPage!=0)pageBean.setCurrentPage(pageBean.getPageCount()-1);
		else if(currentPage<0)pageBean.setCurrentPage(0);
		QueryResult<Notice> qr=ns.getScrollData(pageBean.getCurrentPage()*pageBean.getPageSize(), pageBean.getPageSize());
		ActionContext.getContext().put("notices", qr.getResultlist());
		return SUCCESS;
	}

}
