package com.liaoyu.web;

import java.io.ByteArrayInputStream;
import java.io.Serializable;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.springframework.stereotype.Controller;

import com.liaoyu.utils.SecurityCode;
import com.liaoyu.utils.SecurityImage;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 提供图片验证码
 * @version 1.0 2012/08/22
 * @author dongliyang
 */
@SuppressWarnings("serial")
@Controller
public class ValcodeAction extends ActionSupport implements SessionAware,Serializable{
    
    //Struts2中Map类型的session
    private Map<String, Object> session;
    private String timestamp;
    //图片流
    private ByteArrayInputStream imageStream;

    public String getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(String timestamp) {
		this.timestamp = timestamp;
	}

	public ByteArrayInputStream getImageStream() {
        return imageStream;
    }

    public void setImageStream(ByteArrayInputStream imageStream) {
        this.imageStream = imageStream;
    }

    
    public String execute() throws Exception {
        //如果开启Hard模式，可以不区分大小写
//        String securityCode = SecurityCode.getSecurityCode(4,SecurityCodeLevel.Hard, false).toLowerCase();
        
        //获取默认难度和长度的验证码
        String securityCode = SecurityCode.getSecurityCode();
        imageStream = SecurityImage.getImageAsInputStream(securityCode);
        //放入session中
        session.put("valcode", securityCode);
        return "success";
    }

    public void setSession(Map<String, Object> session) {
        this.session = session;
    }

}