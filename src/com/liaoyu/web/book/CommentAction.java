package com.liaoyu.web.book;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.liaoyu.bean.book.Book;
import com.liaoyu.bean.book.Comment;
import com.liaoyu.bean.book.Order;
import com.liaoyu.bean.user.User;
import com.liaoyu.service.book.BookService;
import com.liaoyu.service.book.CommentService;
import com.liaoyu.service.book.OrderService;
import com.liaoyu.web.BaseAction;

/**
 * eclipse 快捷键
 * 项目中搜索关键字 Ctrl+G
 * 方法快速注释 Alt+Shift+J
 */
@Controller
public class CommentAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	@Resource CommentService cs;
	@Resource BookService bs;
	@Resource OrderService os;
	private String content;
	private Integer bid;
	private Integer oid;
	private String item[];
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String[] getItem() {
		return item;
	}
	public void setItem(String[] item) {
		this.item = item;
	}
	public Integer getOid() {
		return oid;
	}
	public void setOid(Integer oid) {
		this.oid = oid;
	}
	public Integer getBid() {
		return bid;
	}
	public void setBid(Integer bid) {
		this.bid = bid;
	}
	
	public String add(){
		try {
			//获取对象的定单
			Order order=os.find(oid);
			//获取对应的图书
			Book book=bs.find(bid);
			Comment comment=new Comment();
			comment.setContent(content);
			comment.setBdate(order.getCreateDate());
			comment.setPdate(new Date().toLocaleString());
			comment.setUser((User)getSession().get("user"));
			comment.setBook(book);
			//保存评论
			cs.save(comment);
			//修改定单状态
			order.setOrderStatus(5);
			os.update(order);
			//修改图书评论数量
			book.setCommentCount(book.getCommentCount()+1);
			bs.update(book);
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			this.clearMessages();
			this.addActionMessage("添加评价失败，抱歉！");
			return "error";
		}
	}
	public String delete(){
		if(item!=null&&item.length>0){
			try {
				for(String num:item)
					cs.delete(Integer.parseInt(num));
			} catch (NumberFormatException e) {
				this.addActionMessage("对不起，出错啦");
				return "error";
			}
			this.addActionMessage("删除成功");
			return "toAction";
		}
		else{
			this.addActionMessage("对不起，出错啦");
			return "error";
		}
	}

}
