package com.liaoyu.web.user;

import java.io.PrintWriter;
import java.io.StringWriter;
import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.Velocity;
import org.springframework.stereotype.Controller;

import com.liaoyu.bean.user.User;
import com.liaoyu.service.user.UserService;
import com.liaoyu.utils.EmailSender;
import com.liaoyu.utils.MD5;
import com.liaoyu.web.BaseAction;
import com.opensymphony.xwork2.Preparable;

@Controller
public class FindPasswordAction extends BaseAction implements Preparable{
	private static final long serialVersionUID = 1L;
	private String username;
	private String validateCode;
	private String password;
	private PrintWriter out;
	@Resource UserService us;
	@Override
	public void prepare() throws Exception {
		out=getResponse().getWriter();
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getValidateCode() {
		return validateCode;
	}
	public void setValidateCode(String validateCode) {
		this.validateCode = validateCode;
	}
	public String sendEmail(){
		//判断帐号不能为空
		if(username!=null&&username.trim().length()>0){
			//判断该帐号是否已经注册
			boolean flag=us.exists(username);
			if(!flag){
				//表示该帐号未使用
				out.print("<script>window.history.back();alert('抱歉，该帐号尚未使用呢！');</script>");
				return null;
			}
			User user=us.getUserInfo(username);
			try {
				//Velocity发送邮件
				Template template = Velocity.getTemplate("findPasswordEmail.html");
				VelocityContext context = new VelocityContext();
				context.put("username", user.getAccount());
				context.put("validateCode", MD5.MD5Encode(user.getAccount()+user.getPassword()));
				StringWriter writer = new StringWriter(); 
				template.merge(context, writer);
				String content = writer.toString();
				EmailSender.send(username, "优优图书商城--找回密码", content, "text/html");
				out.print("<script>window.history.back();alert('请查看邮件');</script>");
				return null;
			} catch (Exception e) {
				e.printStackTrace();
				out.print("<script>window.history.back();alert('抱歉系统异常');</script>");
				return null;
			}
		}
		out.print("<script>window.history.back();alert('帐号不能为空！');</script>");
		return null;
	}
	public String validateInfo(){
		this.clearMessages();
		if(username==null||validateCode==null){
			addActionMessage("抱歉，请访问正确的网址！");
			return ERROR;
		}
		if(StringUtils.isEmpty(username.trim())||StringUtils.isEmpty(validateCode.trim())){
			addActionMessage("抱歉，请访问正确的网址！");
			return ERROR;
		}
		User user=us.getUserInfo(username);
		String nowValidateCode=MD5.MD5Encode(user.getAccount()+user.getPassword());
		if(!nowValidateCode.equals(validateCode)){
			addActionMessage("抱歉，验证信息错误！");
			return ERROR;
		}
		return SUCCESS;
	}
	
	public String resetPassword(){
		if(username!=null&&username.trim().length()>0){
			User user=us.getUserInfo(username);
			if(user==null){
				out.print("<script>window.history.back();alert('该帐号不存在！');</script>");
				return null;
			}
			user.setPassword(MD5.MD5Encode(password));
			us.update(user);
			return "toLogin";
		}
		out.print("<script>window.history.back();alert('该帐号不存在！');</script>");
		return null;
	}

}
