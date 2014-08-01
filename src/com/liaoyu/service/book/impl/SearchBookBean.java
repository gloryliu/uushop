package com.liaoyu.service.book.impl;

import javax.annotation.Resource;

import org.compass.core.Compass;
import org.compass.core.CompassTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.liaoyu.bean.QueryResult;
import com.liaoyu.bean.book.Book;
import com.liaoyu.service.book.SearchBookService;

@Service @Transactional
public class SearchBookBean implements SearchBookService {
	private CompassTemplate compassTemplate;
	@Resource
	public void setCompass(Compass compass) {
		this.compassTemplate=new CompassTemplate(compass);
	}

	@Override
	public QueryResult<Book> searchBookByKeyword(String keyWord,int firstResult,int resultSize){
		return compassTemplate.execute(new QueryCompassCallback(keyWord,firstResult,resultSize));
	}

}
