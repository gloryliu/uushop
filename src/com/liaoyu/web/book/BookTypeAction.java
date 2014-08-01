package com.liaoyu.web.book;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;

import com.liaoyu.bean.book.TransientBookType;
import com.liaoyu.service.book.BookTypeService;

@Controller
public class BookTypeAction{
	@Resource BookTypeService bts;
	private String btype;
	public String getBtype() {
		return btype;
	}
	public void setBtype(String btype) {
		this.btype = btype;
	}
	public  String showBigType(){
		List bookTypes=bts.searchBtype();
		try {
			if(bookTypes!=null&&bookTypes.size()>0){
				PrintWriter out=ServletActionContext.getResponse().getWriter();
				StringBuffer str=new StringBuffer();
				for(Object item:bookTypes){
					str.append(item.toString()+",");
				}
				out.print(str.substring(0, str.lastIndexOf(",")));
				out.close();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	public  String showSmallType(){
		List bookTypes=bts.searchStype(btype);
		try {
			if(bookTypes!=null&&bookTypes.size()>0){
				PrintWriter out=ServletActionContext.getResponse().getWriter();
				StringBuffer str=new StringBuffer();
				for(Object item:bookTypes){
					str.append(item.toString()+",");
				}
				out.print(str.substring(0, str.lastIndexOf(",")));
				out.close();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	//获取商品分类统计数据
	public String getAnalysisTypeData(){
		PrintWriter out=null;
		try {
			out=ServletActionContext.getResponse().getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		List<TransientBookType> booktypes=bts.getBookTypeCount();
		StringBuffer buffer=new StringBuffer();
		buffer.append("[");
		for(TransientBookType item:booktypes)
			buffer.append("{value:"+item.getValue()+",name:'"+item.getName()+"'},");
		buffer.deleteCharAt(buffer.length()-1);
		buffer.append("]");
		out.print(buffer.toString());
		return null;
	}
	
}
