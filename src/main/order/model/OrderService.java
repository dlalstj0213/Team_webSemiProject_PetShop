package main.order.model;

import java.util.ArrayList;

import main.vo.Receipt;
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
	
	public OrderDetail getTotalPrice(OrderDetail orderDetail) {
		long totalPrice = ((long)orderDetail.getQuantity())*orderDetail.getTotalPrice(); 
		orderDetail.setTotalPrice(totalPrice);
		return orderDetail;
	}
	
	public Receipt buyProductService(OrderDetail orderDetail) {
		if(dao.insertOrderDetail(orderDetail)) {
			Receipt receipt = new Receipt(false, dao.getTotalPay(orderDetail.getEmail()));
			if(dao.updateOrderState(orderDetail)) {
				if(dao.updateProductQuantity(orderDetail)) {
					receipt.setPayed(true);
					return receipt;
				}
			}
		}
		return null;
	}

	public ArrayList<OrderDetail> getPayment(String userEmail) {
		return dao.getOrderDetail(userEmail);
	}
	
	public Receipt buyAllProductsService(String userEmail){
		Member user = dao.getUserInfo(userEmail);
		ArrayList<OrderDetail> list = dao.getAllMyCart(userEmail, user.getAddress(), user.getPhone());
		int count=0;
		for(OrderDetail orderDetail : list) {
			if(dao.insertOrderDetail(orderDetail)) count++;
		}
		Receipt receipt = new Receipt(false, dao.getTotalPay(userEmail));
		if(list.size() == count) {
			count = 0;
			for(OrderDetail orderDetail : list) {
				if(dao.updateOrderState(orderDetail)) {
					if(dao.updateProductQuantity(orderDetail)) {
						count++;
					}
				}
			}
		}
		if(list.size()==count) {
			receipt.setPayed(true);
			return receipt;
		}
		return null;
	}
}
