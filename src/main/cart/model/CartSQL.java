package main.cart.model;

public interface CartSQL {
	String SELECT_MY_CART = "select c.CART_CODE, c.EMAIL, c.PRODUCT_CODE, p.NAME, p.PRICE, p.QUANTITY from CART c join PRODUCT p on c.PRODUCT_CODE=p.PRODUCT_CODE where EMAIL=? order by CART_CODE desc";
	String SELECT_COUNT_ALL = "select * from CART where EMAIL=?";
	String DELETE_MY_CART= "delete from CART where EMAIL=? and CART_CODE=?";
	String DELETE_ALL_MY_CART="delete from CART where EMAIL=?";
}
