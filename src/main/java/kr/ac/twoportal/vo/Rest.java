package kr.ac.twoportal.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;


@Alias("Rest")
public class Rest {

	private int no;
	private int stuNo;
	private String reason;
	private Date startYear;
	private Date startSemester;
	private Date endYear;
	private Date endSemester;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getStuNo() {
		return stuNo;
	}
	public void setStuNo(int stuNo) {
		this.stuNo = stuNo;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public Date getStartYear() {
		return startYear;
	}
	public void setStartYear(Date startYear) {
		this.startYear = startYear;
	}
	public Date getStartSemester() {
		return startSemester;
	}
	public void setStartSemester(Date startSemester) {
		this.startSemester = startSemester;
	}
	public Date getEndYear() {
		return endYear;
	}
	public void setEndYear(Date endYear) {
		this.endYear = endYear;
	}
	public Date getEndSemester() {
		return endSemester;
	}
	public void setEndSemester(Date endSemester) {
		this.endSemester = endSemester;
	}
	
	@Override
	public String toString() {
		return "Rest [no=" + no + ", stuNo=" + stuNo + ", reason=" + reason + ", startYear=" + startYear
				+ ", startSemester=" + startSemester + ", endYear=" + endYear + ", endSemester=" + endSemester + "]";
	}
	
	
}
