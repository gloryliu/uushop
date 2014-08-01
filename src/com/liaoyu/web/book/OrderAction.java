package com.liaoyu.web.book;

import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.interceptor.SessionAware;
import org.springframework.stereotype.Controller;

import com.liaoyu.bean.book.Book;
import com.liaoyu.bean.book.Order;
import com.liaoyu.bean.book.OrderItem;
import com.liaoyu.bean.book.TransientBook;
import com.liaoyu.bean.book.TransientOrder;
import com.liaoyu.bean.user.User;
import com.liaoyu.service.book.BookService;
import com.liaoyu.service.book.OrderService;
import com.liaoyu.web.BaseAction;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.Preparable;

@Controller
public class OrderAction extends BaseAction implements Preparable,SessionAware{
	private static final long serialVersionUID = 1L;
	@Resource OrderService os;
	@Resource BookService bs;
	private String bids;	//图书的ID集
	private String counts;	//图书对应的数量集
	private Integer aid;		//使用的地址
	private String kuaidi;	//送货方式
	private String huokuan;	//支付方式
	private String note;		//用户留言
	private Float product_price=0f;	//商品总价格
	private Float deliver_fee=5f;	//商品运费
	private String nextPage;	
	private String item[];	//定单ID
	Map<String, Object> session=new HashMap<String, Object>();
	PrintWriter out=null;
	@Override
	public void prepare() throws Exception {
		out=getResponse().getWriter();
	}
	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
	}
	public String[] getItem() {
		return item;
	}
	public void setItem(String[] item) {
		this.item = item;
	}
	public String getBids() {
		return bids;
	}
	public void setBids(String bids) {
		this.bids = bids;
	}
	public String getCounts() {
		return counts;
	}
	public void setCounts(String counts) {
		this.counts = counts;
	}
	public Integer getAid() {
		return aid;
	}
	public void setAid(Integer aid) {
		this.aid = aid;
	}
	public String getKuaidi() {
		return kuaidi;
	}
	public void setKuaidi(String kuaidi) {
		this.kuaidi = kuaidi;
	}
	public String getHuokuan() {
		return huokuan;
	}
	public void setHuokuan(String huokuan) {
		this.huokuan = huokuan;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getNextPage() {
		return nextPage;
	}
	public void setNextPage(String nextPage) {
		this.nextPage = nextPage;
	}
	//添加订单
	@SuppressWarnings("deprecation")
	public String add(){
		//System.out.println(bids+"\t"+counts+"\t"+aid+"\t"+kuaidi+"\t"+huokuan+"\t"+note);
		User user=(User) session.get("user");
		if(user!=null&&bids!=null&&bids.length()>0&&counts!=null&&counts.length()>0){
			String []bidArray=bids.split("_");
			String []countArray=counts.split("_");
			Order order=new Order();
			for(int i=0;i<bidArray.length;i++){
				Book book=bs.find(Integer.valueOf(bidArray[i]));
				if(book!=null){
					OrderItem orderitem=new OrderItem();
					orderitem.setProductid(Integer.valueOf(bidArray[i]));
					orderitem.setProductName(book.getBname());
					orderitem.setProductPrice(Float.valueOf(book.getPrice()));
					orderitem.setAmount(Integer.valueOf(countArray[i]));
					order.addOrderItem(orderitem);
					//求价格和
					product_price+=book.getPrice()*(Integer.valueOf(countArray[i]));		
					//修改图书售出数量
					book.setSaleCount(book.getSaleCount()+1);
					//修改图书库存数量
					book.setInventoryCount(book.getInventoryCount()-1);
					bs.update(book);
				}
			}
			order.setCreateDate(new Date().toLocaleString());
			order.setDeliverFee(deliver_fee);
			order.setProductTotalPrice(product_price);
			order.setPayablefee(product_price+deliver_fee);
			order.setTotalPrice(product_price+deliver_fee);
			order.setNote(note);
			if("fast_deliver".equals(kuaidi))order.setDeliverWay(1);
			if("face_pay".equals(huokuan))order.setPaymentWay(1);
			os.addOrder(user.getUid(), aid, order);
			setNextPage("/card/card_sure.jsp");
			return SUCCESS;		
		}else{
			return ERROR;
		}
	}
	//锁定定单
	public String lock(){
		if(item!=null&&item.length>0){
			try {
				for(String num:item){
					Order order=os.find(Integer.valueOf(num));
					if(order!=null){
						order.setOrderStatus(1);
						os.update(order);
					}
				}
			} catch (NumberFormatException e) {
				this.addActionMessage("对不起，出错啦");
				setNextPage("/share/message.jsp");
				return "error";
			}
			this.addActionMessage("锁定成功");
			setNextPage("/showOrder.do");
			return "toAction";
		}
		else{
			this.addActionMessage("对不起，出错啦");
			setNextPage("/share/message.jsp");
			return "error";
		}
	}
	//解锁定单
	public String unlock(){
		if(item!=null&&item.length>0){
			try {
				for(String num:item){
					Order order=os.find(Integer.valueOf(num));
					if(order!=null){
						order.setOrderStatus(0);
						os.update(order);
					}
				}
			} catch (NumberFormatException e) {
				this.addActionMessage("对不起，出错啦");
				setNextPage("/share/message.jsp");
				return "error";
			}
			this.addActionMessage("解锁成功");
			setNextPage("/showOrder.do");
			return "toAction";
		}
		else{
			this.addActionMessage("对不起，出错啦");
			setNextPage("/share/message.jsp");
			return "error";
		}
	}
	//定单完成支付
	public String payment(){
		if(item!=null&&item.length>0){
			try {
				for(String num:item){
					Order order=os.find(Integer.valueOf(num));
					if(order!=null){
						order.setOrderStatus(2);
						os.update(order);
					}
				}
			} catch (NumberFormatException e) {
				this.addActionMessage("对不起，出错啦");
				setNextPage("/share/message.jsp");
				return "error";
			}
			this.addActionMessage("支付成功");
			setNextPage("getMyOrder.do");
			return "toAction";
		}
		else{
			this.addActionMessage("对不起，出错啦");
			setNextPage("/share/message.jsp");
			return "error";
		}
	}
	//获取用户的所有定单
	public String getMy(){
		User user=(User) getRequest().getSession().getAttribute("user");
		List<TransientOrder> morders=os.getMyOrder(user.getUid());
		ActionContext.getContext().put("myorders", morders);
		return "tomyorders";
	}
	//获取支付完成的图书
	public String getHavePay(){
		User user=(User) getRequest().getSession().getAttribute("user");
		if(user==null){
			out.print("<script>window.history.back();alert('请先登录！');</script>");
			return null;
		}
		List<TransientBook> morders=os.getHaveBuyBook(user.getUid());
		ActionContext.getContext().put("payedorders", morders);
		return "tohavepayorders";
	}

	
}
