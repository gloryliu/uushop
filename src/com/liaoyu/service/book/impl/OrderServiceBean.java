package com.liaoyu.service.book.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.liaoyu.bean.book.Order;
import com.liaoyu.bean.book.TransientBook;
import com.liaoyu.bean.book.TransientOrder;
import com.liaoyu.bean.user.Address;
import com.liaoyu.bean.user.User;
import com.liaoyu.service.DaoSupport;
import com.liaoyu.service.book.OrderService;

@Controller
public class OrderServiceBean extends DaoSupport<Order> implements OrderService{

	@Override
	public void addOrder(int uid, int aid, Order order) {
		User user=em.find(User.class, uid);
		Address address=em.find(Address.class, aid);
		//UUID.randomUUID().toString()
		order.setUser(user);
		order.setAddress(address);
		em.persist(order);
	}

	@Override
	@Transactional(readOnly=true,propagation=Propagation.NOT_SUPPORTED)
	public List<Integer> getLatelyBookId() {
		String sql="select distinct t2.product_id from order_table t1,orderitem t2 where t1.order_id=t2.order_id order by t1.create_date desc limit 0,4";
		Query query=em.createNativeQuery(sql);
		return query.getResultList();
	}

	@Override
	@Transactional(readOnly=true,propagation=Propagation.NOT_SUPPORTED)
	public List<TransientOrder> getMyOrder(int uid) {
		String sql="select t1.create_date,t1.deliver_fee,t1.total_price,t1.order_status,t2.product_name,t1.order_id from order_table t1,orderitem t2 where t1.order_id=t2.order_id and t1.buy_id=?";
		List<Object[]> myorders=em.createNativeQuery(sql).setParameter(1, uid).getResultList();
		List<TransientOrder> torders=new ArrayList<TransientOrder>();
		for(Object[] obj:myorders){
			TransientOrder torder=new TransientOrder();
			torder.setCreate_date((String) obj[0]);
			torder.setDeliver_fee((Float) obj[1]);
			torder.setTotal_price((Float) obj[2]);
			torder.setOrder_status((Integer) obj[3]);
			torder.setProduct_name((String) obj[4]);
			torder.setOrder_id((Integer) obj[5]);
			torders.add(torder);
		}
		return torders;
	}

	@Override
	@Transactional(readOnly=true,propagation=Propagation.NOT_SUPPORTED)
	public List<TransientBook> getHaveBuyBook(int uid) {
		String sql="select t1.order_id,t1.create_date,t2.product_id,t2.product_name,t2.product_price,t1.order_status from order_table t1,orderitem t2 where t1.order_id=t2.order_id and t1.buy_id=? and t1.order_status>=2";
		List<Object[]> mybooks=em.createNativeQuery(sql).setParameter(1, uid).getResultList();
		List<TransientBook> tbooks=new ArrayList<TransientBook>();
		for(Object [] obj:mybooks){
			TransientBook tbook=new TransientBook();
			tbook.setOrder_id((Integer) obj[0]);
			tbook.setCreate_date((String) obj[1]);
			tbook.setProduct_id((Integer) obj[2]);
			tbook.setProduct_name((String) obj[3]);
			tbook.setProduct_price((Float) obj[4]);
			tbook.setOrder_status((Integer) obj[5]);
			tbooks.add(tbook);
		}
		return tbooks;
	}

}
