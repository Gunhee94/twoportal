package kr.ac.twoportal.dto;


import org.apache.ibatis.type.Alias;

@Alias("studentMypageDto")
public class StudentMypageDto {
	private int no;
	private String imageName;
	private String name;
	private String id;
	private String pwd;
	private String birthDay;
	private String deptName;
	private int grade;
	private String address;
	private String email;
	private String phone;
	private String bankName;
	private String accountNumber;
	
	
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
	public String getBirthDay() {
		return birthDay;
	}
	public void setBirthDay(String birthDay) {
		this.birthDay = birthDay;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
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
	@Override
	public String toString() {
		return "StudentMypageDto [imageName=" + imageName + ", no=" + no + ", name=" + name + ", id=" + id + ", pwd="
				+ pwd + ", birthDay=" + birthDay + ", deptName=" + deptName + ", grade=" + grade + ", address="
				+ address + ", email=" + email + ", phone=" + phone + ", bankName=" + bankName + ", accountNumber="
				+ accountNumber + "]";
	}
	
	
}
