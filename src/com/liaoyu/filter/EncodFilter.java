package com.liaoyu.filter;
import java.io.IOException;
import java.util.Properties;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.velocity.app.Velocity;

public class EncodFilter implements Filter {
       private FilterConfig filterConfig;
       private String encoding=null;
	@Override
	public void destroy() {
		encoding=null;
	}
	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		HttpServletRequest request=(HttpServletRequest) arg0;
		HttpServletResponse response=(HttpServletResponse) arg1;
		this.encoding=this.filterConfig.getInitParameter("encoding");
		request.setCharacterEncoding(encoding);
		response.setCharacterEncoding(encoding);
		response.setContentType("text/html;charset=UTF-8");
		arg2.doFilter(arg0, arg1);
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		this.filterConfig=filterConfig;
		try {
			Properties prop = new Properties();
			prop.put(Velocity.RUNTIME_LOG, filterConfig.getServletContext().getRealPath("/log/velocity.log"));
			prop.put(Velocity.FILE_RESOURCE_LOADER_PATH, filterConfig.getServletContext().getRealPath("/vm"));
			System.out.println(filterConfig.getServletContext().getRealPath("/vm"));
			prop.setProperty(Velocity.INPUT_ENCODING, "UTF-8");
			prop.setProperty(Velocity.OUTPUT_ENCODING, "UTF-8"); 
			Velocity.init(prop);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}