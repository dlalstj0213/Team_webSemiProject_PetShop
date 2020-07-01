package web.domain;

public class Product {
	private int productCode;
	private String name;
	private long price;
	private int quantity;
	
	public Product() {}
	
	public Product(int productCode, String name, long price, int quantity) {
		this.productCode = productCode;
		this.name = name;
		this.price = price;
		this.quantity = quantity;
	}

	public int getProductCode() {
		return productCode;
	}

	public void setProductCode(int productCode) {
		this.productCode = productCode;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public long getPrice() {
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
}
