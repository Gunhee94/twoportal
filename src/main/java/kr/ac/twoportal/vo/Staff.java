package kr.ac.twoportal.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("Staff")
public class Staff {
	private int no;
	private String id;
	private String pwd;
	private String name;
	private String phoneNumber;
	private String email;
	private String address;
	private Date hirddate;
	private String access;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getHirddate() {
		return hirddate;
	}
	public void setHirddate(Date hirddate) {
		this.hirddate = hirddate;
	}
	public String getAccess() {
		return access;
	}
	public void setAccess(String access) {
		this.access = access;
	}
	@Override
	public String toString() {
		return "Staff [no=" + no + ", id=" + id + ", pwd=" + pwd + ", name=" + name + ", phoneNumber=" + phoneNumber
				+ ", email=" + email + ", address=" + address + ", hirddate=" + hirddate + ", access=" + access + "]";
	}
	
	
}
