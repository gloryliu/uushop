package com.liaoyu.service.book;

import com.liaoyu.bean.QueryResult;
import com.liaoyu.bean.book.Book;

public interface SearchBookService {

	public abstract QueryResult<Book> searchBookByKeyword(String keyWord,
			int firstResult, int resultSize);


}