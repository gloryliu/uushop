package com.liaoyu.web.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.stereotype.Controller;

import com.liaoyu.bean.user.Address;
import com.liaoyu.bean.user.User;
import com.liaoyu.service.user.AddressService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Controller
public class AddressAction extends ActionSupport implements ModelDriven<Address>,SessionAware{
	private static final long serialVersionUID = 1L;
	Map<String, Object> session=new HashMap<String, Object>();
	Address address=new Address();
	private String nextPage;
	@Resource AddressService as;
	
	public String getNextPage() {
		return nextPage;
	}
	public void setNextPage(String nextPage) {
		this.nextPage = nextPage;
	}
	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
	}
	@Override
	public Address getModel() {
		return address;
	}
	public String add(){
		User user=(User)session.get("user");
/*		System.out.println(address.getAid()+"\t"+address.getConsignee()+"\t"+address.getProvince()+"\t"+
		address.getCity()+"\t"+address.getRegion()+"\t"+address.getAddrDetail()+"\t"+address.getZipCode()+"\t"+
				address.getMobile()+"\t"+address.getTelephone()+"\t"+address.getFlag());*/
		PrintWriter out = null;
		try {
			out=ServletActionContext.getResponse().getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		if(user==null){
			out.print("login");
			return null;
		}
		int aid=as.addAddress(address, user.getUid());
		out.print(aid);
		return null;
	}
	public String get(){
		User user=(User)session.get("user");
		this.clearMessages();
		if(user==null){
			addActionMessage("对不起您尚未登录！");
			return ERROR;
		}
		Set<Address> address=as.getAllAddress(user.getUid());
		setNextPage("card/card_address.jsp");
		ActionContext.getContext().put("addresss", address);
		return SUCCESS;
	}
}
