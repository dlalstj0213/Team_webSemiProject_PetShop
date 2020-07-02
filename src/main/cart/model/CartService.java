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
		Pagination page = new Pagination(listCount, currentPage, pageSize, listResult);
		System.out.println("현재 페이지 : "+page.getCurrentPage());
		System.out.println("이전 페이지 : "+page.getPrevPage());
		System.out.println("다음 페이지 : "+page.getNextPage());
		System.out.println("총 페이지 수 : "+page.getPageCount());
		System.out.println("시작 페이지 : "+page.getStartPage());
		System.out.println("끝 페이지 : "+page.getEndPage());
		System.out.println("한 페이지 당 게시글 수 : "+page.getPageSize());
		System.out.println("총 게시글 수 : "+page.getListCount());
		System.out.println("현재 블럭 : "+page.getCurrentRange());
		System.out.println("한 블럭 당 페이지 수 : "+page.getRangeSize());
		System.out.println("총 블럭 수 : "+page.getRangeCount());
		System.out.println("시작 index : "+page.getStartIndex());
		return new Pagination(listCount, currentPage, pageSize, listResult);
	}
	
	public boolean deleteCart(String userEmail,  int cartCode, String type) {
		return dao.deleteCart(userEmail, cartCode, type); 
	}
	
	public boolean insertCart(String userEmail, int productCode) {
		return dao.insertCart(userEmail, productCode);
	}
}
