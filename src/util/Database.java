package util;

import java.sql.*;

public class Database {
	public static Connection getConnection() {
		try{
			 
			String jdbcDriver = "jdbc:mysql://localhost:3306/foodinkor?serverTimezone=UTC"; // ?serverTimezone=UTC mysql 8踰꾩쟾 �씠�긽�씪 �븣 �벐�뒗 援щЦ
			String dbUser = "root";
			String dbPass = "dongyang";
			Class.forName("com.mysql.cj.jdbc.Driver");// 而ㅻ꽖�꽣濡쒕뵫 com.mysql.cj.jdbc.Driver�뒗 8 踰꾩쟾.�씠�븯 踰꾩쟾�뿉�꽌�뒗 cj瑜� 類�
			return DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
