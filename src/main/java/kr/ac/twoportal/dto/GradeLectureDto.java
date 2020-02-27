package kr.ac.twoportal.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import kr.ac.twoportal.utils.DateUtils;

@Alias("GradeLectureDto")
public class GradeLectureDto {

	private Date lectCreateDate;
	private String lectSemester;
	private int deptNo;
	private String deptName;
	private int subNo;
	private String subName;
	private int stuGrade;
	private String stuId;
	private String stuName;
	private int gradeScore;
	private String gradeRating;
	private int gradeRank;
	
	public GradeLectureDto () {}

	
	public String getYear() {
		return DateUtils.getYear(lectCreateDate);
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

	public int getSubNo() {
		return subNo;
	}

	public void setSubNo(int subNo) {
		this.subNo = subNo;
	}

	public String getSubName() {
		return subName;
	}

	public void setSubName(String subName) {
		this.subName = subName;
	}

	public int getStuGrade() {
		return stuGrade;
	}

	public void setStuGrade(int stuGrade) {
		this.stuGrade = stuGrade;
	}

	public String getStuId() {
		return stuId;
	}

	public void setStuId(String stuId) {
		this.stuId = stuId;
	}

	public String getStuName() {
		return stuName;
	}

	public void setStuName(String stuName) {
		this.stuName = stuName;
	}

	public int getGradeScore() {
		return gradeScore;
	}

	public void setGradeScore(int gradeScore) {
		this.gradeScore = gradeScore;
	}

	public String getGradeRating() {
		return gradeRating;
	}

	public void setGradeRating(String gradeRating) {
		this.gradeRating = gradeRating;
	}


	public int getGradeRank() {
		return gradeRank;
	}


	public void setGradeRank(int gradeRank) {
		this.gradeRank = gradeRank;
	}

	
	
}
