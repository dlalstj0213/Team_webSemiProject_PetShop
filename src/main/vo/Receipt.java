package main.vo;

import java.util.List;

public class Receipt {
	private boolean flag = false;
	private List<?> resultList;
	private long subTotal;
	private long totalPay;
	private int resultType;
	
	public Receipt() {
	}
	
	public Receipt(boolean flag, long totalPay, int resultType) {
		this.flag = flag;
		this.totalPay = totalPay;
		this.resultType = resultType;
	}

	public boolean isFlag() {
		return flag;
	}

	public void setFlag(boolean flag) {
		this.flag = flag;
	}

	public long getTotalPay() {
		return totalPay;
	}

	public void setTotalPay(long totalPay) {
		this.totalPay = totalPay;
	}

	public int getResultType() {
		return resultType;
	}

	public void setResultType(int resultType) {
		this.resultType = resultType;
	}
	
}
