package jspexp.z01_vo;

public class JobSalary {
	private String job;
	private int cnt;
	private int avgsal;
	public JobSalary() {
	
	}
	public JobSalary(String job, int cnt, int avgsal) {
		this.job = job;
		this.cnt = cnt;
		this.avgsal = avgsal;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getAvgsal() {
		return avgsal;
	}
	public void setAvgsal(int avgsal) {
		this.avgsal = avgsal;
	}
}
