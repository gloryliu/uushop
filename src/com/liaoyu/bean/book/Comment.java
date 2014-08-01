package com.liaoyu.bean.book;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.liaoyu.bean.user.User;

@Entity @Table(name="comment")
public class Comment implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id @GeneratedValue
	private Integer cid;		//评论ID
	@Column(length=250, nullable=false)
	private String content;	//评论内容
	@Column(length=20)
	private String pdate;		//评论时间
	@Column(length=20)
	private String bdate;		//购买时间
	@ManyToOne(fetch=FetchType.LAZY,cascade={CascadeType.REFRESH},optional=false) 
	@JoinColumn(name="uid",nullable=false)
	private User user=new User();	//评论者
	@ManyToOne(fetch=FetchType.LAZY,cascade={CascadeType.REFRESH},optional=false) 
	@JoinColumn(name="bid",nullable=false)
	private Book book=new Book();	//对应的图书
	
	
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	public String getBdate() {
		return bdate;
	}
	public void setBdate(String bdate) {
		this.bdate = bdate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPdate() {
		return pdate;
	}
	public void setPdate(String pdate) {
		this.pdate = pdate;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((cid == null) ? 0 : cid.hashCode());
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
		Comment other = (Comment) obj;
		if (cid == null) {
			if (other.cid != null)
				return false;
		} else if (!cid.equals(other.cid))
			return false;
		return true;
	}
}
