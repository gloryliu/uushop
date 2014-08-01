package com.liaoyu.bean.book;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.compass.annotations.Index;
import org.compass.annotations.Searchable;
import org.compass.annotations.SearchableId;
import org.compass.annotations.SearchableProperty;
import org.compass.annotations.Store;

@Entity @Table(name="booktype") @Searchable(root=false)
public class BookType implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id @GeneratedValue @Column(name="typeid") @SearchableId(index=Index.NO,store=Store.YES)
	private Integer typeId;
	@Column(length=20,nullable=true,name="btype")
	@SearchableProperty(index=Index.ANALYZED,store=Store.YES)
	private String bType;
	@Column(length=20,nullable=true,name="stype")
	@SearchableProperty(index=Index.ANALYZED,store=Store.YES)
	private String sType;
	//@ManyToMany(cascade={CascadeType.REFRESH,CascadeType.PERSIST},mappedBy="bookType")
	@OneToMany(cascade=CascadeType.REFRESH,mappedBy="bookType")
	private Set<Book> books=new HashSet<Book>();
	
	
	public BookType(String bType, String sType) {
		super();
		this.bType = bType;
		this.sType = sType;
	}
	public BookType() {
		super();
	}
	public Set<Book> getBooks() {
		return books;
	}
	public void setBooks(Set<Book> books) {
		this.books = books;
	}
	public Integer getTypeId() {
		return typeId;
	}
	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}
	public String getbType() {
		return bType;
	}
	public void setbType(String bType) {
		this.bType = bType;
	}
	public String getsType() {
		return sType;
	}
	public void setsType(String sType) {
		this.sType = sType;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((typeId == null) ? 0 : typeId.hashCode());
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
		BookType other = (BookType) obj;
		if (typeId == null) {
			if (other.typeId != null)
				return false;
		} else if (!typeId.equals(other.typeId))
			return false;
		return true;
	}
	
}
