package com.liaoyu.service.book;

import java.util.List;

import com.liaoyu.bean.book.Order;
import com.liaoyu.bean.book.TransientBook;
import com.liaoyu.bean.book.TransientOrder;
import com.liaoyu.service.Dao;

public interface OrderService extends Dao<Order>{
	/*添加订单*/
	public void addOrder(int uid,int aid,Order order);
	/*根据订单的日期进行排序，获取集合形式的图书ID*/
	public List<Integer> getLatelyBookId();
	/*根据用户ID查找其所有定单*/
	public List<TransientOrder> getMyOrder(int uid);
	/*获取支付完成的定单*/
	public List<TransientBook> getHaveBuyBook(int uid);
}
