package com.liaoyu.service.book;

import java.util.List;

import com.liaoyu.bean.QueryResult;
import com.liaoyu.bean.book.Book;
import com.liaoyu.service.Dao;

public interface BookService extends Dao<Book> {
	public abstract void addBook(Book book,String bType,String sType);
	public abstract void addBookByNewType(Book book,String bType,String sType);
	public abstract void updateBook(Book book,String bType,String sType);
	public abstract void updateBookByNewType(Book book,String bType,String sType);
	/*获取热门图书*/
	public abstract QueryResult<Book> getBestSellerBook(int size);
	/*获取评论最多图书*/
	public abstract QueryResult<Book> getBestCommentBook();
	/*获取收藏最多图书*/
	public abstract QueryResult<Book> getBestCollectBook();
	/*获取推荐图书*/
	public abstract QueryResult<Book> getRecommendtBook();
	/*获取猜你喜欢图书*/
	/*获取推荐作家图书*/
	/*获取今日作家图书*/
	/*获取今日图书*/
	/*获取浏览历史图书*/
	/*获取看过这本书还去看的图书   即同类型的图书按销售量进行排序*/
	public abstract List getSameTypeBook(int typeid);
	/*图书对应的收藏*/
	public abstract boolean addCollectBook(int bid,int uid);
	//获取收藏的图书
	public abstract List<Book> getCollectBook(Integer uid);
}
