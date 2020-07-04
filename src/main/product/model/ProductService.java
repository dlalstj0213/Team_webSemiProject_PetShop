package main.product.model;

import java.util.ArrayList;

import main.vo.ListResult;
import web.domain.Product;

public class ProductService {
	private ProductDAO dao;
	private static final ProductService instance = new ProductService();
	private ProductService() {
		dao = new ProductDAO();
	}
	public static ProductService getInstance() {
		return instance;
	}
	public ArrayList<Product> listS(){
		return dao.list();
	}
	public ListResult pageS(int cp, int ps) {
		return dao.page(cp, ps);
	}
	public Product detailS(int product_code) {
		return dao.detail(product_code);
	}
}