package kr.ac.twoportal.form;

import java.util.Date;

import org.apache.ibatis.type.Alias;
@Alias("LectureAllowListForm")
public class LectureAllowListForm {
	
	private int lectNo;
	private int semester;
	private Date createDate;
	private int targetYear;
	private String deptName;
	private String major;
	private String subjectName;
	private String place;
	private int room;
	private String day;
	private int firstPeriod;
	private int secondPeriod;
	private int thirdPeriod;
	
	
	public int getLectNo() {
		return lectNo;
	}
	public void setLectNo(int lectNo) {
		this.lectNo = lectNo;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public int getTargetYear() {
		return targetYear;
	}
	public void setTargetYear(int targetYear) {
		this.targetYear = targetYear;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getSubjectName() {
		return subjectName;
	}
	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public int getRoom() {
		return room;
	}
	public void setRoom(int room) {
		this.room = room;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public int getFirstPeriod() {
		return firstPeriod;
	}
	public void setFirstPeriod(int firstPeriod) {
		this.firstPeriod = firstPeriod;
	}
	public int getSecondPeriod() {
		return secondPeriod;
	}
	public void setSecondPeriod(int secondPeriod) {
		this.secondPeriod = secondPeriod;
	}
	public int getThirdPeriod() {
		return thirdPeriod;
	}
	public void setThirdPeriod(int thirdPeriod) {
		this.thirdPeriod = thirdPeriod;
	}
	
	public int getSemester() {
		return semester;
	}
	public void setSemester(int semester) {
		this.semester = semester;
	}
	@Override
	public String toString() {
		return "LectureAllowListForm [lectNo=" + lectNo + ", semester=" + semester + ", createDate=" + createDate
				+ ", targetYear=" + targetYear + ", deptName=" + deptName + ", major=" + major + ", subjectName="
				+ subjectName + ", place=" + place + ", room=" + room + ", day=" + day + ", firstPeriod=" + firstPeriod
				+ ", secondPeriod=" + secondPeriod + ", thirdPeriod=" + thirdPeriod + "]";
	}
	
	
	
	 
}
