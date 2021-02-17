package jspexp.z01_vo;

public class Member2 {
	private String id;
	private String pw;
	private String name;
	private int point;
	private String auth;
	
	public Member2() {
	}

	public Member2(String id, String pw, String name, int point, String auth) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.point = point;
		this.auth = auth;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
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

	public String getAuth() {
		return auth;
	}

	public void setAuth(String auth) {
		this.auth = auth;
	}
	
}
