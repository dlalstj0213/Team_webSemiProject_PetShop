package web.domain;

public class DeliverCom {
	private int compBizno;
	private String name;
	private String phone;
	private String post;
	private String address;
	private String bankCode;
	private String accountNo;
	private String bankName;
	
	public DeliverCom() {}
	
	public DeliverCom(int compBizno, String name, String phone, String post, String address, String bankCode,
			String accountNo, String bankName) {
		this.compBizno = compBizno;
		this.name = name;
		this.phone = phone;
		this.post = post;
		this.address = address;
		this.bankCode = bankCode;
		this.accountNo = accountNo;
		this.bankName = bankName;
	}

	public int getCompBizno() {
		return compBizno;
	}

	public void setCompBizno(int compBizno) {
		this.compBizno = compBizno;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getBankCode() {
		return bankCode;
	}

	public void setBankCode(String bankCode) {
		this.bankCode = bankCode;
	}

	public String getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
}
