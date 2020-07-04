package main.vo;

import java.util.List;

public class ListResult {
	//리스트
	private List<?> list;
	//총금액
	private long subTotal;
	private Pagination page;
	private int resultType;
	private String userName;
	private int totalQuantity;
	
	public ListResult() {
	}
	
	public ListResult(List<?> list, Pagination page) {
		this.list = list;
		this.page = page;
	}

	public ListResult(List<?> list, long subTotal) {
		this.list = list;
		this.subTotal = subTotal;
	}

	public ListResult(List<?> list, long subTotal, Pagination page) {
		this.list = list;
		this.subTotal = subTotal;
		this.page = page;
	}

	public List<?> getList() {
		return list;
	}

	public void setList(List<?> list) {
		this.list = list;
	}

	public long getSubTotal() {
		return subTotal;
	}

	public void setSubTotal(long subTotal) {
		this.subTotal = subTotal;
	}

	public Pagination getPage() {
		return page;
	}

	public void setPage(Pagination page) {
		this.page = page;
	}

	public int getResultType() {
		return resultType;
	}

	public void setResultType(int resultType) {
		this.resultType = resultType;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getTotalQuantity() {
		return totalQuantity;
	}

	public void setTotalQuantity(int totalQuantity) {
		this.totalQuantity = totalQuantity;
	}
}
