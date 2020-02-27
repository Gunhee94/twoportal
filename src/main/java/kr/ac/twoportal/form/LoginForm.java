package kr.ac.twoportal.form;

public class LoginForm {

	private String userid;
	private String pwd;
	private String job;
	
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	@Override
	public String toString() {
		return "LoginForm [userid=" + userid + ", pwd=" + pwd + ", job=" + job + "]";
	}

	
	
	

	
}
