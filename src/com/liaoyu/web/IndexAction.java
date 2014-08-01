package com.liaoyu.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.liaoyu.bean.book.Book;
import com.liaoyu.service.book.BookService;
import com.liaoyu.service.book.BookTypeService;
import com.liaoyu.service.book.OrderService;
import com.liaoyu.service.user.NoticeService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Controller
public class IndexAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	@Resource BookTypeService bts;
	@Resource BookService bs;
	@Resource OrderService os;
	@Resource NoticeService ns;

	@SuppressWarnings("rawtypes")
	public String execute(){
		//Map<String, List> limitBookType=bts.searchDistinctBookType(7);
		Map<String, List> allBookType=bts.searchAllDistinctBookType();
		//ActionContext.getContext().put("limitBookType", limitBookType);
		ActionContext.getContext().put("allBookType", allBookType);
		//热门图书
		ActionContext.getContext().put("bestSellerBooks",bs.getBestSellerBook(7).getResultlist());
		//评论最多
		ActionContext.getContext().put("bestCommentBooks",bs.getBestCommentBook().getResultlist());
		//收藏最多
		ActionContext.getContext().put("bestCollectBooks",bs.getBestCollectBook().getResultlist());
		//推荐图书
		ActionContext.getContext().put("recommendBooks",bs.getRecommendtBook().getResultlist());
		//获取近期新书
		List<Integer> bookids=os.getLatelyBookId();
		List<Book> lastlyBook=new ArrayList<Book>();
		for(Integer bookid:bookids){
			lastlyBook.add(bs.find(bookid));
		}
		ActionContext.getContext().put("lastlyBook",lastlyBook);
		//获取最新公告
		ActionContext.getContext().put("nContent",ns.getNoticeContent());
		return SUCCESS;
	}
}
