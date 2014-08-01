package com.liaoyu.service.user.impl;

import javax.persistence.Query;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.liaoyu.bean.Notice;
import com.liaoyu.service.DaoSupport;
import com.liaoyu.service.user.NoticeService;

@Service
public class NoticeServiceBean extends DaoSupport<Notice> implements NoticeService {

	@Override
	@Transactional(readOnly=true,propagation=Propagation.NOT_SUPPORTED)
	public String getNoticeContent() {
		Query query=em.createNativeQuery("select n_content from notice where nid=(select max(nid) from notice)");
		return query.getSingleResult().toString();
	}

}
