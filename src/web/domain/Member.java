package web.domain;

public class Member {
	private String email;
	private String name;
	private String pwd;
	private String post;
	private String address;
	private String phone;
	private int point;
	
	public Member() {}

	public Member(String email, String name, String pwd, String post, String address, String phone, int point) {
		this.email = email;
		this.name = name;
		this.pwd = pwd;
		this.post = post;
		this.address = address;
		this.phone = phone;
		this.point = point;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}
}
