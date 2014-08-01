package com.liaoyu.service.book.impl;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.Query;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.liaoyu.bean.book.BookType;
import com.liaoyu.bean.book.TransientBookType;
import com.liaoyu.service.DaoSupport;
import com.liaoyu.service.book.BookTypeService;

@Service
public class BookTypeServiceBean extends DaoSupport<BookType> implements BookTypeService {
	@Override
	@Transactional(readOnly=true,propagation=Propagation.NOT_SUPPORTED)
	public boolean exists(String bType,String sType) {
		Query query=em.createQuery("select count(o) from BookType o where bType=?1 and sType=?2");
		query.setParameter(1, bType);
		query.setParameter(2, sType);
		long count=(Long) query.getSingleResult();
		return count>0?true:false;
	}

	@Override
	@Transactional(readOnly=true,propagation=Propagation.NOT_SUPPORTED)
	public List searchBtype() {
		return em.createQuery("select distinct o.bType from BookType o").getResultList();
	}
	@Transactional(readOnly=true,propagation=Propagation.NOT_SUPPORTED)
	public List searchBtypeBySize(int size) {
		Query query=em.createQuery("select distinct o.bType from BookType o");
		query.setFirstResult(0);
		query.setMaxResults(size);
		return query.getResultList();
	}

	@Override
	@Transactional(readOnly=true,propagation=Propagation.NOT_SUPPORTED)
	public List searchStype(String bType) {
		return em.createQuery("select o.sType from BookType o where bType=?1").setParameter(1, bType).getResultList();
	}

	@Override
	@Transactional(readOnly=true,propagation=Propagation.NOT_SUPPORTED)
	public Map<String, List> searchDistinctBookType(int size) {
		Map<String, List> books=new LinkedHashMap<String,List>();
		List<String> Btype=searchBtypeBySize(size);
		for(String bType:Btype){
			List sTypes=searchStype(bType);
			books.put(bType, sTypes);
		}
		return books;
	}

	@Override
	@Transactional(readOnly=true,propagation=Propagation.NOT_SUPPORTED)
	public Map<String, List> searchAllDistinctBookType() {
		Map<String, List> books=new LinkedHashMap<String,List>();
		List<String> Btype=searchBtype();
		for(String bType:Btype){
			List sTypes=searchStype(bType);
			books.put(bType, sTypes);
		}
		return books;
	}

	@Override
	public List<TransientBookType> getBookTypeCount() {
		String sql="select stype,sum_count from booktype,(select typeid,count(*) sum_count from book group by typeid) temp_book where temp_book.typeid=booktype.typeid;";
		List<Object[]> result=em.createNativeQuery(sql).getResultList();
		List<TransientBookType> typeCount=new ArrayList<TransientBookType>();
		for(Object[] obj:result){
			TransientBookType booktype=new TransientBookType();
			booktype.setName((String) obj[0]);
			booktype.setValue(Integer.valueOf(String.valueOf(obj[1])));
			typeCount.add(booktype);
		}
		return typeCount;
	}

}
