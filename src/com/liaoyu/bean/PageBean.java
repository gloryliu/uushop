package com.liaoyu.bean;

public class PageBean {
	/*一页显示多少条记录*/
	private int pageSize=10;
	/*当前是第几页*/
	private int currentPage=0;
	/*共有几条记录*/
	private int totalCount=0;
	/*总共页数*/
	private int pageCount=0;
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount() {
		this.pageCount = getTotalCount()%pageSize==0?getTotalCount()/pageSize:getTotalCount()/pageSize+1;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	
}
