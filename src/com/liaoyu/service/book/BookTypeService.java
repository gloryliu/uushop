package com.liaoyu.service.book;

import java.util.List;
import java.util.Map;

import com.liaoyu.bean.book.BookType;
import com.liaoyu.bean.book.TransientBookType;
import com.liaoyu.service.Dao;

public interface BookTypeService extends Dao<BookType> {
	public abstract boolean exists(String bType,String sType);
	public abstract List searchBtype();
	public abstract Map<String, List> searchDistinctBookType(int size);
	public abstract Map<String, List> searchAllDistinctBookType();
	public abstract List searchStype(String bType);
	//获取商品分类用于统计分析
	public abstract List<TransientBookType> getBookTypeCount();
}
