package com.liaoyu.web.book;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.liaoyu.bean.book.Book;
import com.liaoyu.bean.user.User;
import com.liaoyu.service.book.BookService;
import com.liaoyu.service.book.BookTypeService;
import com.liaoyu.utils.ImageUtil;
import com.liaoyu.utils.StringUtils;
import com.liaoyu.web.BaseAction;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

@Controller	@Scope("prototype")
public class BookAction  extends BaseAction  implements Preparable,ModelDriven<Book>,SessionAware{
	private static final long serialVersionUID = 1L;
	@Resource BookService bs;
	@Resource BookTypeService bts;
	Book book=new Book();
	private String btype;
	private String stype;
	private File bimage;
	private String bimageFileName;
	private String bimageContentType;
	private String nextPage;
	private String item[];
	Map<String, Object> session=new HashMap<String, Object>();
	PrintWriter out=null;
	
	@Override
	public void prepare() throws Exception {
		out=getResponse().getWriter();
	}
	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
	}
	public String getBimageContentType() {
		return bimageContentType;
	}
	public void setBimageContentType(String bimageContentType) {
		this.bimageContentType = bimageContentType;
	}
	public String[] getItem() {
		return item;
	}
	public void setItem(String[] item) {
		this.item = item;
	}
	public String getNextPage() {
		return nextPage;
	}
	public void setNextPage(String nextPage) {
		this.nextPage = nextPage;
	}
	public File getBimage() {
		return bimage;
	}
	public void setBimage(File bimage) {
		this.bimage = bimage;
	}
	public String getBimageFileName() {
		return bimageFileName;
	}
	public void setBimageFileName(String bimageFileName) {
		this.bimageFileName = bimageFileName;
	}
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	@Override
	public Book getModel() {
		return book;
	}
	public String getStype() {
		return stype;
	}
	public void setStype(String stype) {
		this.stype = stype;
	}
	public String getBtype() {
		return btype;
	}
	public void setBtype(String btype) {
		this.btype = btype;
	}
	
	public String addBook(){
		this.clearMessages();
		try {
			boolean flag = UploadImage();
			//往数据库增添数据
			if(flag)bs.addBook(book, btype, stype);
			else bs.addBookByNewType(book, btype, stype);
		} catch (IOException e) {
			e.printStackTrace();
			setNextPage("/admin/addBook.jsp");
			this.addActionMessage("保存失败！");
			return ERROR;
		}
		setNextPage("/admin/addBook.jsp");
		this.addActionMessage("保存成功！");
		return SUCCESS;
	}
	
	public String editBook(){
		this.clearMessages();
		try {
			boolean flag = UploadImage();
			//往数据库增添数据
			if(flag)bs.updateBook(book, btype, stype);
			else bs.updateBookByNewType(book, btype, stype);
		} catch (IOException e) {
			e.printStackTrace();
			setNextPage("/admin/message.jsp");
			this.addActionMessage("保存失败！");
			return ERROR;
		}
		setNextPage("/showBook.do");
		this.addActionMessage("保存成功！");
		return "toAction";
	}
	public String deleteBook(){
		if(item!=null&&item.length>0){
			try {
				for(String num:item)
					bs.delete(Integer.parseInt(num));
			} catch (NumberFormatException e) {
				this.addActionMessage("对不起，出错啦");
				setNextPage("/share/message.jsp");
				return "error";
			}
			this.addActionMessage("删除成功");
			setNextPage("/showBook.do");
			return "toAction";
		}
		else{
			this.addActionMessage("对不起，出错啦");
			setNextPage("/share/message.jsp");
			return "error";
		}
	}
	public String searchBook(){
		book=bs.find(book.getBid());
		setNextPage("/admin/editBook.jsp");
		return SUCCESS;
	}
	public String getBookInfo(){
		Book nowBook=bs.find(book.getBid());
		ActionContext.getContext().put("bookDetail", nowBook);
		setNextPage("/user/add_comment.jsp");
		return SUCCESS;
	}
	private boolean UploadImage() throws IOException {
		if(bimage!=null){
			//获取上传路径
			String realPath=ServletActionContext.getServletContext().getRealPath("/upload/book/images");
			//获取扩展名
			String fileExt=this.bimageFileName.substring(this.bimageFileName.lastIndexOf("."), this.bimageFileName.length());
			//产生文件名
			String baseName=StringUtils.getRandomName();
			File savefile=new File(new File(realPath),baseName+ fileExt);
			File savefilemini=new File(new File(realPath),baseName+"mini"+ fileExt);
			//判断是否存在保存目录，否则创建
			if(!savefile.getParentFile().exists())savefile.getParentFile().mkdirs();
			//用FileUtils工具上传文件
			FileUtils.copyFile(bimage,savefile);
			//产生缩略图
			ImageUtil.zoom(ImageIO.read(bimage),savefilemini,120,120);
			//进行注册
			book.setImage(baseName+ fileExt);
		}
		//判断图书类型是否存在
		boolean flag=bts.exists(btype, stype);
		return flag;
	}
	public String searchById(){
		Book resultBook=bs.find(book.getBid());
		if(resultBook==null){
			addActionMessage("404，抱歉求找到该商品");
			setNextPage("/share/message.jsp");
			return "error";
		}else{
			ActionContext.getContext().put("resultBook", resultBook);
			setNextPage("/product/pdetails.jsp");
			//为浏览记录写入Cookie
			Cookie cookie=new Cookie("visited_bid", resultBook.getBid()+"");
			cookie.setMaxAge(60*60*24);	//一天
			//热门图书
			ActionContext.getContext().put("bestSellerBooks",bs.getBestSellerBook(4).getResultlist());
			//类型相似的图书
			ActionContext.getContext().put("sameTypeBooks",bs.getSameTypeBook(resultBook.getBookType().getTypeId()));
			//操作Cookie 关于最近浏览过的图书
			HttpServletRequest request=ServletActionContext.getRequest();
			HttpServletResponse response=ServletActionContext.getResponse();
			ActionContext.getContext().put("haveScanBooks",getHaveScanBook(request,response,book.getBid()));
			return SUCCESS;
		}
	}
	//通过cookie返回浏览过的图书 
	private List getHaveScanBook(HttpServletRequest request,HttpServletResponse response,int bid) {
		Cookie[] cookies=request.getCookies();
		List books=new ArrayList();
		if(cookies!=null&&cookies.length>0){
			StringBuffer bidValue=new StringBuffer("");
			int count=0;
			for(Cookie cookie:cookies){
				if("scanbid".equals(cookie.getName())){		//判断是否存在cookie
					++count;
					bidValue.append(cookie.getValue());		//获取当前的cookie
				}
			}
			//获取cookie中已经存在的值
			if(bidValue.length()>0){
				String [] bidArray=bidValue.toString().split("_");
				//限定返回的数量
				for(int k=0;k<bidArray.length&&k<4;k++){
					books.add(bs.find(Integer.valueOf(bidArray[bidArray.length-k-1])));
				}
			}
			//返回客户端的cookie操作
			if(count==0){
				response.addCookie(new Cookie("scanbid", bid+""));
			}else{
				//判断是否存在同ID的图书
				boolean flag=false;
				for(String strItem:bidValue.toString().split("_")){
					if((""+bid).equals(strItem)){
						flag=true;
					}
				}
				if(!flag){
					bidValue.append("_"+bid);
				}
				response.addCookie(new Cookie("scanbid", bidValue.toString()));
			}
		}
		return books;
	}
	public String addCollect(){
		User user=(User) session.get("user");
		PrintWriter out=null;
		try {
			out=ServletActionContext.getResponse().getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		if(user!=null){
			int uid=user.getUid();
			int bid=book.getBid();
			if(bid>0){
				boolean flag=bs.addCollectBook(bid, uid);
				if(!flag){
					out.print("收藏失败！");
					out.close();
					return null;
				}
				//修改图书收藏数量
				Book collectBook=bs.find(bid);
				collectBook.setCollectCount(collectBook.getCollectCount()+1);
				bs.update(collectBook);
				out.print("收藏成功！");
				out.close();
				return SUCCESS;
			}else{
				out.print("请选择要收藏的图书！");
				out.close();
				return null;
			}
		}else{
			out.print("对不起，您尚未登录！");
			out.close();
			return null;
		}
		
	}
	//获取已收藏的图书
	public String getCollect(){
		User user=(User) session.get("user");
		if(user==null){
			out.print("<script>window.history.back();alert('请先登录！');</script>");
			return null;
		}
		List<Book> books=bs.getCollectBook(user.getUid());
		ActionContext.getContext().put("collectBooks", books);
		return "toCollectBookPage";
	}

}
