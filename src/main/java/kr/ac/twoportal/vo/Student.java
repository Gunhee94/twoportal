package kr.ac.twoportal.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("Student")
public class Student {

	private int no;
	private String name;
	private String id;
	private String pwd;
	private Date age;
	private String status;
	private int grade;
	private Date admission;
	private Date graduated;
	private String checkedPwd;
	private String address;
	private String email;
	private String phone;
	private String bankName;
	private String accountNumber;
	private int deptNo;
	private String stuAccess;
	private String imageName;
	
	
	public String getImageName() {
		return imageName;
	}
	public void setImageName(String imageName) {
		this.imageName = imageName;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public Date getAge() {
		return age;
	}
	public void setAge(Date age) {
		this.age = age;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public Date getAdmission() {
		return admission;
	}
	public void setAdmission(Date admission) {
		this.admission = admission;
	}
	public Date getGraduated() {
		return graduated;
	}
	public void setGraduated(Date graduated) {
		this.graduated = graduated;
	}
	public String getCheckedPwd() {
		return checkedPwd;
	}
	public void setCheckedPwd(String checkedPwd) {
		this.checkedPwd = checkedPwd;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public String getAccountNumber() {
		return accountNumber;
	}
	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}
	public int getDeptNo() {
		return deptNo;
	}
	public void setDeptNo(int deptNo) {
		this.deptNo = deptNo;
	}
	public String getStuAccess() {
		return stuAccess;
	}
	public void setStuAccess(String stuAccess) {
		this.stuAccess = stuAccess;
	}
	
	@Override
	public String toString() {
		return "Student [no=" + no + ", name=" + name + ", id=" + id + ", pwd=" + pwd + ", age=" + age + ", status="
				+ status + ", grade=" + grade + ", admission=" + admission + ", graduated=" + graduated
				+ ", checkedPwd=" + checkedPwd + ", address=" + address + ", email=" + email + ", phone=" + phone
				+ ", bankName=" + bankName + ", accountNumber=" + accountNumber + ", deptNo=" + deptNo + ", stuAccess="
				+ stuAccess + "]";
	}
	
	
}
