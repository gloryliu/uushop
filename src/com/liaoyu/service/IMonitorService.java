package com.liaoyu.service;

import com.liaoyu.bean.HostInfo;
import com.liaoyu.bean.MonitorInfoBean;

public interface IMonitorService {
	 /**
     * 获得当前的监控对象.
     * @return 返回构造好的监控对象
     * @throws Exception
     */
    public MonitorInfoBean getMonitorInfoBean() throws Exception;
    /**
     * 获取当前进程的PID
     * @return
     */
    int getPid();
    /**
     * 获取进程ID和主机名
     * @return   "pid@hostname"
     */
     String getPidHostName();

    /**
     * 获取jvm使用的内存
     * @return
     */
     long getUsedMemoryMB();


    /**
     * 获取jvm可用内存
     * @return
     */
     long getFreeMemoryMB();
     
     /*获取服务器信息*/
     public HostInfo getHostInfo();
}
