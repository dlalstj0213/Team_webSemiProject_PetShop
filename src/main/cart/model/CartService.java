package main.cart.model;

import java.util.ArrayList;

import main.vo.ListResult;
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
	public long getSubTotal(String userEmail) {
		ArrayList<Cart> list = dao.getCartList(userEmail);
		long subTotal = 0;
		for(Cart cart : list) {
			subTotal += cart.getTotalPrice();
		}
		return subTotal;
	}
	
	public ListResult getAllCartList(String userEmail) {
		ArrayList<Cart> cartList = dao.getCartList(userEmail);
		long subTotal = getSubTotal(userEmail);
		return new ListResult(cartList, subTotal);
	}
	
	public ListResult getListResult(int currentPage, int pageSize, String userEmail) {
		ArrayList<Cart> list = dao.getCartList(userEmail, currentPage, pageSize);
		long subTotal = getSubTotal(userEmail);

		long listCount = dao.getListCount(userEmail);
		//테스트 출력문
//		Pagination page = new Pagination(listCount, currentPage, pageSize);
//		System.out.println("현재 페이지 : "+page.getCurrentPage());
//		System.out.println("이전 페이지 : "+page.getPrevPage());
//		System.out.println("다음 페이지 : "+page.getNextPage());
//		System.out.println("총 페이지 수 : "+page.getPageCount());
//		System.out.println("시작 페이지 : "+page.getStartPage());
//		System.out.println("끝 페이지 : "+page.getEndPage());
//		System.out.println("한 페이지 당 게시글 수 : "+page.getPageSize());
//		System.out.println("총 게시글 수 : "+page.getListCount());
//		System.out.println("현재 블럭 : "+page.getCurrentRange());
//		System.out.println("한 블럭 당 페이지 수 : "+page.getRangeSize());
//		System.out.println("총 블럭 수 : "+page.getRangeCount());
//		System.out.println("시작 index : "+page.getStartIndex());
		return new ListResult(list, subTotal, new Pagination(listCount, currentPage, pageSize));
	}
	
	public boolean deleteCart(String userEmail,  int cartCode, String type) {
		return dao.deleteCart(userEmail, cartCode, type); 
	}
	
	public boolean insertCart(String userEmail, int productCode, int quantity) {
		return dao.insertCart(userEmail, productCode, quantity);
	}
}
