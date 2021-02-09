package jspexp.a00_exp.z01_vo;

import java.util.Date;

public class Member {
	private String id;
	private String pass;
	private String name;
	private Date regdte;
	private Date uptdte;
	public Member() {
		// TODO Auto-generated constructor stub
	}
	public Member(String id, String pass, String name, Date regdte, Date uptdte) {
		super();
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.regdte = regdte;
		this.uptdte = uptdte;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getRegdte() {
		return regdte;
	}
	public void setRegdte(Date regdte) {
		this.regdte = regdte;
	}
	public Date getUptdte() {
		return uptdte;
	}
	public void setUptdte(Date uptdte) {
		this.uptdte = uptdte;
	}
	
}
