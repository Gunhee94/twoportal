package kr.ac.twoportal.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import kr.ac.twoportal.utils.DateUtils;

@Alias("LectureAndGradeDto")
public class LectureAndGradeDto {

	private int gradeNo;
	private int lectNo;
	private Date lectCreateDate;
	private String lectSemester;
	private String subName;
	
	public LectureAndGradeDto () {}

	public String getYear() {
		return DateUtils.getYear(lectCreateDate);
	}
	
	public int getGradeNo() {
		return gradeNo;
	}

	public void setGradeNo(int gradeNo) {
		this.gradeNo = gradeNo;
	}

	public int getLectNo() {
		return lectNo;
	}

	public void setLectNo(int lectNo) {
		this.lectNo = lectNo;
	}

	public Date getLectCreateDate() {
		return lectCreateDate;
	}

	public void setLectCreateDate(Date lectCreateDate) {
		this.lectCreateDate = lectCreateDate;
	}

	public String getLectSemester() {
		return lectSemester;
	}

	public void setLectSemester(String lectSemester) {
		this.lectSemester = lectSemester;
	}

	public String getSubName() {
		return subName;
	}

	public void setSubName(String subName) {
		this.subName = subName;
	}
	
	
}
