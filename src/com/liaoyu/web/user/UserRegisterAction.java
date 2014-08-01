package com.liaoyu.web.user;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.liaoyu.bean.user.User;
import com.liaoyu.service.user.UserService;
import com.liaoyu.utils.MD5;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Controller @Scope("prototype")
public class UserRegisterAction extends ActionSupport implements ModelDriven<User>,SessionAware{
	private static final long serialVersionUID = 1L;
	@Resource UserService us;
	Map<String, Object> session=new HashMap<String, Object>();
	User user=new User();
	private String rpassword;
	private String valcode;
	private String isAgree;
	
	public String getRpassword() {
		return rpassword;
	}
	public void setRpassword(String rpassword) {
		this.rpassword = rpassword;
	}
	public String getValcode() {
		return valcode;
	}
	public void setValcode(String valcode) {
		this.valcode = valcode;
	}
	public String getIsAgree() {
		return isAgree;
	}
	public void setIsAgree(String isAgree) {
		this.isAgree = isAgree;
	}
	
	@Override
	public User getModel() {
		return user;
	}
	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
	}
	public String  register(){
		if(valcode!=null&&!"".equals(valcode)){
			String autoValcode=session.get("valcode").toString();
			if(autoValcode.equals(valcode)){
				if(user.getAccount()!=null&&user.getPassword()!=null&&rpassword!=null&&isAgree!=null&&"on".equals(isAgree)&&rpassword.equals(user.getPassword())){
					user.setPassword(MD5.MD5Encode(user.getPassword()));
					String str=user.getAccount();
					user.setNickname(str.substring(0, str.indexOf("@")));
					us.save(user);
					return "success";
				}
			}
		}
		return "fail";
	}
}
