package com.liaoyu.bean.user;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.liaoyu.bean.book.Book;
import com.liaoyu.bean.book.Order;

@Entity @Table(name="user")
public class User implements Serializable{
	private static final long serialVersionUID = 1L;
	@Id @GeneratedValue(strategy=GenerationType.AUTO) 
	private Integer uid;		//用户ID
	@Column(length=20,nullable=false,unique=true)
	private String account;		//用户注册时用的邮箱或电话号码
	@Column(length=50,nullable=false)
	private String password;		//用户密码
	@Column(length=30,nullable=false)
	private String nickname;		//用户昵称
	@Column(length=30)
	private String photo="default.jpg";	//用户头像
	@Enumerated(EnumType.STRING) @Column(length=8)
	private Type type=Type.GENERAL;	//用户的类型
	@Column(length=5)
	private Integer status=0;	//用户的状态0普通 1锁定 
	@Column(length=5,name="message_count")
	private Integer messageCount=0;	//用户的信息数量
	@Column(length=5,name="points_count")
	private Integer pointsCount=0;	//用户的积分
	@OneToMany(cascade=CascadeType.ALL,mappedBy="user")
	private Set<Address> address=new HashSet<Address>();		//用户对应的地址
	@ManyToMany(cascade=CascadeType.REFRESH,mappedBy="users")
	private Set<Book> books=new HashSet<Book>();	//收藏的图书
	@OneToMany(cascade=CascadeType.ALL,mappedBy="user")
	private Set<Order> order=new HashSet<Order>();			//用户的订单
	
	public Set<Order> getOrder() {
		return order;
	}
	public void setOrder(Set<Order> order) {
		this.order = order;
	}
	public Integer getPointsCount() {
		return pointsCount;
	}
	public void setPointsCount(Integer pointsCount) {
		this.pointsCount = pointsCount;
	}
	public Set<Book> getBooks() {
		return books;
	}
	public void setBooks(Set<Book> books) {
		this.books = books;
	}
	public Set<Address> getAddress() {
		return address;
	}
	public void setAddress(Set<Address> address) {
		this.address = address;
	}
	public Integer getMessageCount() {
		return messageCount;
	}
	public void setMessageCount(Integer messageCount) {
		this.messageCount = messageCount;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public Type getType() {
		return type;
	}
	public void setType(Type type) {
		this.type = type;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public User(String account, String password, String nickname, Type type) {
		super();
		this.account = account;
		this.password = password;
		this.nickname = nickname;
		this.type = type;
	}
	//增加地址
	public void addAddress(Address address){
		this.address.add(address);
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((uid == null) ? 0 : uid.hashCode());
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
		User other = (User) obj;
		if (uid == null) {
			if (other.uid != null)
				return false;
		} else if (!uid.equals(other.uid))
			return false;
		return true;
	}
	
}
