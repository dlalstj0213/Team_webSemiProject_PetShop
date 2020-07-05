package main.login.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import web.domain.Member;

public class LoginDAO {
	private DataSource ds;
	
	LoginDAO(){
		try {
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("jdbc/myoracle");
		}catch(NamingException ne) {
			System.out.println("cannot find Apache DBCP object(jdbc/myoracle) : "+ne);
		}
	}
	
	Member getMember(String email) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		String sql= LoginSQL.CONTENT;	
		try {
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				String email1 = rs.getString(1);
				String name = rs.getString(2);
				String pwd= rs.getString(3);
				int post= rs.getInt(4);
				String address=rs.getString(5);
				String phone=rs.getString(6);
				int point=rs.getInt(7);
				Member member = new Member(email1, name,  pwd, post,  address, phone, point);
				return member;
			}else {
				return null;
			}
		}catch(SQLException se) {
			se.printStackTrace();
		}catch(Exception se) {
			se.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null)con.close();
			}catch(SQLException se) {
				se.printStackTrace();
			}
		}		
		return null;
	}
		
}
