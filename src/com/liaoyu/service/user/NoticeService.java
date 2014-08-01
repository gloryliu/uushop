package com.liaoyu.service.user;

import com.liaoyu.bean.Notice;
import com.liaoyu.service.Dao;

public interface NoticeService extends Dao<Notice>{
	//获取最新的公告
	public String getNoticeContent();
}
