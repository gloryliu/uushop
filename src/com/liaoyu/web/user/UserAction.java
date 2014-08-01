package com.liaoyu.web.user;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.stereotype.Controller;

import com.liaoyu.bean.user.User;
import com.liaoyu.service.user.UserService;
import com.liaoyu.utils.CookieUtils;
import com.liaoyu.utils.MD5;
import com.liaoyu.utils.StringUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

@Controller
public class UserAction extends ActionSupport implements ModelDriven<User>,SessionAware,Preparable{
	private static final long serialVersionUID = 1L;
	@Resource UserService us;
	Map<String, Object> session=new HashMap<String, Object>();
	private String item[];
	User user=new User();
	private String nextPage;
	private String valcode;
	private PrintWriter out;
	private File image;
	private String imageFileName;
	private String imageContentType;
	
	public String getImageContentType() {
		return imageContentType;
	}
	public void setImageContentType(String imageContentType) {
		this.imageContentType = imageContentType;
	}
	public File getImage() {
		return image;
	}
	public void setImage(File image) {
		this.image = image;
	}
	public String getImageFileName() {
		return imageFileName;
	}
	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}
	public String getNpassword() {
		return npassword;
	}
	public void setNpassword(String npassword) {
		this.npassword = npassword;
	}
	private String npassword;
	
	public String[] getItem() {
		return item;
	}
	public void setItem(String[] item) {
		this.item = item;
	}
	public String getValcode() {
		return valcode;
	}
	public void setValcode(String valcode) {
		this.valcode = valcode;
	}
	public String getNextPage() {
		return nextPage;
	}
	public void setNextPage(String nextPage) {
		this.nextPage = nextPage;
	}
	@Override
	public void prepare() throws Exception {
		out=ServletActionContext.getResponse().getWriter();
	}	
	@Override
	public User getModel() {
		return user;
	}
	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
	}
	public String  exist(){
		try {
			boolean flag=us.exists(user.getAccount());
			PrintWriter out=ServletActionContext.getResponse().getWriter();
			out.print(flag);
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	public String  checkValcode(){
		try {
			String provalcode=session.get("valcode").toString();
			if(getValcode()!=null&&provalcode.equals(getValcode())){
				PrintWriter out=ServletActionContext.getResponse().getWriter();
				out.print("true");
				out.close();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	public String logout(){
		if(session.containsKey("user"))session.remove("user");
		setNextPage("index.jsp");
		CookieUtils.delCookie(ServletActionContext.getRequest(),ServletActionContext.getResponse());
		return "success";
	}
	public String adminLogout(){
		if(session.containsKey("manager"))session.remove("manager");
		setNextPage("/admin/login.html");
		CookieUtils.delCookie(ServletActionContext.getRequest(),ServletActionContext.getResponse());
		return "success";
	}
	//锁定用户
	public String lock(){
		if(item!=null&&item.length>0){
			for(String num:item){
				User user=us.find(Integer.valueOf(num));
				if(user!=null){
					user.setStatus(1);
					us.update(user);
				}
			}
			this.addActionMessage("锁定成功");
			setNextPage("/showUsers.do");
			return "toAction";
		}else{
			this.addActionMessage("对不起，出错啦");
			setNextPage("/share/message.jsp");
			return "fail";
		}
	}
	//解锁用户
	public String unlock(){
		if(item!=null&&item.length>0){
			for(String num:item){
				User user=us.find(Integer.valueOf(num));
				if(user!=null){
					user.setStatus(0);
					us.update(user);
				}
			}
			this.addActionMessage("解锁成功");
			setNextPage("/showUsers.do");
			return "toAction";
		}else{
			this.addActionMessage("对不起，出错啦");
			setNextPage("/share/message.jsp");
			return "fail";
		}
	}
	//修改用户昵称
	public String changeNickname(){
		try {
			User nowUser=us.find(user.getUid());
			nowUser.setNickname(user.getNickname());
			us.save(nowUser);
			ActionContext.getContext().getSession().put("user", nowUser);
		} catch (Exception e) {
			e.printStackTrace();
			out.print(2);
			return null;
		}
		out.print(0);
		return null;
	}
	//修改密码
	public String changePassword(){
		try {
			if(npassword!=null&&npassword.length()>0){
				User nowUser=us.find(user.getUid());
				if(!MD5.MD5Encode(user.getPassword()).equals(nowUser.getPassword())){
					out.print(3);	//输出密码错误
					return null;
				}
				nowUser.setPassword(MD5.MD5Encode(npassword));
				us.update(nowUser);
				out.print(0);
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
			out.print(2);
			return null;
		}
		out.print(1);	//新密码不能为空
		return null;
	}
	//修改用户头像
	public String updatePhoto(){
		if(image!=null){
			//获取上传路径
			String realPath=ServletActionContext.getServletContext().getRealPath("/upload/user/images");
			//获取扩展名
			String fileExt=this.imageFileName.substring(this.imageFileName.lastIndexOf("."));
			//产生文件名
			String baseName=StringUtils.getRandomName();
			File savefile=new File(new File(realPath),baseName+ fileExt);
			if(!savefile.getParentFile().exists())savefile.getParentFile().mkdirs();
			//用FileUtils工具上传文件
			try {
				FileUtils.copyFile(image,savefile);
			} catch (IOException e) {
				e.printStackTrace();
			}
			User nowUser=us.find(user.getUid());
			nowUser.setPhoto(baseName+ fileExt);
			us.update(nowUser);
			ActionContext.getContext().getSession().put("user", nowUser);
			return "toUserCenter";
		}
		out.print("<script>alert('请选择图片');window.history.back();</script>");
		return null;
	}

}
