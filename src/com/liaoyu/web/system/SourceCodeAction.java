package com.liaoyu.web.system;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileFilter;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import com.liaoyu.utils.MethodUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Controller
public class SourceCodeAction extends ActionSupport{
	private static final long serialVersionUID = 1L;
	private StringBuffer sb = new StringBuffer();
	private String id;
	private String nextPage;
	private String path;
	private String fileContent;
	
	public String getFileContent() {
		return fileContent;
	}
	public void setFileContent(String fileContent) {
		this.fileContent = fileContent;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getNextPage() {
		return nextPage;
	}
	public void setNextPage(String nextPage) {
		this.nextPage = nextPage;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String open() throws UnsupportedEncodingException, IOException{
		//System.out.println("id="+id);
		String nowPath = new String(new BASE64Decoder().decodeBuffer(URLDecoder.decode(path, "utf-8")));
		//System.out.println("path="+path);
		File file = new File(nowPath);
		if (!file.exists()) {
			return "error";
		}
		BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(file), "utf-8"));
		String line = null;
		StringBuffer sb = new StringBuffer();
		while ((line = br.readLine()) != null) {
			sb.append(line).append("\r");
		}
		br.close();
		ActionContext.getContext().put("str", sb.toString());
		ActionContext.getContext().put("path", path);
		ActionContext.getContext().put("fileName", file.getName());
		//text = text.replaceAll("<", "&lt");		
		//System.out.println(text);
		setNextPage("admin/editSource.jsp");
		return SUCCESS;
	}
	
