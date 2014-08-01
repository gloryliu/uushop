package com.liaoyu.service.user;

import java.sql.ResultSet;

import com.liaoyu.bean.user.Type;
import com.liaoyu.bean.user.User;
import com.liaoyu.utils.DBHelper;

public class UserAutoLoginService {
	DBHelper helper=new DBHelper();
	public User getUserInfo(String account,String password) throws Exception{
		//通过用户名获取用户信息
		ResultSet rs=helper.execQuery("select * from user where account=? and password=?",new String[]{account,password} );
		User user=new User();
		if(rs.next()){
			user.setUid(rs.getInt(1));
			user.setAccount(rs.getString(2));
			user.setMessageCount(rs.getInt(3));
			user.setNickname(rs.getString(4));
			user.setPassword(rs.getString(5));
			user.setPhoto(rs.getString(6));
			user.setPointsCount(rs.getInt(7));
			user.setStatus(rs.getInt(8));
			user.setType(Type.valueOf(rs.getString(9)));
		}
		return user;
	}
}
