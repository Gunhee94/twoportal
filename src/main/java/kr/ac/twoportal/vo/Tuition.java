package kr.ac.twoportal.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("Tuition")
public class Tuition {

	private int no;
	private int deptNo;
	private int price;
	private String quarter;
	private String year;
	private Date payStartDate;
	private Date payEndDate;
	private String isClose;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getDeptNo() {
		return deptNo;
	}
	public void setDeptNo(int deptNo) {
		this.deptNo = deptNo;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getQuarter() {
		return quarter;
	}
	public void setQuarter(String quarter) {
		this.quarter = quarter;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public Date getPayStartDate() {
		return payStartDate;
	}
	public void setPayStartDate(Date payStartDate) {
		this.payStartDate = payStartDate;
	}
	public Date getPayEndDate() {
		return payEndDate;
	}
	public void setPayEndDate(Date payEndDate) {
		this.payEndDate = payEndDate;
	}
	public String getIsClose() {
		return isClose;
	}
	public void setIsClose(String isClose) {
		this.isClose = isClose;
	}
	@Override
	public String toString() {
		return "Tuition [no=" + no + ", deptNo=" + deptNo + ", price=" + price + ", quarter=" + quarter + ", year="
				+ year + ", payStartDate=" + payStartDate + ", payEndDate=" + payEndDate + ", isClose=" + isClose + "]";
	}
	
	
	
}