	public String save(){
		this.clearMessages();
		if(path==null){
			this.addActionMessage("路径不存在");
			return ERROR;
		}
		String str=fileContent.trim();
		try {
			path = new String(new BASE64Decoder().decodeBuffer(URLDecoder.decode(path, "utf-8")));
			File file = new File(path);
			if (!file.exists()) {
				this.addActionMessage("文件不存在");
				return ERROR;
			}
			file.delete(); // 存在删除文件
			OutputStreamWriter outputStreamWriter = new OutputStreamWriter(new FileOutputStream(file), "utf-8");
			outputStreamWriter.write(str);
			outputStreamWriter.flush();
			outputStreamWriter.close();
		} catch (Exception e) {
			this.addActionMessage("系统出错了");
			e.printStackTrace();
			return ERROR;
		}
		this.addActionMessage("保存成功");
		return ERROR;
	}
	public String dirJson(){
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpServletResponse  response=ServletActionContext.getResponse();
		try {
			PrintWriter out=response.getWriter();
			out.print(dirJsonMethod(request, response));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	public String asyJson(){
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpServletResponse  response=ServletActionContext.getResponse();
		try {
			PrintWriter out=response.getWriter();
			out.print(asyJsonMethod(id, request, response));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public synchronized String dirJsonMethod(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		String path = request.getSession().getServletContext().getRealPath("/");
		//System.out.println("RealPath:" + path);
		if (sb.length() > 0)
			sb.delete(0, sb.length());// 清除缓存
		String commonPathJson = this.getJsonData(new File(path)); // 项目路径Json
		commonPathJson = "[" + commonPathJson + "]";
		//System.out.println("dirJson:" + commonPathJson);
		return commonPathJson;
	}
	public synchronized String asyJsonMethod(String id, HttpServletRequest request, HttpServletResponse response) throws IOException {
		String asyJson = null;
		String path = null;

		if (null == id) {
			path = request.getSession().getServletContext().getRealPath("/");
		} else {
			path = new String(new BASE64Decoder().decodeBuffer(URLDecoder.decode(id, "utf-8")));
		}
		System.out.println("id:" + id + "|asyJsonPath:" + path);
		if (sb.length() > 0)
			sb.delete(0, sb.length());// 清除缓存
		asyJson = "[" + this.getAsyJsonData(new File(path)) + "]";
		System.out.println(asyJson);
		return asyJson;
	}
	
	private synchronized String getJsonData(File file) throws UnsupportedEncodingException {
		if (!file.exists()) {
			return null;
		}
		boolean isFile = file.isFile();
		boolean isDir = file.isDirectory();
		String type = "file";
		if (isDir)
			type = "folder";

		String fileName = file.getName();
		String filePath = file.getPath();
		String md5Str =MethodUtil.getMD5(filePath, null, 1);
		String base64Encoder = URLEncoder.encode(new BASE64Encoder().encode(filePath.getBytes()), "UTF-8");
		String url = "/uushop/openSource.do"; // 路径
		// System.out.println(base64Encoder);
		sb.append("{"); // ,\"attributes\":{\"url\":\"/admin/tree/openFile.html\",\"target\":\"mainFrame\"
		sb.append("\"id\":\"" + md5Str + "\",\"text\":\"" + fileName + "\"");
		sb.append(",\"attributes\":{\"text\":\"" + fileName + "\",\"url\":\"" + url + "\",\"type\":\"" + type + "\",\"path\":\"" + base64Encoder + "\"}");
		if (isDir) {
			File fileList[] = file.listFiles(new FileFilter() {
				public boolean accept(File pathname) {
					String fileNameLower = pathname.getName().toLowerCase();
					if (pathname.isHidden())
						return false;
					/*********** 隐藏文件过滤 ***********/
					//if (fileNameLower.matches(".*(meta-inf|templates)$|.*.(gif|jpg|png|ico|class|.jar)$")) {
					if (fileNameLower.matches(".*(meta-inf|templates)$|.*.(gif|jpg|png|ico|db|class|.jar|.zip|.gz|.sql|.exe|.bt|.sh)$")) {
						return false;
					}
					return true;
				}
			});
			// sb.append(",\"attributes\":{\"id\":\""+md5Str+"\",\"path\":\""+base64Encoder+"\"}");
			if (fileList.length > 0) {
				sb.append(",\"state\":\"closed\",\"children\":[");
				//对filelist进行排序，文件夹在前
				for (int i = 0; i < fileList.length; i++){
					File now=fileList[i];
					for(int j=i+1;j<fileList.length;j++){
						if(now.isFile()&&fileList[j].isDirectory()){
							fileList[i]=fileList[j];
							fileList[j]=now;
							break;
						}
					}
				}
				for (int i = 0; i < fileList.length; i++) {
					if (i > 0)
						sb.append(",");
					this.getJsonData(fileList[i]);
				}
				sb.append("]");
			}
		}
		// target="mainFrame"
		if (isFile) {
//			 sb.append(",\"state\":\"closed\""); //\"target\":\"mainFrame\",
//			 sb.append(",\"attributes\":{\"id\":\""+md5Str+"\",\"path\":\""+base64Encoder+"\"}");
		}
		sb.append("}");
		return sb.toString();
	}
	
	private synchronized String getAsyJsonData(File file) throws UnsupportedEncodingException {
		if (!file.exists()) {
			return null;
		}
		File fileList[] = file.listFiles(new FileFilter() {
			public boolean accept(File pathname) {
				String fileNameLower = pathname.getName().toLowerCase();
				if (pathname.isHidden())
					return false;
				/*********** 隐藏文件过滤 ***********/
				if (fileNameLower.matches(".*(meta-inf|templates)$|.*.(gif|jpg|png|ico|class|db|.jar|.zip|.gz|.sql|.exe|.bt|.sh)$")) {
					return false;
				}
				return true;
			}
		});
		for (int i = 0; i < fileList.length; i++) {
			file = fileList[i];
			boolean isDir = file.isDirectory();
			String type = "file";
			String state = "open";
			if (isDir) {
				type = "folder";
				state = "closed";
			}
			String fileName = file.getName();
			String filePath = file.getPath();
			// String md5Str = utils.getMD5UTF8(filePath);
			String base64Encoder = URLEncoder.encode(new BASE64Encoder().encode(filePath.getBytes()), "UTF-8");
			String url = "/uushop/openSource.do"; // 路径
			// System.out.println(base64Encoder);
			sb.append("{"); // ,\"attributes\":{\"url\":\"/admin/tree/openFile.html\",\"target\":\"mainFrame\"
			sb.append("\"id\":\"" + base64Encoder + "\",\"text\":\"" + fileName + "\",\"state\":\"" + state + "\"");
			sb.append(",\"attributes\":{\"text\":\"" + fileName + "\",\"url\":\"" + url + "\",\"type\":\"" + type + "\",\"path\":\"" + base64Encoder + "\"}");
			sb.append("},");
		}
		if (fileList.length > 0) {
			sb.delete(sb.length() - 1, sb.length());
		} else {
			sb.append("");
		}
		return sb.toString();
	}

}
