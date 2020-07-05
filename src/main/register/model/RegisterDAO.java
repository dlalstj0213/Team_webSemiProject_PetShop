package main.register.model;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import web.domain.Member;

public class RegisterDAO {
	
private DataSource ds;
	
	RegisterDAO(){
		try {
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("jdbc/myoracle");
		}catch(NamingException ne) {
			System.out.println("cannot find Apache DBCP object(jdbc/myoracle) : "+ne);
		}
	}
	
	int getMember(Member member) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			con=ds.getConnection();
			pstmt=con.prepareStatement(RegisterSQL.INSERT_NEW_MEMBER);
			pstmt.setString(1, member.getEmail());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getPwd());
			pstmt.setInt(4, member.getPost());
			pstmt.setString(5, member.getAddress());
			pstmt.setString(6, member.getPhone());
			
			int i = pstmt.executeUpdate();
			if(i>0)return 3;
			else return 2;
			
		}catch(SQLIntegrityConstraintViolationException e) {
			e.printStackTrace();
			return 1;
		}catch(SQLException se) {
			se.printStackTrace();
			return 2;
		}catch(Exception se) {
			se.printStackTrace();
			return 2;
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null)con.close();
			}catch(SQLException se) {
				se.printStackTrace();
			}
		}		
	}
		
}

