package kr.ac.twoportal.form;


import org.springframework.web.multipart.MultipartFile;

public class MultipartImageStudentForm {
	
	private int no;
	private String name;
	private String id;
	private String pwd;
	private String pwdSecond;
	private String age;
	private String status;
	private int grade;
	private String admission;
	private String graduated;
	private String checkedPwd;
	private String address;
	private String email;
	private String phone;
	private String bankName;
	private String accountNumber;
	private String deptName;
	private String stuAccess;
	private MultipartFile imgFile;
	
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
	public String getPwdSecond() {
		return pwdSecond;
	}
	public void setPwdSecond(String pwdSecond) {
		this.pwdSecond = pwdSecond;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
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
	public String getAdmission() {
		return admission;
	}
	public void setAdmission(String admission) {
		this.admission = admission;
	}
	public String getGraduated() {
		return graduated;
	}
	public void setGraduated(String graduated) {
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
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public String getStuAccess() {
		return stuAccess;
	}
	public void setStuAccess(String stuAccess) {
		this.stuAccess = stuAccess;
	}
	public MultipartFile getImgFile() {
		return imgFile;
	}
	public void setImgFile(MultipartFile imgFile) {
		this.imgFile = imgFile;
	}
	@Override
	public String toString() {
		return "MultipartImageStudentForm [no=" + no + ", name=" + name + ", id=" + id + ", pwd=" + pwd + ", pwdSecond="
				+ pwdSecond + ", age=" + age + ", status=" + status + ", grade=" + grade + ", admission=" + admission
				+ ", graduated=" + graduated + ", checkedPwd=" + checkedPwd + ", address=" + address + ", email="
				+ email + ", phone=" + phone + ", bankName=" + bankName + ", accountNumber=" + accountNumber
				+ ", deptName=" + deptName + ", stuAccess=" + stuAccess + ", imgFile=" + imgFile + "]";
	}
	
	
	

}
