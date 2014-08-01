package com.liaoyu.bean;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity @Table(name="notice")
public class Notice implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id @GeneratedValue
	private Integer nid;
	@Column(length=20,name="n_time", nullable=false)
	private String nTime;
	@Column(length=250,name="n_content", nullable=false)
	private String nContent;
	public Integer getNid() {
		return nid;
	}
	public void setNid(Integer nid) {
		this.nid = nid;
	}
	public String getnTime() {
		return nTime;
	}
	public void setnTime(String nTime) {
		this.nTime = nTime;
	}
	public String getnContent() {
		return nContent;
	}
	public void setnContent(String nContent) {
		this.nContent = nContent;
	}
	
}
