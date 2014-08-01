package com.liaoyu.bean.book;

import java.io.Serializable;

public class TransientOrder implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer order_id;
	private String create_date;
	private Float deliver_fee;
	private Float total_price;
	private Integer order_status;
	private String product_name;
	public Integer getOrder_id() {
		return order_id;
	}
	public void setOrder_id(Integer order_id) {
		this.order_id = order_id;
	}
	public String getCreate_date() {
		return create_date;
	}
	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}
	public Float getDeliver_fee() {
		return deliver_fee;
	}
	public void setDeliver_fee(Float deliver_fee) {
		this.deliver_fee = deliver_fee;
	}
	public Float getTotal_price() {
		return total_price;
	}
	public void setTotal_price(Float total_price) {
		this.total_price = total_price;
	}
	public Integer getOrder_status() {
		return order_status;
	}
	public void setOrder_status(Integer order_status) {
		this.order_status = order_status;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	
}
