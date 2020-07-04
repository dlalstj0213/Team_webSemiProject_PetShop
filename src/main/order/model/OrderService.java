package main.order.model;

import java.util.ArrayList;

import main.cart.model.CartService;
import main.vo.ListResult;
import main.vo.Receipt;
import main.vo.ResultSet;
import web.domain.Cart;
import web.domain.Member;
import web.domain.OrderDetail;

public class OrderService {
	private OrderDAO dao;
	private static final OrderService ORDER_INSTANCE = new OrderService();

	private OrderService() {
		dao = new OrderDAO();
	}

	public static OrderService getInstance() {
		return ORDER_INSTANCE;
	}
	public ListResult getProductByCart(ListResult cart) {
		return null;
	}
	
	public ListResult getProductByCart(ListResult cart, int code) {
		ArrayList<Cart> cartList = (ArrayList<Cart>)cart.getList();
		ArrayList<Cart> result = new ArrayList<Cart>();
		long total = 0;
		for(Cart temp : cartList) {
			if(temp.getCartCode()==code) {
				total += temp.getTotalPrice();
				result.add(temp);
			}
		}
		cart.setSubTotal(total);
		cart.setList(result);
		return cart;
	}


	public OrderDetail getTotalPrice(OrderDetail orderDetail) {
		long totalPrice = ((long)orderDetail.getQuantity())*orderDetail.getTotalPrice(); 
		orderDetail.setTotalPrice(totalPrice);
		return orderDetail;
	}

	public boolean checkQuantity(ListResult requestData) {
		//각 제품의 재고를 가지고온다 , 각 주문상품의 재고를 가져와서 비교
		//예) 주문 상품1 = 수량:3 현재 재고 4
		//      주문 상품1 = 수량:2 현재 재고 4
		//      주문 상품2 = 수량:5 현재 재고 3
		ArrayList<Cart> cartList = (ArrayList<Cart>)requestData.getList();
		int product1 = 0;
		int product2 = 0;
		int product3 = 0;
		int product4 = 0;
		int product5 = 0;
		for(Cart cart : cartList) {
			if(cart.getProductCode()==1) {
				product1 += cart.getQuantity();
			}else if(cart.getProductCode()==2) {
				product2 += cart.getQuantity();
			}else if(cart.getProductCode()==3) {
				product3 += cart.getQuantity();
			}else if((cart.getProductCode()==4)) {
				product4 += cart.getQuantity();
			}else if(cart.getProductCode()==5) {
				product5 += cart.getQuantity();
			}
		}
		int quantity1 = 0;
		int quantity2 = 0;
		int quantity3 = 0;
		int quantity4 = 0;
		int quantity5 = 0;
		for(Cart cart : cartList) {
			if(cart.getProductCode()==1) {
				quantity1 = dao.getProductQuantity(cart.getProductCode());
			} else if(cart.getProductCode()==2) {
				quantity2 = dao.getProductQuantity(cart.getProductCode());
			} else if(cart.getProductCode()==3) {
				quantity3 = dao.getProductQuantity(cart.getProductCode());
			} else if(cart.getProductCode()==4) {
				quantity4 = dao.getProductQuantity(cart.getProductCode());
			} else if(cart.getProductCode()==5) {
				quantity5 = dao.getProductQuantity(cart.getProductCode());
			}
		}
		int checkCount=0;
		for(Cart cart : cartList) {
			if(quantity1 >= product1 && product1 != 0) {
				checkCount++;
			} else if(quantity2 >= product2 && product2 != 0) {
				checkCount++;
			} else if(quantity3 >= product3 && product3 != 0) {
				checkCount++;
			} else if(quantity4 >= product4 && product4 != 0) {
				checkCount++;
			} else if(quantity5 >= product5 && product5 != 0) {
				checkCount++;
			}
		}
		if(cartList.size() == checkCount) {
			return true;
		}
		return false;
	}


	public ListResult buyProductService(ListResult requestData, String address, String phone, String memo) {
		ArrayList<Cart> cartList = (ArrayList<Cart>)requestData.getList();
		ArrayList<OrderDetail> orderList = new ArrayList<OrderDetail>();
		ListResult responseData = new ListResult();
		OrderDetail orderDetail = new OrderDetail();
		int checkCount = 0;
		int totalQuantity = 0;
		long subTotal = 0;
		if(checkQuantity(requestData)) {
			for(Cart cart : cartList) {
				int quantity = dao.getProductQuantity(cart.getProductCode());
				if(quantity>0 && quantity >= cart.getQuantity()) {
					orderDetail.setEmail(cart.getEmail())
					.setProductCode(cart.getProductCode())
					.setAddress(address)
					.setPhone(phone)
					.setQuantity(cart.getQuantity())
					.setTotalPrice(cart.getTotalPrice())
					.setMemo(memo)
					.setProductName(cart.getName());
					if(dao.insertOrderDetail(orderDetail)) {
						if(dao.deleteMyCart(cart)) {
							subTotal+=orderDetail.getTotalPrice();
							orderList.add(orderDetail);
							checkCount++;
							totalQuantity += orderDetail.getQuantity();
						}
					}
				}else {
					responseData.setResultType(ResultSet.QUANTITY_NOT_ENOUGH);
					break;
				}
			}
		}
		if(orderList.size()==checkCount) {
			responseData.setTotalQuantity(totalQuantity);
			responseData.setList(orderList);
			responseData.setSubTotal(subTotal);
			responseData.setResultType(ResultSet.PAY_SUCCESS);
			return responseData;
		}
		return null;
	}

	public ArrayList<OrderDetail> getPaymentList(String userEmail) {
		return dao.getOrderDetail(userEmail, "payment-success");
	}
}
