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
import javax.persistence.JoinTable;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.compass.annotations.Index;
import org.compass.annotations.Searchable;
import org.compass.annotations.SearchableComponent;
import org.compass.annotations.SearchableId;
import org.compass.annotations.SearchableProperty;
import org.compass.annotations.Store;

import com.liaoyu.bean.user.User;

@Entity @Table(name="book") @Searchable
public class Book implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id @GeneratedValue @SearchableId(index=Index.NO,store=Store.YES)
	private Integer bid;		//图书编号
	@Column(length=20, nullable=false)
	@SearchableProperty(index=Index.ANALYZED,store=Store.YES,boost=10)
	private String bname;	//图书名称
	@Column(length=10, nullable=false)
	@SearchableProperty(index=Index.NO,store=Store.YES)
	private Float price=0f;		//图书价格
	@Column(length=20)
	@SearchableProperty(index=Index.ANALYZED,store=Store.YES,boost=5)
	private String author;	//图书作者
	@Column(length=30)
	@SearchableProperty(index=Index.ANALYZED,store=Store.YES)
	private String publishCompany;		//出版社
	@Column(length=10)
	@SearchableProperty(index=Index.NO,store=Store.YES)
	private String publishDate;			//出版时间
	@Column(length=30)
	@SearchableProperty(index=Index.NO,store=Store.YES)
	private String image="default.jpg";						//图书图片
	@Lob
	@SearchableProperty(index=Index.ANALYZED,store=Store.YES)
	private String bookInfo;				//图书描述
	@Column(length=5)
	@SearchableProperty(index=Index.NO,store=Store.YES)
	private Integer commentCount=0;		//评论数量
	@Column(length=6)
	@SearchableProperty(index=Index.NO,store=Store.YES)
	private Integer inventoryCount=20;		//库存数量
	@Column(length=5)
	@SearchableProperty(index=Index.NO,store=Store.YES)
	private Integer saleCount=0;				//售出数量
	@Column(length=5,name="collect_count")
	@SearchableProperty(index=Index.NO,store=Store.YES)
	private Integer collectCount=0;			//收藏数量
	@Column(length=2)
	private Integer recommend=0;	//是否推荐 0不推荐 1推荐 
	@Column(length=2)
	private Integer online=0;	//是否推荐 0不可在线浏览 1可在线浏览
	/*定义用户所收藏的图书 为多对多关系*/
	@ManyToMany(cascade={CascadeType.REFRESH})
	@JoinTable(name="collect_book",inverseJoinColumns=@JoinColumn(name="uid"),
	joinColumns=@JoinColumn(name="bid"))
	private Set<User> users=new HashSet<User>();		
	@ManyToOne(cascade={CascadeType.REFRESH,CascadeType.PERSIST,CascadeType.MERGE},optional=false)
	@JoinColumn(name="typeid",nullable=false) @SearchableComponent
	private BookType bookType=new BookType();		//图书类型
	@OneToMany(cascade=CascadeType.ALL,mappedBy="book",fetch=FetchType.EAGER)
	private Set<Comment> comments=new HashSet<Comment>();		//图书对应的评论
	
	public Integer getOnline() {
		return online;
	}
	public void setOnline(Integer online) {
		this.online = online;
	}
	public Integer getRecommend() {
		return recommend;
	}
	public void setRecommend(Integer recommend) {
		this.recommend = recommend;
	}
	public Set<User> getUsers() {
		return users;
	}
	public void setUsers(Set<User> users) {
		this.users = users;
	}	
	public Integer getCollectCount() {
		return collectCount;
	}
	public void setCollectCount(Integer collectCount) {
		this.collectCount = collectCount;
	}
	public BookType getBookType() {
		return bookType;
	}
	public void setBookType(BookType bookType) {
		this.bookType = bookType;
	}
	public Integer getInventoryCount() {
		return inventoryCount;
	}
	public void setInventoryCount(Integer inventoryCount) {
		this.inventoryCount = inventoryCount;
	}
	public Integer getSaleCount() {
		return saleCount;
	}
	public void setSaleCount(Integer saleCount) {
		this.saleCount = saleCount;
	}
	public Set<Comment> getComments() {
		return comments;
	}
	public void setComments(Set<Comment> comments) {
		this.comments = comments;
	}
	public Integer getCommentCount() {
		return commentCount;
	}
	public void setCommentCount(Integer commentCount) {
		this.commentCount = commentCount;
	}
	public Integer getBid() {
		return bid;
	}
	public void setBid(Integer bid) {
		this.bid = bid;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public Float getPrice() {
		return price;
	}
	public void setPrice(Float price) {
		this.price = price;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPublishCompany() {
		return publishCompany;
	}
	public void setPublishCompany(String publishCompany) {
		this.publishCompany = publishCompany;
	}
	public String getPublishDate() {
		return publishDate;
	}
	public void setPublishDate(String publishDate) {
		this.publishDate = publishDate;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getBookInfo() {
		return bookInfo;
	}
	public void setBookInfo(String bookInfo) {
		this.bookInfo = bookInfo;
	}
	public void addCollectedUser(User collectedUser){
		this.users.add(collectedUser);
	}
	public boolean isHaveCollected(User collectedUser){
		if(getUsers().contains(collectedUser))return true;
		return false;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((bid == null) ? 0 : bid.hashCode());
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
		Book other = (Book) obj;
		if (bid == null) {
			if (other.bid != null)
				return false;
		} else if (!bid.equals(other.bid))
			return false;
		return true;
	}
	
}
