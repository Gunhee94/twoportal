package kr.ac.twoportal.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;


@Alias("LectureList")
public class LectureList {

	private int no;
	private int lectNo;
	private int stuNo;
	private Date createDate;
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
	public int getStuNo() {
		return stuNo;
	}
	public void setStuNo(int stuNo) {
		this.stuNo = stuNo;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	@Override
	public String toString() {
		return "LectureList [no=" + no + ", lectNo=" + lectNo + ", stuNo=" + stuNo + ", createDate=" + createDate + "]";
	}
	
	
	
}
