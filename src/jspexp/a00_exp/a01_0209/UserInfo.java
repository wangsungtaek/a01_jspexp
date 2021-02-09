package jspexp.a00_exp.a01_0209;

import java.util.Date;

public class UserInfo {
	private String u_id;
	private String u_pw;
	private String name;
	private int point;
	private String address;
	private Date regdate;
	private int authority;
	
	public UserInfo() {
	
	}
	
	public UserInfo(String u_id, String u_pw, String name, int point, String address, Date regdate, int authority) {
		this.u_id = u_id;
		this.u_pw = u_pw;
		this.name = name;
		this.point = point;
		this.address = address;
		this.regdate = regdate;
		this.authority = authority;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getU_pw() {
		return u_pw;
	}

	public void setU_pw(String u_pw) {
		this.u_pw = u_pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getAuthority() {
		return authority;
	}

	public void setAuthority(int authority) {
		this.authority = authority;
	}
}
