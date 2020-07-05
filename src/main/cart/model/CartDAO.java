package main.cart.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import web.domain.Cart;

public class CartDAO {
	private DataSource ds;

	CartDAO(){
		try {
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("jdbc/myoracle");
		}catch(NamingException ne) {
			System.out.println("cannot find Apache DBCP object(jdbc/myoracle) : "+ne);
		}
	}
	
	ArrayList<Cart> getCartList(String userEmail, int currentPage, int pageSize) {
		ArrayList<Cart> listResult = new ArrayList<Cart>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(CartSQL.SELECT_CART_PAGE);
			pstmt.setString(1, userEmail);
			pstmt.setInt(2, (currentPage-1)*pageSize);
			pstmt.setInt(3, currentPage*pageSize);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int cartCode = rs.getInt("CART_CODE");
				String email = rs.getString("EMAIL");
				int productCode = rs.getInt("PRODUCT_CODE");
				int quantity = rs.getInt("QUANTITY");
				String name = rs.getString("NAME");
				long price = rs.getLong("PRICE");
				
				listResult.add(new Cart(cartCode, email, productCode, quantity, name, price, (quantity*price)));
			}
			return listResult;
		} catch(SQLException se) {
			System.out.println("CartDAO Err-9 : "+se);
			return null;
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(SQLException se) {
				System.out.println("CartDAO Err-10 : "+se);
			}
		}
	}
	
	ArrayList<Cart> getCartList(String userEmail) {
		ArrayList<Cart> listResult = new ArrayList<Cart>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(CartSQL.SELECT_ALL_CART);
			pstmt.setString(1, userEmail);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int cartCode = rs.getInt("CART_CODE");
				String email = rs.getString("EMAIL");
				int productCode = rs.getInt("PRODUCT_CODE");
				int quantity = rs.getInt("QUANTITY");
				String name = rs.getString("NAME");
				long price = rs.getLong("PRICE");
				
				listResult.add(new Cart(cartCode, email, productCode, quantity, name, price, (quantity*price)));
			}
			return listResult;
		} catch(SQLException se) {
			System.out.println("CartDAO Err-1 : "+se);
			return null;
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(SQLException se) {
				System.out.println("CartDAO Err-2 : "+se);
			}
		}
	}
	
	long getListCount(String userEmail) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(CartSQL.SELECT_COUNT_ALL);
			pstmt.setString(1, userEmail);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				long listCount = rs.getLong(1);
				return listCount;
			}
			return -1;
		} catch(SQLException se) {
			System.out.println("CartDAO Err-3 : "+se);
			return -1;
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(SQLException se) {
				System.out.println("CartDAO Err-4 : "+se);
			}
		}
	}
	
	boolean deleteCart(String userEmail, int cartCode, String type) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = ds.getConnection();
			if(type.equals("one")) {
				pstmt = conn.prepareStatement(CartSQL.DELETE_MY_CART);
				pstmt.setString(1, userEmail);
				pstmt.setInt(2, cartCode);
			} else if(type.equals("all")) {
				pstmt = conn.prepareStatement(CartSQL.DELETE_ALL_MY_CART);			
				pstmt.setString(1, userEmail);
			}
			int i = pstmt.executeUpdate();
			if(i>0) {
				return true;
			} else {
				return false;
			}
		} catch(SQLException se) {
			System.out.println("CartDAO Err-5 : "+se);
			return false;
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(SQLException se) {
				System.out.println("CartDAO Err-6 : "+se);
			}			
		}
	}
	
	boolean insertCart(String userEmail, int productCode, int quantity) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(CartSQL.INSERT_PRODUCT_TO_CART);
			pstmt.setString(1, userEmail);
			pstmt.setInt(2, productCode);
			pstmt.setInt(3, quantity);
			int i = pstmt.executeUpdate();
			if(i>0) {
				return true;
			} else {
				return false;
			}
		} catch(SQLException se) {
			System.out.println("CartDAO Err-7 : "+se);
			return false;
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(SQLException se) {
				System.out.println("CartDAO Err-8 : "+se);
			}			
		}
	}
}
