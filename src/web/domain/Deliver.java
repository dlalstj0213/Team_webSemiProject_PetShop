package web.domain;

import java.sql.Date;

public class Deliver {
	private int deliverNo;
	private int compBizno;
	private int price;
	private Date deliverDate;
	
	public Deliver() {}
	
	public Deliver(int deliverNo, int compBizno, int price, Date deliverDate) {
		this.deliverNo = deliverNo;
		this.compBizno = compBizno;
		this.price = price;
		this.deliverDate = deliverDate;
	}

	public int getDeliverNo() {
		return deliverNo;
	}

	public void setDeliverNo(int deliverNo) {
		this.deliverNo = deliverNo;
	}

	public int getCompBizno() {
		return compBizno;
	}

	public void setCompBizno(int compBizno) {
		this.compBizno = compBizno;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Date getDeliverDate() {
		return deliverDate;
	}

	public void setDeliverDate(Date deliverDate) {
		this.deliverDate = deliverDate;
	}
}
