package main.cart.model;

public interface CartSQL {
	String SELECT_CART_PAGE = "select * from (select ROWNUM rnum, aa.* from "
			+ "(select c.CART_CODE, c.EMAIL, c.PRODUCT_CODE, c.QUANTITY, p.NAME, p.PRICE from CART c join PRODUCT p on c.PRODUCT_CODE=p.PRODUCT_CODE where EMAIL=? order by CART_CODE desc) aa)"
			+ " where rnum>? and rnum<=?";
	String SELECT_ALL_CART = "select c.CART_CODE, c.EMAIL, c.PRODUCT_CODE, c.QUANTITY, p.NAME, p.PRICE from CART c join PRODUCT p on c.PRODUCT_CODE=p.PRODUCT_CODE where EMAIL=? order by CART_CODE desc";
	String SELECT_COUNT_ALL = "select count(*) from CART where EMAIL=?";
	String DELETE_MY_CART= "delete from CART where EMAIL=? and CART_CODE=?";
	String DELETE_ALL_MY_CART="delete from CART where EMAIL=?";
	String INSERT_PRODUCT_TO_CART= "insert into CART values(CART_SEQ.nextval, ?, ?)";
}
