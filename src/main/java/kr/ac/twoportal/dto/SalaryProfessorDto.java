package kr.ac.twoportal.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("SalaryProfessorDto")
public class SalaryProfessorDto {
	
	private int salary;
	private Date salaryPaymentDate;
	private String proName;
	private int avg;
	
	public SalaryProfessorDto () {}
	
	public int getAvg() {
		return avg;
	}

	public void setAvg(int avg) {
		this.avg = avg;
	}

	public int getSalary() {
		return salary;
	}

	public void setSalary(int salary) {
		this.salary = salary;
	}

	public Date getSalaryPaymentDate() {
		return salaryPaymentDate;
	}

	public void setSalaryPaymentDate(Date salaryPaymentDate) {
		this.salaryPaymentDate = salaryPaymentDate;
	}

	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}
	
	

	
	
	
	
	
	
}
