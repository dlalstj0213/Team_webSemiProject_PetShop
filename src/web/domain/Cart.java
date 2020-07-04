package web.domain;

public class Cart {
	private int cartCode;
	private String email;
	private int productCode;
	private int quantity;
	
	private String name;
	private long price;
	private long totalPrice;
	
	public Cart() {}
	
	public Cart(int cartCode, String email, int productCode) {
		this.cartCode = cartCode;
		this.email = email;
		this.productCode = productCode;
	}

	public Cart(int cartCode, String email, int productCode, int quantity, String name, long price, long totalPrice) {
		super();
		this.cartCode = cartCode;
		this.email = email;
		this.productCode = productCode;
		this.quantity = quantity;
		this.name = name;
		this.price = price;
		this.totalPrice = totalPrice;
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
	public long getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(long totalPrice) {
		this.totalPrice = totalPrice;
	}
}
