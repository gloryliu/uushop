package com.liaoyu.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBHelper {
	//定义参数
	private final String driver = "com.mysql.jdbc.Driver";
	private final String url = "jdbc:mysql://localhost:3306/uushop";
	private final String uid = "root";
	private final String pwd = "111";
	
	//定义数据库连接对象
	private Connection con = null;
	
	//构造方法
	public DBHelper() {
		// 加载驱动，并获取连接
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url,uid,pwd);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}		
	}
	
	//执行查询的方法
	public ResultSet execQuery(String sql,String[] args){
		try {
			PreparedStatement pstm = con.prepareStatement(sql);  //获取执行对象，并预处理sql命令
			for(int i=0; i<args.length; i++)
				pstm.setString(i+1, args[i]);
			ResultSet rs = pstm.executeQuery();
			return rs;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//执行增删改的方法
	public int execOthers(String sql,String[] args){
		try {
			PreparedStatement pstm = con.prepareStatement(sql);  //获取执行对象，并预处理sql命令
			for(int i=0; i<args.length; i++)
				pstm.setString(i+1, args[i]);
			int rs = pstm.executeUpdate();
			return rs;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	//关闭资源方法
	public void closeAll(){
		try {
			if(con!=null && !con.isClosed()){
				con.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
