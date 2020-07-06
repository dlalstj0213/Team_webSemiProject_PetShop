package main.order.model;

import java.util.ArrayList;

import main.vo.ListResult;
import main.vo.ResultSet;
import web.domain.Cart;
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
		ArrayList<Cart> result = new ArrayList<Cart>();
		ListResult responseData = new ListResult();
		long total = 0;
		for(Object obj : cart.getList()) {
			Cart temp = (Cart)obj;
			if(temp.getCartCode()==code) {
				total += temp.getTotalPrice();
				result.add(temp);
			}
		}
		responseData.setList(result);
		responseData.setSubTotal(total);
		return responseData;
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
		if(quantity1 >= product1 || product1 == 0) {
			checkCount++;
		}
		if(quantity2 >= product2 || product2 == 0) {
			checkCount++;
		}
		if(quantity3 >= product3 || product3 == 0) {
			checkCount++;
		}
		if(quantity4 >= product4 || product4 == 0) {
			checkCount++;
		}
		if(quantity5 >= product5 || product5 == 0) {
			checkCount++;
		}
		if(checkCount == 5) {
			return true;
		}
		return false;
	}


	public ListResult buyProductService(ListResult requestData, String address, String phone, String memo) {
		ArrayList<Cart> cartList = (ArrayList<Cart>)requestData.getList();
		ArrayList<OrderDetail> orderList = new ArrayList<OrderDetail>();
		ListResult responseData = new ListResult();
		int checkCount = 0;
		int totalQuantity = 0;
		long subTotal = 0;
		if(checkQuantity(requestData)) {
			for(Cart cart : cartList) {
				OrderDetail orderDetail = new OrderDetail();
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
							if(dao.updateProductQuantity(quantity - orderDetail.getQuantity(), orderDetail.getProductCode())) {
								subTotal+=orderDetail.getTotalPrice();
								orderList.add(orderDetail);
								checkCount++;
								totalQuantity += orderDetail.getQuantity();
							}
						}
					}
				}else {
					responseData.setResultType(ResultSet.QUANTITY_NOT_ENOUGH);
					return responseData;
				}
			}
		}
		if(cartList.size()==checkCount && orderList.size()==checkCount) {
			responseData.setTotalQuantity(totalQuantity);
			responseData.setList(orderList);
			responseData.setSubTotal(subTotal);
			responseData.setResultType(ResultSet.PAY_SUCCESS);
			return responseData;
		}
		responseData.setResultType(ResultSet.PAY_FAIL);
		return responseData;
	}

	public ArrayList<OrderDetail> getPaymentList(String userEmail) {
		return dao.getOrderDetail(userEmail, "payment-success");
	}
}
