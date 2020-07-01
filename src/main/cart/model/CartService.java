package main.cart.model;

import java.util.ArrayList;

import main.vo.Pagination;
import web.domain.Cart;

public class CartService {
	private CartDAO dao;
	private static final CartService CART_INSTANCE = new CartService();
	
	private CartService() {
		dao = new CartDAO();
	}
	
	public static CartService getInstance() {
		return CART_INSTANCE;
	}
	
	public Pagination getPagination(int currentPage, int pageSize, String userEmail) {
		ArrayList<Cart> listResult = dao.getCartList(userEmail);
		long listCount = dao.getListCount(userEmail);
		return new Pagination(listCount, currentPage, pageSize, listResult);
	}
	
	public boolean deleteCart(String userEmail,  int cartCode, String type) {
		return dao.deleteCart(userEmail, cartCode, type); 
	}
}
