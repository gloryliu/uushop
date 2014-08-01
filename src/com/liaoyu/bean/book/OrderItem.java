package com.liaoyu.bean.book;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity @Table(name="orderitem")
public class OrderItem implements Serializable {
	private static final long serialVersionUID = 1L;
	/* 订单项ID */
	@Id @GeneratedValue @Column(name="item_id")
	private Integer itemid;
	/* 产品名称 */
	@Column(name="product_name",length=20)
	private String productName;
	/* 产品id */
	@Column(name="product_id",length=10)
	private Integer productid;
	/* 产品销售价 */
	@Column(name="product_price",length=12)
	private Float productPrice = 0f;
	/* 购买数量 */
	@Column(length=4)
	private Integer amount = 1;
	/* 所属订单 */
	@ManyToOne(cascade=CascadeType.REFRESH)
	@JoinColumn(name="order_id")
	private Order order;
	
	
	public Integer getItemid() {
		return itemid;
	}
	public void setItemid(Integer itemid) {
		this.itemid = itemid;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public Integer getProductid() {
		return productid;
	}
	public void setProductid(Integer productid) {
		this.productid = productid;
	}
	public Float getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(Float productPrice) {
		this.productPrice = productPrice;
	}
	public Integer getAmount() {
		return amount;
	}
	public void setAmount(Integer amount) {
		this.amount = amount;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
}
