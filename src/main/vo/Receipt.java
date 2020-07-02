package main.vo;

public class Receipt {
	private boolean isPayed = false;
	private long totalPay;
	
	public Receipt() {
	}
	public Receipt(boolean isPayed, long totalPay) {
		this.isPayed = isPayed;
		this.totalPay = totalPay;
	}
	public boolean isPayed() {
		return isPayed;
	}
	public void setPayed(boolean isPayed) {
		this.isPayed = isPayed;
	}
	public long getTotalPay() {
		return totalPay;
	}
	public void setTotalPay(long totalPay) {
		this.totalPay = totalPay;
	}
}
