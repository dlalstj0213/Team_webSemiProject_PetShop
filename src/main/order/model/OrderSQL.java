package main.order.model;

public interface OrderSQL {
	String INSERT_ORDER = "insert into ORDER_DETAIL values(ORDER_DETAIL_SEQ.nextval, ?, 1, ?, SYSDATE, ?, ?, '신용카드', ?, ?, 0, ?, 'C')";
	String UPDATE_ORDER_STATE = "update ORDER_DETAIL set ORDER_STATE='A' where ORDER_NO=? and ORDER_STATE = 'C'";
	String UPDATE_PRODUCT_QUANTITY= "update PRODUCT set QUANTITY=? where PRODUCT_CODE=?";
	String SELECT_SUM_TOTAL_PRICE = "select sum(TOTAL_PRICE) from ORDER_DETAIL where EMAIL=? and ORDER_STATE='C'";
	String SELECT_PAYMENT_SUCCESS = "select * from ORDER_DETAIL where EMAIL=? and ORDER_STATE != 'C' order by ORDER_DATE desc, ORDER_NO desc";
	String SELECT_MEMBER_USER = "select * from MEMBER where EMAIL=?";
	String SELECT_PRODUCT_QUANTITY="select * from PRODUCT where PRODUCT_CODE=?";
	String SELECT_PAYMENT_PROGRESS="select * from ORDER_DETAIL where EMAIL=? and ORDER_STATE = 'C' order by ORDER_DATE desc, ORDER_NO desc";
}
