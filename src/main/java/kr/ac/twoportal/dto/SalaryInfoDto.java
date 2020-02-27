package kr.ac.twoportal.dto;

import org.apache.ibatis.type.Alias;

@Alias("SalaryInfoDto")
public class SalaryInfoDto {
	private int no;
	private String checked;
	private int salary;
	private String proName;
	private String bankName;
	private String accountNumber;
	private String paymentDate;
	private String deptName;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getChecked() {
		return checked;
	}
	public void setChecked(String checked) {
		this.checked = checked;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
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
	public String getPaymentDate() {
		return paymentDate;
	}
	public void setPaymentDate(String paymentDate) {
		this.paymentDate = paymentDate;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	@Override
	public String toString() {
		return "SalaryInfoDto [no=" + no + ", checked=" + checked + ", salary=" + salary + ", proName=" + proName
				+ ", bankName=" + bankName + ", accountNumber=" + accountNumber + ", paymentDate=" + paymentDate
				+ ", deptName=" + deptName + "]";
	}
	
	
}
