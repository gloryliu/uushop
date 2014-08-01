package com.liaoyu.service.user.impl;

import javax.persistence.Query;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.liaoyu.bean.user.User;
import com.liaoyu.service.DaoSupport;
import com.liaoyu.service.user.UserService;

@Service 
public class UserServiceBean extends DaoSupport<User> implements UserService {
	private static final Log log = LogFactory.getLog(UserServiceBean.class);
	@Transactional(readOnly=true,propagation=Propagation.NOT_SUPPORTED)
	@Override
	public boolean exists(String name) {
		Long n=(Long) em.createQuery("select count(o) from User o where o.account=?1").setParameter(1, name).getSingleResult();
		return n>0?true:false;
	}
	@Transactional(readOnly=true,propagation=Propagation.NOT_SUPPORTED)
	@Override
	public boolean UserLogin(String username,String password) {
		Query query=em.createQuery("select count(o) from User o where account=?1 and password=?2 and status=0");
		query.setParameter(1, username);
		query.setParameter(2, password);
		long flag=(Long) query.getSingleResult();
		if(flag<1)log.error("用户名："+username+"  密码："+password+"登录失败");
		return flag>0;
	}
	@Transactional(readOnly=true,propagation=Propagation.NOT_SUPPORTED)
	@Override
	public User getUserInfo(String name) {
		User userInfo=null;
		userInfo=(User) em.createQuery("select o from User o where o.account=?1").setParameter(1, name).getSingleResult();
		return userInfo;
	}
	@Transactional(readOnly=true,propagation=Propagation.NOT_SUPPORTED)
	@Override
	public boolean adminLogin(String username, String password) {
		Query query=em.createQuery("select count(o) from User o where account=?1 and password=?2 and type='MANAGER'");
		query.setParameter(1, username);
		query.setParameter(2, password);
		long flag=(Long) query.getSingleResult();
		return flag>0;
	}

}
