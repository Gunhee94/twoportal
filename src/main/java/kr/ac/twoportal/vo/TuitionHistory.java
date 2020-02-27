package kr.ac.twoportal.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("TuitionHistory")
public class TuitionHistory {

	private int no;
	private int tuitionNo;
	private int stuNo;
	private Date date;
	private String payWay;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getTuitionNo() {
		return tuitionNo;
	}
	public void setTuitionNo(int tuitionNo) {
		this.tuitionNo = tuitionNo;
	}
	public int getStuNo() {
		return stuNo;
	}
	public void setStuNo(int stuNo) {
		this.stuNo = stuNo;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getPayWay() {
		return payWay;
	}
	public void setPayWay(String payWay) {
		this.payWay = payWay;
	}
	@Override
	public String toString() {
		return "TuitionHistory [no=" + no + ", tuitionNo=" + tuitionNo + ", stuNo=" + stuNo + ", date=" + date
				+ ", payWay=" + payWay + "]";
	}
	
	
	
}
