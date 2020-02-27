package kr.ac.twoportal.form;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("TutionAddForm")
public class TutionAddForm {

	private int tuitionNo;
	private int deptNo;
	private String deptName;
	private Date startdate;
	private String startdatemodify;
	private String enddatemodify;
	private Date enddate;
	private int payprice;
	private String quarter;
	
	public int getTuitionNo() {
		return tuitionNo;
	}
	public void setTuitionNo(int tuitionNo) {
		this.tuitionNo = tuitionNo;
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
	public Date getStartdate() {
		return startdate;
	}
	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}
	public String getStartdatemodify() {
		return startdatemodify;
	}
	public void setStartdatemodify(String startdatemodify) {
		this.startdatemodify = startdatemodify;
	}
	public String getEnddatemodify() {
		return enddatemodify;
	}
	public void setEnddatemodify(String enddatemodify) {
		this.enddatemodify = enddatemodify;
	}
	public Date getEnddate() {
		return enddate;
	}
	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}
	public int getPayprice() {
		return payprice;
	}
	public void setPayprice(int payprice) {
		this.payprice = payprice;
	}
	public String getQuarter() {
		return quarter;
	}
	public void setQuarter(String quarter) {
		this.quarter = quarter;
	}
	
	@Override
	public String toString() {
		return "TutionAddForm [tuitionNo=" + tuitionNo + ", deptNo=" + deptNo + ", deptName=" + deptName
				+ ", startdate=" + startdate + ", startdatemodify=" + startdatemodify + ", enddatemodify="
				+ enddatemodify + ", enddate=" + enddate + ", payprice=" + payprice + ", quarter=" + quarter + "]";
	}
	
	
	
	
	
}
