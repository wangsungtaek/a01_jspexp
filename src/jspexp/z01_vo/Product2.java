package jspexp.z01_vo;

import java.util.Date;

public class Product2 {
	private int pno;
	private String pname;
	private int price;
	private int cnt;
	private Date regdate;
	private String regdate_s;
	private String mfg;
	private Date wrhsdate;
	private String wrhsdate_s;
	private String director;
	
	public Product2() {
	
	}
	public Product2(String pname, int price, int cnt, String regdate_s, String mfg, String wrhsdate_s, String director) {
		this.pname = pname;
		this.price = price;
		this.cnt = cnt;
		this.regdate_s = regdate_s;
		this.mfg = mfg;
		this.wrhsdate_s = wrhsdate_s;
		this.director = director;
	}

	public Product2(int pno, String pname, int price, int cnt, Date regdate, String mfg, Date wrhsdate, String director) {
	this.pno = pno;
	this.pname = pname;
	this.price = price;
	this.cnt = cnt;
	this.regdate = regdate;
	this.mfg = mfg;
	this.wrhsdate = wrhsdate;
	this.director = director;
}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getRegdate_s() {
		return regdate_s;
	}
	public void setRegdate_s(String regdate_s) {
		this.regdate_s = regdate_s;
	}
	public String getMfg() {
		return mfg;
	}
	public void setMfg(String mfg) {
		this.mfg = mfg;
	}
	public Date getWrhsdate() {
		return wrhsdate;
	}
	public void setWrhsdate(Date wrhsdate) {
		this.wrhsdate = wrhsdate;
	}
	public String getWrhsdate_s() {
		return wrhsdate_s;
	}
	public void setWrhsdate_s(String wrhsdate_s) {
		this.wrhsdate_s = wrhsdate_s;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
}
