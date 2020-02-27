package kr.ac.twoportal.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("TestInfo")
public class TestInfo {

	private int no;
	private int lectNo;
	private Date startDate;
	private Date endDate;
	private int cutline;
	private int timeLimit;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getLectNo() {
		return lectNo;
	}
	public void setLectNo(int lectNo) {
		this.lectNo = lectNo;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public int getCutline() {
		return cutline;
	}
	public void setCutline(int cutline) {
		this.cutline = cutline;
	}
	public int getTimeLimit() {
		return timeLimit;
	}
	public void setTimeLimit(int timeLimit) {
		this.timeLimit = timeLimit;
	}
	@Override
	public String toString() {
		return "TestInfo [no=" + no + ", lectNo=" + lectNo + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", cutline=" + cutline + ", timeLimit=" + timeLimit + "]";
	}
	
	
	
}
