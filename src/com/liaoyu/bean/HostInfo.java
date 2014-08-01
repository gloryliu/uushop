package com.liaoyu.bean;

import java.io.Serializable;

public class HostInfo implements Serializable {
	private static final long serialVersionUID = 1L;
	/*操作系统位数*/
	private String systemPlatform;
	/*项目所在的路径*/
	private String realPath;
	/*项目名称*/
	private String appName;
	/*服务器地址*/
	private String hostPath;
	/*服务器端口*/
	private Integer hostPort;
	/*Java版本*/
	private String javaEdition;
	/*Java安装路径*/
	private String javaPath;
	/*用户的工作目录*/
	private String workPath;
	public String getSystemPlatform() {
		return systemPlatform;
	}
	public void setSystemPlatform(String systemPlatform) {
		this.systemPlatform = systemPlatform;
	}
	public String getRealPath() {
		return realPath;
	}
	public void setRealPath(String realPath) {
		this.realPath = realPath;
	}
	public String getAppName() {
		return appName;
	}
	public void setAppName(String appName) {
		this.appName = appName;
	}
	public String getHostPath() {
		return hostPath;
	}
	public void setHostPath(String hostPath) {
		this.hostPath = hostPath;
	}
	public Integer getHostPort() {
		return hostPort;
	}
	public void setHostPort(Integer i) {
		this.hostPort = i;
	}
	public String getJavaEdition() {
		return javaEdition;
	}
	public void setJavaEdition(String javaEdition) {
		this.javaEdition = javaEdition;
	}
	public String getJavaPath() {
		return javaPath;
	}
	public void setJavaPath(String javaPath) {
		this.javaPath = javaPath;
	}
	public String getWorkPath() {
		return workPath;
	}
	public void setWorkPath(String workPath) {
		this.workPath = workPath;
	}
}
