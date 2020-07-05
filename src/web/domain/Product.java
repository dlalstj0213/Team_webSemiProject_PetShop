package web.domain;

public class Product {
	private int product_code;
	private String name;
	private int price;
	private int quantity; //재고량
	private String info;
	
	public Product() {
	}
	public Product(int product_code, String name, int price, int quantity, String info) {
		this.product_code = product_code;
		this.name = name;
		this.price = price;
		this.quantity = quantity;
		this.info = info;
	}
	
	public int getProduct_code() {
		return product_code;
	}
	public void setProduct_code(int product_code) {
		this.product_code = product_code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
}