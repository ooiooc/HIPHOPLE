package com.project.dbTest;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class DBtest {

	private static final String driver = "com.mysql.jdbc.Driver";
	private static final String url = "jdbc:mysql://127.0.0.1:3306/hiphople?serverTimezone=Asia/Seoul";
	private static final String user = "jenny";
	private static final String pw = "1234";
	
	@Test
	public void jdbcTest() throws Exception{
		
		Class.forName(driver);
		try(Connection con = DriverManager.getConnection(url,user,pw)){
			System.out.println(con);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
	}
	
	
}
