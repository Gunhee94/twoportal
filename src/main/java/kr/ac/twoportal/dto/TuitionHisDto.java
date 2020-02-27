package kr.ac.twoportal.dto;

public class TuitionHisDto {
	private String price;
	private String quarter;
	private int deptNo;
	private String deptName;
	private String year;
	private String dateToDate;
	private String isClose;
	private String payWay;
	
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getQuarter() {
		return quarter;
	}
	public void setQuarter(String quarter) {
		this.quarter = quarter;
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
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getDateToDate() {
		return dateToDate;
	}
	public void setDateToDate(String dateToDate) {
		this.dateToDate = dateToDate;
	}
	public String getIsClose() {
		return isClose;
	}
	public void setIsClose(String isClose) {
		this.isClose = isClose;
	}
	
	public String getPayWay() {
		return payWay;
	}
	public void setPayWay(String payWay) {
		this.payWay = payWay;
	}
	@Override
	public String toString() {
		return "TuitionHisDto [price=" + price + ", quarter=" + quarter + ", deptNo=" + deptNo + ", deptName="
				+ deptName + ", year=" + year + ", dateToDate=" + dateToDate + ", isClose=" + isClose + "]";
	}

	
	
}
