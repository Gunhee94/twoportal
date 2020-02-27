package kr.ac.twoportal.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import kr.ac.twoportal.utils.DateUtils;
import kr.ac.twoportal.utils.NumberUtils;

@Alias("Salary")
public class Salary {

	private int no;
	private String checked;
	private int salary;
	private int proNo;
	private int staffNo;
	private Date salaryPaymentDate;
	
	public String getMonth() {
		return DateUtils.getMonth(salaryPaymentDate);
	}
	public String getSalarycommma() {
		return NumberUtils.getNumber(salary);
	}
	public Date getSalaryPaymentDate() {
		return salaryPaymentDate;
	}
	public void setSalaryPaymentDate(Date salaryPaymentDate) {
		this.salaryPaymentDate = salaryPaymentDate;
	}
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
	public int getProNo() {
		return proNo;
	}
	public void setProNo(int proNo) {
		this.proNo = proNo;
	}
	public int getStaffNo() {
		return staffNo;
	}
	public void setStaffNo(int staffNo) {
		this.staffNo = staffNo;
	}
	
	@Override
	public String toString() {
		return "Salary [no=" + no + ", checked=" + checked + ", salary=" + salary + ", proNo=" + proNo + ", staffNo="
				+ staffNo + "]";
	}
	
	
}
