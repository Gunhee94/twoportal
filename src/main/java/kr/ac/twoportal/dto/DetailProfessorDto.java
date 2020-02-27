package kr.ac.twoportal.dto;

import org.apache.ibatis.type.Alias;

import kr.ac.twoportal.utils.DateUtils;

@Alias("DetailProfessorDto")
public class DetailProfessorDto {
	
	private int no;
	private String name;
	private String id;
	private String pwd;
	private String position;
	private String createDate;
	private String imageName;
	private String bankName;
	private String email;
	private String accountNumber;
	private int deptNo;
	private String deptName;
	private String access;
	

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
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getImageName() {
		return imageName;
	}
	public void setImageName(String imageName) {
		this.imageName = imageName;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public String getAccess() {
		return access;
	}
	public void setAccess(String access) {
		this.access = access;
	}
	@Override
	public String toString() {
		return "DetailProfessorDto [no=" + no + ", name=" + name + ", id=" + id + ", pwd=" + pwd + ", position="
				+ position + ", createDate=" + createDate + ", imageName=" + imageName + ", bankName=" + bankName
				+ ", email=" + email + ", accountNumber=" + accountNumber + ", deptNo=" + deptNo + ", deptName="
				+ deptName + ", access=" + access + "]";
	}
	
	
}
