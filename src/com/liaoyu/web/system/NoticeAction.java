package com.liaoyu.web.system;

import java.io.PrintWriter;
import java.util.Date;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.liaoyu.bean.Notice;
import com.liaoyu.service.user.NoticeService;
import com.liaoyu.web.BaseAction;
import com.opensymphony.xwork2.Preparable;

@Controller	@Scope("prototype")
public class NoticeAction extends BaseAction implements Preparable{
	private static final long serialVersionUID = 1L;
	private PrintWriter out;
	@Resource  NoticeService ns;
	private String ncontent;
	private String item[];
	
	public String[] getItem() {
		return item;
	}
	public void setItem(String[] item) {
		this.item = item;
	}
	public String getNcontent() {
		return ncontent;
	}
	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
	}
	@Override
	public void prepare() throws Exception {
		out=getResponse().getWriter();
	}
	public String add(){
		try {
			Notice notice=new Notice();
			notice.setnContent(getNcontent());
			notice.setnTime(new Date().toLocaleString());
			ns.save(notice);
			out.print(0);
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			out.print(1);
			return null;
		}
	}
	public String delete(){
		if(item!=null&&item.length>0){
			try {
				for(String num:item)
					ns.delete(Integer.parseInt(num));
			} catch (NumberFormatException e) {
				this.addActionMessage("对不起，出错啦");
				return "error";
			}
			this.addActionMessage("删除成功");
			return SUCCESS;
		}
		else{
			this.addActionMessage("对不起，出错啦");
			return "error";
		}
	}

}
