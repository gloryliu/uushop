package com.liaoyu.bean;

import java.util.List;
/**
 * 查询结果
 * @param <T>
 */
public class QueryResult<T> {
	/* 记录集 */
	private List<T> resultlist;
	/* 总记录数 */
	private int recordtotal;
	public List<T> getResultlist() {
		return resultlist;
	}
	public void setResultlist(List<T> resultlist) {
		this.resultlist = resultlist;
	}
	public int getRecordtotal() {
		return recordtotal;
	}
	public void setRecordtotal(int recordtotal) {
		this.recordtotal = recordtotal;
	}
	

}
