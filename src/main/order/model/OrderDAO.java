package main.order.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import main.cart.model.CartSQL;
import web.domain.Cart;
import web.domain.Member;
import web.domain.OrderDetail;

public class OrderDAO {
	private DataSource ds;

	OrderDAO(){
		try {
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("jdbc/myoracle");
		}catch(NamingException ne) {
			System.out.println("cannot find Apache DBCP object(jdbc/myoracle) : "+ne);
		}
	}	

	/**
	 * OracleDB -> value of ORDER_STATE = 'A' = deliver progress
	 * OracleDB -> value of ORDER_STATE = 'B' = deliver finished
	 * OracleDB -> value of ORDER_STATE = 'C' = default state(payment-progress)
	 */
	boolean insertOrderDetail(OrderDetail orderDetail) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(OrderSQL.INSERT_ORDER);
			pstmt.setString(1, orderDetail.getEmail());
			pstmt.setInt(2, orderDetail.getProductCode());
			pstmt.setString(3, orderDetail.getAddress());
			pstmt.setString(4, orderDetail.getPhone());
			pstmt.setInt(5, orderDetail.getQuantity());
			pstmt.setLong(6, orderDetail.getTotalPrice());
			pstmt.setString(7, orderDetail.getMemo());
			int i = pstmt.executeUpdate();
			if(i>0) {
				return true;
			} else {
				return false;
			}
		} catch(SQLException se) {
			System.out.println("OrderDAO Err-1 : "+se);
			return false;
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(SQLException se) {
				System.out.println("OrderDAO Err-2 : "+se);
			}			
		}
	}

	long getTotalPay(String userEmail) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(OrderSQL.SELECT_SUM_TOTAL_PRICE);
			pstmt.setString(1, userEmail);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				long totalPrice = rs.getLong(1);
				return totalPrice;
			} else {
				return -1;
			}
		} catch(SQLException se) {
			System.out.println("OrderDAO Err-3 : "+se);
			return -1;
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(SQLException se) {
				System.out.println("OrderDAO Err-4 : "+se);
			}						
		}
	}

	boolean updateOrderState(OrderDetail orderDetail) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = ds.getConnection();
			System.out.println("NO : "+orderDetail.getOrderNo());
			pstmt = conn.prepareStatement(OrderSQL.UPDATE_ORDER_STATE);
			pstmt.setInt(1, orderDetail.getOrderNo());
			int i = pstmt.executeUpdate();
			if(i>0) {
				return true;
			} else {
				return false;
			}
		} catch(SQLException se) {
			System.out.println("OrderDAO Err-5 : "+se);
			return false;
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(SQLException se) {
				System.out.println("OrderDAO Err-6 : "+se);
			}					
		}
	}

	ArrayList<OrderDetail> getOrderDetail(String userEmail, String state) {
		ArrayList<OrderDetail> listResult = new ArrayList<OrderDetail>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			if(state.equals("payment-progress")) {
				pstmt =conn.prepareStatement(OrderSQL.SELECT_PAYMENT_PROGRESS);
			} else if(state.equals("payment-success")) {
				pstmt =conn.prepareStatement(OrderSQL.SELECT_PAYMENT_SUCCESS);
			}
			pstmt.setString(1, userEmail);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int orderNo = rs.getInt("ORDER_NO");
				String email = rs.getString("EMAIL");
				int deliverNo = rs.getInt("DELIVER_NO");
				int productCode = rs.getInt("PRODUCT_CODE");
				Date orderDate = rs.getDate("ORDER_DATE");
				String address = rs.getString("ADDRESS");
				String phone = rs.getString("PHONE");
				String payCode = rs.getString("PAYCODE");
				int quantity = rs.getInt("QUANTITY");
				long totalPrice = rs.getLong("TOTAL_PRICE");
				int discount = rs.getInt("DISCOUNT");
				String memo = rs.getString("MEMO");
				String orderState = rs.getString("ORDER_STATE");
				listResult.add(new OrderDetail(orderNo, email, deliverNo, productCode, orderDate, address, phone, payCode, quantity, totalPrice, discount, memo, orderState));
			}
			return listResult;
		} catch(SQLException se) {
			System.out.println("OrderDAO Err-7 : "+se);
			return null;
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(SQLException se) {
				System.out.println("OrderDAO Err-8 : "+se);
			}					
		}
	}

	int getProductQuantity(int productCode) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(OrderSQL.SELECT_PRODUCT_QUANTITY);
			pstmt.setInt(1, productCode);
			rs = pstmt.executeQuery()	;
			if(rs.next()) {
				int quantity = rs.getInt("QUANTITY");
				return quantity;
			}
			return -1;
		} catch(SQLException se) {
			System.out.println("OrderDAO Err-15 : "+se);
			return -1;
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(SQLException se) {
				System.out.println("OrderDAO Err-16 : "+se);
			}
		}
	}

	boolean updateProductQuantity(int quantity, int productCode) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(OrderSQL.UPDATE_PRODUCT_QUANTITY);
			pstmt.setInt(1, quantity);
			pstmt.setInt(2, productCode);
			int i = pstmt.executeUpdate();
			if(i>0) {
				return true;
			} else {
				return false;
			}
		} catch(SQLException se) {
			System.out.println("OrderDAO Err-9 : "+se);
			return false;
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(SQLException se) {
				System.out.println("OrderDAO Err-10 : "+se);
			}					
		}		
	}

	ArrayList<OrderDetail> getAllMyCart(String userEmail, String address, String phone, int quantity) {
		ArrayList<OrderDetail> listResult = new ArrayList<OrderDetail>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			pstmt =conn.prepareStatement(CartSQL.SELECT_ALL_CART);
			pstmt.setString(1, userEmail);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int productCode = rs.getInt("PRODUCT_CODE");
				long price = rs.getLong("PRICE");
				listResult.add(new OrderDetail(-1, userEmail, 1, productCode, null, address, phone, null, quantity, price, 0, null, null));
			}
			return listResult;
		} catch(SQLException se) {
			System.out.println("OrderDAO Err-11 : "+se);
			return null;
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(SQLException se) {
				System.out.println("OrderDAO Err-12 : "+se);
			}					
		}		
	}

	Member getUserInfo(String userEmail) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			pstmt =conn.prepareStatement(OrderSQL.SELECT_MEMBER_USER);
			pstmt.setString(1, userEmail);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String name = rs.getString("NAME");
				int post = rs.getInt("POST");
				String phone = rs.getString("PHONE");
				String address = rs.getString("ADDRESS");
				int point= rs.getInt("POINT");
				return new Member(userEmail, name, null, post, address, phone, point);
			}
			return null;
		} catch(SQLException se) {
			System.out.println("OrderDAO Err-13 : "+se);
			return null;
		} finally {
			try {
				if(rs != null) rs.close(); 
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(SQLException se) {
				System.out.println("OrderDAO Err-14 : "+se);
			}					
		}
	}

	boolean deleteMyCart(Cart cart) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(CartSQL.DELETE_MY_CART);			
			pstmt.setString(1, cart.getEmail());
			pstmt.setInt(2, cart.getCartCode());
			int i = pstmt.executeUpdate();
			if(i>0) {
				return true;
			} else {
				return false;
			}
		} catch(SQLException se) {
			System.out.println("OrderDAO Err-17 : "+se);
			return false;
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(SQLException se) {
				System.out.println("OrderDAO Err-18 : "+se);
			}			
		}
	}
}
