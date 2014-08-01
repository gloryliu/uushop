package com.liaoyu.service.book.impl;

import java.util.ArrayList;
import java.util.List;

import org.compass.core.CompassCallback;
import org.compass.core.CompassException;
import org.compass.core.CompassHits;
import org.compass.core.CompassQuery.SortDirection;
import org.compass.core.CompassQuery.SortPropertyType;
import org.compass.core.CompassQueryBuilder;
import org.compass.core.CompassSession;

import com.liaoyu.bean.QueryResult;
import com.liaoyu.bean.book.Book;
import com.liaoyu.bean.book.BookType;

public class QueryCompassCallback implements CompassCallback<QueryResult<Book>> {
	/**
	 * keyWord 搜索的关键字
	 * firstResult  开始搜索的位置
	 * resultSize  搜索的数量
	 */
	private String keyWord;
	private int firstResult,resultSize;
	public QueryCompassCallback(String keyWord, int firstResult, int resultSize) {
		this.keyWord=keyWord;
		this.firstResult=firstResult;
		this.resultSize=resultSize;
	}

	@Override
	public QueryResult<Book> doInCompass(CompassSession session)
			throws CompassException {
		/*查询指定类别的匹配记录，并按position降序排序
		 CompassQueryBuilder queryBuilder = session.queryBuilder();
		 CompassHits hits = queryBuilder.bool()
		 	.addMust(queryBuilder.spanEq("typeid", typeid))
	 		.addMust(queryBuilder.queryString(keyword).toQuery())
	   		.toQuery().addSort("position", SortPropertyType.FLOAT, SortDirection.REVERSE)
	   		.hits();//sql: typeid=1 and (xxxx like ?) order by positoin desc
		 */
		//CompassHits hits=session.find(keyWord);
		 CompassQueryBuilder queryBuilder = session.queryBuilder();			//根据售出数量和评论数量进行排序
		 CompassHits hits = queryBuilder.bool()
	 		.addMust(queryBuilder.queryString(keyWord).toQuery())
	   		.toQuery().addSort("saleCount", SortPropertyType.INT, SortDirection.REVERSE)
	   		.hits();
		
		QueryResult<Book> booksResult=new QueryResult<Book>();
		booksResult.setRecordtotal(hits.getLength());	//设置数量总数
		int length=firstResult+resultSize;
		if(length>hits.getLength())length=hits.getLength();
		List<Book> books=new ArrayList<Book>();
		for(int i=firstResult;i<length;i++){
			Book book=(Book) hits.data(i);
			BookType bookType=book.getBookType();
			if((hits.highlighter(i).fragment("bname"))!=null)
				book.setBname(hits.highlighter(i).fragment("bname"));
			if((hits.highlighter(i).fragment("author"))!=null)
				book.setAuthor(hits.highlighter(i).fragment("author"));			
			if((hits.highlighter(i).fragment("bookInfo"))!=null)
				book.setBookInfo(hits.highlighter(i).fragment("bookInfo"));			
			if((hits.highlighter(i).fragment("sType"))!=null){
				bookType.setsType(hits.highlighter(i).fragment("sType"));
				book.setBookType(bookType);
			}
			books.add(book);
		}
		booksResult.setResultlist(books);
		return booksResult;
	}


}
