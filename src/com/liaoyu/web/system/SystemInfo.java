package com.liaoyu.web.system;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;

import com.liaoyu.bean.HostInfo;
import com.liaoyu.bean.MonitorInfoBean;
import com.liaoyu.service.IMonitorService;
import com.opensymphony.xwork2.ActionContext;

@Controller
public class SystemInfo {
	@Resource IMonitorService iMonitorService;
	public String execute(){
		try {
			MonitorInfoBean infoBean=iMonitorService.getMonitorInfoBean();
			HostInfo hostInfo=iMonitorService.getHostInfo();
			HttpServletRequest request=ServletActionContext.getRequest();
			hostInfo.setRealPath(request.getServletContext().getRealPath("/"));
			hostInfo.setHostPath(request.getServerName());
			hostInfo.setHostPort(request.getServerPort());
			hostInfo.setAppName(request.getContextPath());
			ActionContext.getContext().put("infoBean", infoBean);
			ActionContext.getContext().put("hostInfo", hostInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}
}
