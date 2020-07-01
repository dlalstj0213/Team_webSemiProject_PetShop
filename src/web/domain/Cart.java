package web.domain;

public class Cart {
	private int cartCode;
	private String email;
	private int productCode;
	
	private String name;
	private long price;
	private int quantity;
	
	public Cart() {}
	
	public Cart(int cartCode, String email, int productCode) {
		this.cartCode = cartCode;
		this.email = email;
		this.productCode = productCode;
	}
	
	public Cart(int cartCode, String email, int productCode, String name, long price, int quantity) {
		this.cartCode = cartCode;
		this.email = email;
		this.productCode = productCode;
		this.name = name;
		this.price = price;
		this.quantity = quantity;
	}

	public int getCartCode() {
		return cartCode;
	}

	public void setCartCode(int cartCode) {
		this.cartCode = cartCode;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public void setPrice(long price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
}
