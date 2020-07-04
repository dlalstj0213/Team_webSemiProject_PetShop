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
	
	private String productName;
	
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

	public OrderDetail setOrderNo(int orderNo) {
		this.orderNo = orderNo;
		return this;
	}

	public String getEmail() {
		return email;
	}

	public OrderDetail setEmail(String email) {
		this.email = email;
		return this;
	}

	public int getDeliverNo() {
		return deliverNo;
	}

	public OrderDetail setDeliverNo(int deliverNo) {
		this.deliverNo = deliverNo;
		return this;
	}

	public int getProductCode() {
		return productCode;
	}

	public OrderDetail setProductCode(int productCode) {
		this.productCode = productCode;
		return this;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public OrderDetail setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
		return this;
	}

	public String getAddress() {
		return address;
	}

	public OrderDetail setAddress(String address) {
		this.address = address;
		return this;
	}

	public String getPhone() {
		return phone;
	}

	public OrderDetail setPhone(String phone) {
		this.phone = phone;
		return this;
	}

	public String getPayCode() {
		return payCode;
	}

	public OrderDetail setPayCode(String payCode) {
		this.payCode = payCode;
		return this;
	}

	public int getQuantity() {
		return quantity;
	}

	public OrderDetail setQuantity(int quantity) {
		this.quantity = quantity;
		return this;
	}

	public long getTotalPrice() {
		return totalPrice;
	}

	public OrderDetail setTotalPrice(long totalPrice) {
		this.totalPrice = totalPrice;
		return this;
	}

	public int getDiscount() {
		return discount;
	}

	public OrderDetail setDiscount(int discount) {
		this.discount = discount;
		return this;
	}

	public String getMemo() {
		return memo;
	}

	public OrderDetail setMemo(String memo) {
		this.memo = memo;
		return this;
	}

	public String getState() {
		return orderState;
	}

	public OrderDetail setState(String orderState) {
		this.orderState = orderState;
		return this;
	}

	public String getOrderState() {
		return orderState;
	}

	public OrderDetail setOrderState(String orderState) {
		this.orderState = orderState;
		return this;
	}

	public String getProductName() {
		return productName;
	}

	public OrderDetail setProductName(String productName) {
		this.productName = productName;
		return this;
	}
}
