package main.board.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import web.domain.Board;

class BoardDAO {
	private DataSource ds;
	
	BoardDAO(){
		try {
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("jdbc/myoracle");
		}catch(NamingException ne) {
			System.out.println("Apache DBCP ��ü(jdbc/myoracle)�� ã�� ����");
		}
	}
	/*ArrayList<Board> list(int currentPage, int pageSize){
		ArrayList<Board> list = new ArrayList<Board>();
		System.out.println("1");
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = BoardSQL.LIST;
		try {
			con = ds.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				long seq = rs.getLong(1);
				String writer = rs.getString(2);
				String email = rs.getString(3);
				String subject = rs.getString(4);
	 			String content = rs.getString(5);
				Date rdate = rs.getDate(6);
				
				Board b = new Board(seq, writer, email, subject, content, rdate);
				list.add(b);
			}
			return list;
		}catch(SQLException se) {
			se.printStackTrace();
			return null;
		}finally {
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(con != null) con.close();
			}catch(SQLException se) {
				se.printStackTrace();
			}
		}
	}*/
	ArrayList<Board> listResult (int currentPage, int pageSize) {
		ArrayList<Board>list =new ArrayList<Board>();
		Connection con= null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql = BoardSQL.LIST_PAGE;
		int startRow =(currentPage -1)*pageSize; 
		int endRow= currentPage*pageSize;
		try {
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				long seq=rs.getLong("IDX");
				String writer= rs.getString("WRITER");
				String email= rs.getString("EMAIL");
				String title= rs.getString("TITLE");
				String content= rs.getString("CONTENT");
				Date writerdate=rs.getDate("WRITERDATE");
				Board b= new Board(seq, writer, email, title, content, writerdate, 0, null, null, 0);
				list.add(b);				
			}
			return list;
		}catch(SQLException se) {
			se.printStackTrace();
			return list;
		}finally {
			try {
				if(rs != null)rs.close();
				if(pstmt != null)pstmt.close();
				if(con != null) con.close();
			}catch(SQLException se) {
				se.printStackTrace();
			}
		}
	}
	
	long getTotalCount() {
		Connection con=null;
		Statement stmt=null;
		ResultSet rs= null;
		String sql= BoardSQL.COUNT;
		try {
			con=ds.getConnection();
			stmt=con.createStatement();
			rs=stmt.executeQuery(sql);
			if(rs.next()) {
				long count=rs.getLong(1);
				return count;
			}else {

				return -1L;
			}
		}catch(SQLException se) {
			se.printStackTrace();
			return -1L;
		}finally {
			try {
				if(rs != null)rs.close();
				if(stmt != null)stmt.close();
				if(con != null) rs.close();
			}catch(SQLException se) {
				se.printStackTrace();
			}
		}
	}
	
	boolean insert(Board board) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = BoardSQL.INSERT;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, board.getWriter());
			pstmt.setString(2, board.getEmail());
			pstmt.setString(3, board.getTitle());
			pstmt.setString(4, board.getContent());
			pstmt.setString(5, board.getFileName()); 
			pstmt.setString(6, board.getOfileName()); 
			pstmt.setLong(7, board.getFileSize()); 
			int i = pstmt.executeUpdate();
			if(i>0) return true;
			else return false;
		}catch(SQLException se) {
			se.printStackTrace();
			return false;
		}catch(Exception se) {
			se.printStackTrace();
			return false;
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException se) {
				se.printStackTrace();
			}
		}
	}
	Board getBoard(long seq) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = BoardSQL.CONTENT;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setLong(1, seq);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				//long seq = rs.getLong(1);
				String writer = rs.getString(2);
				String email = rs.getString(3);
				String subject = rs.getString(4);
				String content = rs.getString(5);
				Date rdate = rs.getDate(6);
				
				return new Board(seq, writer, email, subject, content, rdate, 0, null, null, 0);
			}else {
				return null;
			}
		}catch(SQLException se) {
			se.printStackTrace();
			return null;
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException se) {
				se.printStackTrace();
			}
		}
	}
	boolean update(Board board){
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = BoardSQL.UPDATE;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, board.getEmail());
			pstmt.setString(2, board.getTitle());
			pstmt.setString(3, board.getContent());
			pstmt.setLong(4, board.getIdx());
			int i = pstmt.executeUpdate();
			if(i>0) return true;
			else return false;
		}catch(SQLException se) {
			se.printStackTrace();
			return false;
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException se) {
				se.printStackTrace();
			}
		}
	}
	void del(long seq){
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = BoardSQL.DEL;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setLong(1, seq);
			pstmt.executeUpdate();
		}catch(SQLException se) {
			se.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException se) {
				se.printStackTrace();
			}
		}
	}
}
