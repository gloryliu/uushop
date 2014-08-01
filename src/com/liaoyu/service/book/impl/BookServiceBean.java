package com.liaoyu.service.book.impl;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.liaoyu.bean.QueryResult;
import com.liaoyu.bean.book.Book;
import com.liaoyu.bean.book.BookType;
import com.liaoyu.bean.user.User;
import com.liaoyu.service.DaoSupport;
import com.liaoyu.service.book.BookService;

@Service
public class BookServiceBean extends DaoSupport<Book> implements BookService {
	/**
	 * 增加图书但不增加图书类型
	 */
	@Override
	public void addBook(Book book, String bType, String sType) {
		Query query=em.createQuery("select o from BookType  o where bType=:bType and sType=:sType");
		query.setParameter("bType", bType);
		query.setParameter("sType", sType);
		BookType bookType=(BookType) query.getSingleResult();
		book.setBookType(bookType);
		em.persist(book);
	}
	/**
	 * 增加图书并且增加图书类型
	 */
	@Override
	public void addBookByNewType(Book book, String bType, String sType) {
		BookType bookType=new BookType();
		bookType.setbType(bType);
		bookType.setsType(sType);
		book.setBookType(bookType);
		em.persist(book);
	}
	@Override
	public void updateBook(Book book, String bType, String sType) {
		Query query=em.createQuery("select o from BookType  o where bType=:bType and sType=:sType");
		query.setParameter("bType", bType);
		query.setParameter("sType", sType);
		BookType bookType=(BookType) query.getSingleResult();
		book.setBookType(bookType);
		em.merge(book);
	}
	@Override
	public void updateBookByNewType(Book book, String bType, String sType) {
		BookType bookType=new BookType();
		bookType.setbType(bType);
		bookType.setsType(sType);
		book.setBookType(bookType);
		em.merge(book);
	}
	@Override
	@Transactional(readOnly=true,propagation=Propagation.NOT_SUPPORTED)
	public QueryResult<Book> getBestSellerBook(int size) {
		LinkedHashMap<String, String> orderBy=new LinkedHashMap<String, String>();
		orderBy.put("saleCount", "desc");
		return getScrollData(0, size,orderBy );
	}
	@Override
	@Transactional(readOnly=true,propagation=Propagation.NOT_SUPPORTED)
	public QueryResult<Book> getBestCommentBook() {
		LinkedHashMap<String, String> orderBy=new LinkedHashMap<String, String>();
		orderBy.put("commentCount", "desc");
		return getScrollData(0, 10,orderBy );
	}
	@Override
	@Transactional(readOnly=true,propagation=Propagation.NOT_SUPPORTED)
	public QueryResult<Book> getBestCollectBook() {
		LinkedHashMap<String, String> orderBy=new LinkedHashMap<String, String>();
		orderBy.put("collectCount", "desc");
		return getScrollData(0, 10,orderBy );
	}
	@Override
	@Transactional(readOnly=true,propagation=Propagation.NOT_SUPPORTED)
	public QueryResult<Book> getRecommendtBook() {
		return getScrollData(0, 6, "recommend=?1", new Object[]{1});
	}
	@Override
	public boolean addCollectBook(int bid,int uid) {
		try {
			Book book=em.find(Book.class, bid);
			User user=em.find(User.class, uid);
			boolean flag=book.isHaveCollected(user);
			if(flag){
				return false;
			}else{
				book.setCollectCount(book.getCollectCount()+1);
				book.addCollectedUser(user);
				em.merge(book);
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	@Override
	@Transactional(readOnly=true,propagation=Propagation.NOT_SUPPORTED)
	public List getSameTypeBook(int typeid) {
		String sql="select bid,bname,image,price from book where typeid=? order by saleCount desc limit 0,4";
		Query  query=em.createNativeQuery(sql).setParameter(1, typeid);
		List books=query.getResultList();
		List sameBooks=new ArrayList();
		for(int i=0;i<books.size();i++){
			Object []obj=(Object[])books.get(i);
			Book book=new Book();
			book.setBid(Integer.valueOf(obj[0].toString()));
			book.setBname(obj[1].toString());
			book.setImage(obj[2].toString());
			book.setPrice(Float.valueOf(obj[3].toString()));
			sameBooks.add(book);
		}
		return sameBooks;
	}
	@Override
	@Transactional(readOnly=true,propagation=Propagation.NOT_SUPPORTED)
	public List<Book> getCollectBook(Integer uid) {
		return em.createQuery("select o.books from User o where o.uid=?").setParameter(1, uid).getResultList();
	}
}
