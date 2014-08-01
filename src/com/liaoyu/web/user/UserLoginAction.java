package com.liaoyu.web.user;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.stereotype.Controller;

import com.liaoyu.bean.user.User;
import com.liaoyu.service.user.UserService;
import com.liaoyu.utils.CookieUtils;
import com.liaoyu.utils.MD5;
import com.opensymphony.xwork2.ActionSupport;

@Controller 
public class UserLoginAction extends ActionSupport implements SessionAware{
	private static final long serialVersionUID = 1L;
	@Resource UserService us;
	Map<String, Object> session=new HashMap<String, Object>();
	private String account;
	private String password;
	private String isAutoLogin;
	private String nextPage;
	
	public String getNextPage() {
		return nextPage;
	}
	public void setNextPage(String nextPage) {
		this.nextPage = nextPage;
	}
	public String getIsAutoLogin() {
		return isAutoLogin;
	}
	public void setIsAutoLogin(String isAutoLogin) {
		this.isAutoLogin = isAutoLogin;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
	}
	public String  generalLogin(){
		if(this.account!=null&&this.password!=null){
			String md5Pwd=MD5.MD5Encode(password);
			boolean flag=us.UserLogin(account, md5Pwd); 
			if(flag){
				User user=us.getUserInfo(account);
				if(user!=null){
					session.put("user", user);
					if("on".equals(isAutoLogin)){
						Cookie cookie=CookieUtils.addCookie(account, md5Pwd);
						ServletActionContext.getResponse().addCookie(cookie);
					}
					setNextPage("index.jsp");
					return SUCCESS;
				}
			}
		}
		setNextPage("/user/login.jsp");
		return "fail";
	}
	public String  adminLogin(){
		if(this.account!=null&&this.password!=null){
			String md5Pwd=MD5.MD5Encode(password);
			boolean flag=us.adminLogin(account, md5Pwd); 
			if(flag){
				User user=us.getUserInfo(account);
				if(user!=null){
					session.put("manager", user);
					if("on".equals(isAutoLogin)){
						Cookie cookie=CookieUtils.addCookie(account, md5Pwd);
						ServletActionContext.getResponse().addCookie(cookie);
					}
					setNextPage("/admin/index.jsp");
					return SUCCESS;
				}
			}
		}
		setNextPage("/admin/login.html");
		return "fail";
	}
}
