package com.liaoyu.bean.book;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.liaoyu.bean.user.Address;
import com.liaoyu.bean.user.User;

@Entity @Table(name="order_table")
public class Order implements Serializable {
	private static final long serialVersionUID = 1L;
	/* 订单号 */
	//(generator = "system-uuid")      @Column(name="order_id")
	//@GenericGenerator(name = "system-uuid", strategy = "uuid") 
   /*订单编号*/
	@Id @GeneratedValue @Column(name="order_id",length=50)
	private Integer oid;
	/* 订单创建时间 */
	@Column(name="create_date",length=50)
	private String createDate;
	/* 商品总金额 */
	@Column(name="product_price",length=12)
	private Float productTotalPrice = 0f;
	/* 配送费 */
	@Column(name="deliver_fee",length=12)
	private Float deliverFee = 0f;
	/* 订单总金额 */
	@Column(name="total_price",length=12)
	private Float totalPrice= 0f;
	/* 应付款(实际需要支付的费用) */
	@Column(length=12)
	private Float payablefee = 0f;
	/* 顾客附言 */
	@Column(length=50)
	private String note;
	/*送货方式 0普通快递  1特快快递*/
	@Column(length=2,name="deliver_way")
	private Integer deliverWay=0;
	/*支付方式 0网上支付  1货到付款*/
	@Column(length=2,name="payment_way")
	private Integer  paymentWay=0;
	/*订单状态 0未支付 1锁定 2支付成功 5评论完成*/
	@Column(length=2,name="order_status")
	private Integer orderStatus=0;
	/*配送地址*/
	@ManyToOne(cascade={CascadeType.REFRESH,CascadeType.PERSIST,CascadeType.MERGE},optional=false)
	@JoinColumn(name="address_id")
	private Address address;
	//	购买者
	@ManyToOne(cascade=CascadeType.REFRESH,optional=false)
	@JoinColumn(name="buy_id")
	private User user;
	//	订单项
	@OneToMany(cascade=CascadeType.ALL,mappedBy="order",fetch=FetchType.LAZY)
	private Set<OrderItem> orderItem=new HashSet<OrderItem>();
	
	
	

	public String getCreateDate() {
		return createDate;
	}
	public Integer getOid() {
		return oid;
	}
	public void setOid(Integer oid) {
		this.oid = oid;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public Float getProductTotalPrice() {
		return productTotalPrice;
	}
	public void setProductTotalPrice(Float productTotalPrice) {
		this.productTotalPrice = productTotalPrice;
	}
	public Float getDeliverFee() {
		return deliverFee;
	}
	public void setDeliverFee(Float deliverFee) {
		this.deliverFee = deliverFee;
	}
	public Float getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(Float totalPrice) {
		this.totalPrice = totalPrice;
	}
	public Float getPayablefee() {
		return payablefee;
	}
	public void setPayablefee(Float payablefee) {
		this.payablefee = payablefee;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public Integer getDeliverWay() {
		return deliverWay;
	}
	public void setDeliverWay(Integer deliverWay) {
		this.deliverWay = deliverWay;
	}
	public Integer getPaymentWay() {
		return paymentWay;
	}
	public void setPaymentWay(Integer paymentWay) {
		this.paymentWay = paymentWay;
	}
	public Integer getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(Integer orderStatus) {
		this.orderStatus = orderStatus;
	}
	public Address getAddress() {
		return address;
	}
	public void setAddress(Address address) {
		this.address = address;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Set<OrderItem> getOrderItem() {
		return orderItem;
	}
	public void setOrderItem(Set<OrderItem> orderItem) {
		this.orderItem = orderItem;
	}
	public void addOrderItem(OrderItem orderItem){
		orderItem.setOrder(this);
		this.orderItem.add(orderItem);
	}
	
}
