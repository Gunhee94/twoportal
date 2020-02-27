package kr.ac.twoportal.dto;

import org.apache.ibatis.type.Alias;

@Alias("RegisterCartDto")
public class RegisterCartDto {

	// school_sudent_lecture_cart
	private int no;
	private int subNo;
	private int lectNo;
	private int stuNo;
	private int lectTimeNo;
	
	public int getLectTimeNo() {
		return lectTimeNo;
	}
	public void setLectTimeNo(int lectTimeNo) {
		this.lectTimeNo = lectTimeNo;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getSubNo() {
		return subNo;
	}
	public void setSubNo(int subNo) {
		this.subNo = subNo;
	}
	public int getLectNo() {
		return lectNo;
	}
	public void setLectNo(int lectNo) {
		this.lectNo = lectNo;
	}
	public int getStuNo() {
		return stuNo;
	}
	public void setStuNo(int stuNo) {
		this.stuNo = stuNo;
	}
	@Override
	public String toString() {
		return "RegisterCartDto [no=" + no + ", subNo=" + subNo + ", lectNo=" + lectNo + ", stuNo=" + stuNo
				+ ", lectTimeNo=" + lectTimeNo + "]";
	}
	
}
