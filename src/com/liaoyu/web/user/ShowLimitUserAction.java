package com.liaoyu.web.user;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.liaoyu.bean.PageBean;
import com.liaoyu.bean.QueryResult;
import com.liaoyu.bean.user.Type;
import com.liaoyu.bean.user.User;
import com.liaoyu.service.user.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Controller
public class ShowLimitUserAction  extends ActionSupport implements ModelDriven<PageBean> {
	private static final long serialVersionUID = 1L;
	@Resource UserService us;
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
		int count=(int)us.getCount();
		pageBean.setTotalCount(count);
		pageBean.setPageCount();
		if(currentPage>=pageBean.getPageCount()&&currentPage!=0)pageBean.setCurrentPage(pageBean.getPageCount()-1);
		else if(currentPage<0)pageBean.setCurrentPage(0);
		QueryResult<User> qr=us.getScrollData(pageBean.getCurrentPage()*pageBean.getPageSize(), pageBean.getPageSize(),"type!=?",new Object[]{Type.MANAGER});
		ActionContext.getContext().put("users", qr.getResultlist());
		return SUCCESS;
	}

}
