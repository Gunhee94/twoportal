package kr.ac.twoportal.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("LectureCancel")
public class LectureCancel {

	private int no;
	private int proNo;
	private int lectNo;
	private String reason;
	private Date reqDate;
	private Date respDate;
	private Date startDate;
	private Date endDate;
	private String isCheck;
	
	public String getIsCheck() {
		return isCheck;
	}
	public void setIsCheck(String isCheck) {
		this.isCheck = isCheck;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getProNo() {
		return proNo;
	}
	public void setProNo(int proNo) {
		this.proNo = proNo;
	}
	public int getLectNo() {
		return lectNo;
	}
	public void setLectNo(int lectNo) {
		this.lectNo = lectNo;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public Date getReqDate() {
		return reqDate;
	}
	public void setReqDate(Date reqDate) {
		this.reqDate = reqDate;
	}
	public Date getRespDate() {
		return respDate;
	}
	public void setRespDate(Date respDate) {
		this.respDate = respDate;
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
	@Override
	public String toString() {
		return "LectureCancel [no=" + no + ", proNo=" + proNo + ", lectNo=" + lectNo + ", reason=" + reason
				+ ", reqDate=" + reqDate + ", respDate=" + respDate + ", startDate=" + startDate + ", endDate="
				+ endDate + "]";
	}
	
	
}
