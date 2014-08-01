package com.liaoyu.service.user;

import com.liaoyu.bean.user.User;
import com.liaoyu.service.Dao;

public interface UserService extends Dao<User>{
	//判断实体是否已经实在
	public abstract boolean exists(String name);
	//根据用户名获取用户信息
	public abstract User getUserInfo(String name);
	//普通用户登录
	public abstract boolean UserLogin(String username,String password);
	//管理员登录
	public abstract boolean adminLogin(String username,String password);
}
