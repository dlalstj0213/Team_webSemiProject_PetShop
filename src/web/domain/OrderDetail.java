package web.domain;

import java.sql.Date;

public class OrderDetail {
	private int orderNo;
	private String email;
	private int deliverNo;
	private int productCode;
	private Date orderDate;
	private String address;
	private String phone;
	private String payCode;
	private int quantity;
	private long totalPrice;
	private int discount;
	private String memo;
	private String orderState;
	
	private long totalPay;
	
	public OrderDetail() {}
	
	public OrderDetail(int orderNo, String email, int deliverNo, int productCode, Date orderDate, String address,
			String phone, String payCode, int quantity, long totalPrice, int discount, String memo, String orderState) {
		this.orderNo = orderNo;
		this.email = email;
		this.deliverNo = deliverNo;
		this.productCode = productCode;
		this.orderDate = orderDate;
		this.address = address;
		this.phone = phone;
		this.payCode = payCode;
		this.quantity = quantity;
		this.totalPrice = totalPrice;
		this.discount = discount;
		this.memo = memo;
		this.orderState = orderState;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getDeliverNo() {
		return deliverNo;
	}

	public void setDeliverNo(int deliverNo) {
		this.deliverNo = deliverNo;
	}

	public int getProductCode() {
		return productCode;
	}

	public void setProductCode(int productCode) {
		this.productCode = productCode;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPayCode() {
		return payCode;
	}

	public void setPayCode(String payCode) {
		this.payCode = payCode;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public long getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(long totalPrice) {
		this.totalPrice = totalPrice;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getState() {
		return orderState;
	}

	public void setState(String orderState) {
		this.orderState = orderState;
	}

	public String getOrderState() {
		return orderState;
	}

	public void setOrderState(String orderState) {
		this.orderState = orderState;
	}

	public long getTotalPay() {
		return totalPay;
	}

	public void setTotalPay(long totalPay) {
		this.totalPay = totalPay;
	}
}
