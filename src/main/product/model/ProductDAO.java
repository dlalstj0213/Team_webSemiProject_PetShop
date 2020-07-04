package main.product.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import main.vo.ListResult;
import main.vo.Pagination;
import web.domain.Product;



class ProductDAO {
	private DataSource ds;
	ProductDAO(){
		try {
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("jdbc/myoracle");
			//Connection conn = ds.getConnection();
		}catch(NamingException ne) {
			System.out.println("Apache DBCP 객체(jdbc/myoracle)를 찾지 못함");
		}
	}
	
	ArrayList<Product> list(){
		ArrayList<Product> list = new ArrayList<Product>();
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = ProductSQL.LIST;
		try{
			con = ds.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				int product_code = rs.getInt(1);
				String name = rs.getString(2);
				int price = rs.getInt(3);
				int quantity = rs.getInt(4);
				String info = rs.getString(5);
				list.add(new Product(product_code, name, price, quantity, info));
			}
			return list;
		}catch(SQLException se){
			System.out.println("ArrayList<Product> list: "+se);
			return null;
		}finally{
			try{
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(con != null)  con.close();
			}catch(SQLException se){}
		}
	}
	
	ListResult page(int cp, int ps) {
		ArrayList<Product> list = new ArrayList<Product>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = ProductSQL.PAGE;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, 0);
			pstmt.setInt(2, cp*ps);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				int product_code = rs.getInt("PRODUCT_CODE");
				String name = rs.getString("NAME");
				int price = rs.getInt("PRICE");
				int quantity = rs.getInt("QuANTITY");
				String info = rs.getString("INFO");
				list.add(new Product(product_code, name, price, quantity, info));
			}
			return new ListResult(list, new Pagination(getTotalCount(), cp, ps));
		}catch(SQLException se) {
			System.out.println("ProductDAO Err : "+se);
			return null;
		}finally {
			try {
				if(rs != null) rs.close();
				if(con != null) con.close();
			}catch(SQLException se){}
		}
	}
	
	long getTotalCount() {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = ProductSQL.COUNT;
		try {
			con = ds.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				long count = rs.getLong(1);
				return count;
			}else {
				return -1L;
			}
		}catch(SQLException se) {
			return -1L;
		}finally {
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(con != null) con.close();
			}catch(SQLException se) {}
		}
	}
	
	Product detail(int product_code) {
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String sql = ProductSQL.DETAIL;
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, product_code);
			rs = pstmt.executeQuery();
			rs.next();
			
			product_code = rs.getInt("PRODUCT_CODE");
			String name = rs.getString("NAME");
			int price = rs.getInt("PRICE");
			int quantity = rs.getInt("QuANTITY");
			String info = rs.getString("INFO");
			return new Product(product_code, name, price, quantity, info);
		}catch(SQLException se){
			System.out.println("detail SQL:"+se);
			return null;
		}finally{
			try{
				if(rs != null) rs.close();
				if(con != null) con.close();
			}catch(SQLException se){}
		}
	}
}
