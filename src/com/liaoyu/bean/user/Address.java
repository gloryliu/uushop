package com.liaoyu.bean.user;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.liaoyu.bean.book.Order;

@Entity @Table(name="address")
public class Address implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id @GeneratedValue
	private Integer aid;				//地址ID
	@Column(length=30)
	private String consignee;		//收获人姓名
	@Column(length=8)
	private String province;			//省
	@Column(length=8)
	private String city;			    //市
	@Column(length=8)
	private String region;			//地区
	@Column(length=60)
	private String addrDetail;			//详细地址
	@Column(length=20)
	private String zipCode;			//邮政编码
	@Column(length=15)
	private String mobile;			//收获手机号
	@Column(length=15)
	private String telephone;			//收获固定电话
	@Column(length=2)
	private String flag="0";			//是否默认
	@ManyToOne(cascade=CascadeType.REFRESH)
	@JoinColumn(name="uid")
	private User user;	//定义地址所隶属的用户
	@OneToMany(cascade=CascadeType.REFRESH,mappedBy="address")
	private Set<Order> order=new HashSet<Order>();
	
	
	public Integer getAid() {
		return aid;
	}
	public void setAid(Integer aid) {
		this.aid = aid;
	}
	public String getConsignee() {
		return consignee;
	}
	public void setConsignee(String consignee) {
		this.consignee = consignee;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getAddrDetail() {
		return addrDetail;
	}
	public void setAddrDetail(String addrDetail) {
		this.addrDetail = addrDetail;
	}
	public String getZipCode() {
		return zipCode;
	}
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Set<Order> getOrder() {
		return order;
	}
	public void setOrder(Set<Order> order) {
		this.order = order;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((aid == null) ? 0 : aid.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Address other = (Address) obj;
		if (aid == null) {
			if (other.aid != null)
				return false;
		} else if (!aid.equals(other.aid))
			return false;
		return true;
	}
	
}
