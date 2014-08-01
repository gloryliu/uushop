package com.liaoyu.web.book;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;

import com.liaoyu.bean.PageBean;
import com.liaoyu.bean.QueryResult;
import com.liaoyu.bean.book.Book;
import com.liaoyu.service.book.BookService;
import com.liaoyu.service.book.SearchBookService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Controller
public class SearchBookAction  extends ActionSupport implements ModelDriven<PageBean>{
	private static final long serialVersionUID = 1L;
	@Resource BookService bs;
	@Resource SearchBookService sbs;
	private String keyWord;		//搜索的关键字
	PageBean pageBean=new PageBean();
	public PageBean getPageBean() {
		return pageBean;
	}
	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}
	public String getKeyWord() {
		return keyWord;
	}
	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}
	@Override
	public PageBean getModel() {
		return pageBean;
	}
	public String execute(){
		/*定义分页信息*/
		int currentPage=pageBean.getCurrentPage();
		if(currentPage<0)pageBean.setCurrentPage(0);
		//获取通过compass查询的得的图书
		QueryResult<Book> qr=sbs.searchBookByKeyword(keyWord, pageBean.getCurrentPage()*5, 5);
		int count=qr.getRecordtotal();
		pageBean.setPageCount(count%5==0?count/5:count/5+1);		//查询结果需显示的页数
		pageBean.setPageSize(5);
		pageBean.setTotalCount(count);
		ActionContext.getContext().put("searchResults", qr);
		//热门图书
		ActionContext.getContext().put("bestSellerBooks",bs.getBestSellerBook(4).getResultlist());
		//获取浏览过的图书
		//操作Cookie 关于最近浏览过的图书
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpServletResponse response=ServletActionContext.getResponse();
		ActionContext.getContext().put("haveScanBooks",getHaveScanBook(request,response));
		return SUCCESS;
	}
	private List getHaveScanBook(HttpServletRequest request,HttpServletResponse response) {
		Cookie[] cookies=request.getCookies();
		List books=new ArrayList();
		if(cookies!=null&&cookies.length>0){
			StringBuffer bidValue=new StringBuffer("");
			for(Cookie cookie:cookies){
				if("scanbid".equals(cookie.getName())){		//判断是否存在cookie
					bidValue.append(cookie.getValue());		//获取当前的cookie
				}
			}
			//获取cookie中已经存在的值
			if(bidValue.length()>0){
				String [] bidArray=bidValue.toString().split("_");
				//限定返回的数量
				for(int k=0;k<bidArray.length&&k<4;k++){
					books.add(bs.find(Integer.valueOf(bidArray[bidArray.length-k-1])));
				}
			}
		}
		return books;
	}
}
