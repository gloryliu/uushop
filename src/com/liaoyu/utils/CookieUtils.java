package com.liaoyu.utils;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.liaoyu.bean.user.User;
import com.liaoyu.service.user.UserAutoLoginService;


/**
 * cookie的增加、删除、查询
 */
public class CookieUtils {
	public static final String USER_COOKIE = "custom_cookie";

	// 添加一个cookie
	public static  Cookie addCookie(String account,String password) {
		Cookie cookie = new Cookie(USER_COOKIE, account + "_"+ password);
		cookie.setMaxAge(60 * 60 * 24 *7 );// cookie保存1周60 * 60 * 24 *7
		cookie.setPath("/");
		return cookie;
	}

	// 得到cookie
	public static boolean getCookie(HttpServletRequest request) {
		UserAutoLoginService us=new UserAutoLoginService();
		Cookie[] cookies = request.getCookies();
		if (cookies!=null&&cookies.length>0) {
			for (Cookie cookie : cookies) {
				if (CookieUtils.USER_COOKIE.equals(cookie.getName())) {
					String value = cookie.getValue();
					if (value!=null&&!"".equals(value)) {
						String[] split = value.split("_");
						String username = split[0];
						String password = split[1];
						try {
							User user =us.getUserInfo(username,password);
							if (user != null) {
								HttpSession session = request.getSession();
								session.setAttribute("user", user);// 添加用户到session中
								return true;
							}
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
				}
			}
		}
		return false;
	}

	// 删除cookie
	public static void delCookie(HttpServletRequest request,HttpServletResponse response) {
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (USER_COOKIE.equals(cookie.getName())) {
					cookie.setValue("");
					cookie.setMaxAge(-10);
					cookie.setPath("/");
					response.addCookie(cookie);
				}
			}
		}
	}
}
