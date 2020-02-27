package kr.ac.twoportal.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import kr.ac.twoportal.utils.DateUtils;

@Alias("LectureListDto")
public class LectureListDto {
	
	// 과목
	private String subjectName;		// 과목명
	private int subjectCredit;		// 학점 
	private String subjectMajor;	// 전공?
	private String subjectObject;	// 강의목적
	private int targetYear;			// 대상학년
	
	// 강의
	private int lectureRoom;			// 강의실
	private int lectureTotalNumber;		// 총 정원
	private Date lectureCreateDate;		// 개설날짜
	private int proNo;					// 교수번호
	private int lectNo;					// 강의번호					
	private String lectSemester;		// 학기 
	private String lectPlace;			// 강의관
	private String lectStatus;			// 강의상태
	
	//강의시간
	private String lectureDay;			// 요일
	private int firstPeriod;			// 교시1
	private int secondPeriod;			// 교시2
	private int thirdPeriod;			// 교시3
	private String time;
	
	// 학과 
	private String deptName;			// 학과명
	
	// 학생
	private String stuName;				// 학생이름
	private String stuId;				// 학번
	private int stuGrade;				// 학생 학년
	private String stuPhone;			// 학생 폰번호
	private String stuEmail;			// 학생 이메일

	public String getLectStatus() {
		return lectStatus;
	}

	public void setLectStatus(String lectStatus) {
		this.lectStatus = lectStatus;
	}

	public String getLectPlace() {
		return lectPlace;
	}

	public void setLectPlace(String lectPlace) {
		this.lectPlace = lectPlace;
	}

	public String getStuName() {
		return stuName;
	}

	public void setStuName(String stuName) {
		this.stuName = stuName;
	}

	public String getStuId() {
		return stuId;
	}

	public void setStuId(String stuId) {
		this.stuId = stuId;
	}

	public int getStuGrade() {
		return stuGrade;
	}

	public void setStuGrade(int stuGrade) {
		this.stuGrade = stuGrade;
	}

	public String getStuPhone() {
		return stuPhone;
	}

	public void setStuPhone(String stuPhone) {
		this.stuPhone = stuPhone;
	}

	public String getStuEmail() {
		return stuEmail;
	}

	public void setStuEmail(String stuEmail) {
		this.stuEmail = stuEmail;
	}
	
	public String getLectSemester() {
		return lectSemester;
	}
	
	public void setLectSemester(String lectSemester) {
		this.lectSemester = lectSemester;
	}

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}

	public int getSubjectCredit() {
		return subjectCredit;
	}

	public void setSubjectCredit(int subjectCredit) {
		this.subjectCredit = subjectCredit;
	}

	public String getSubjectMajor() {
		return subjectMajor;
	}

	public void setSubjectMajor(String subjectMajor) {
		this.subjectMajor = subjectMajor;
	}

	public String getSubjectObject() {
		return subjectObject;
	}

	public void setSubjectObject(String subjectObject) {
		this.subjectObject = subjectObject;
	}

	public int getTargetYear() {
		return targetYear;
	}

	public void setTargetYear(int targetYear) {
		this.targetYear = targetYear;
	}

	public int getLectureRoom() {
		return lectureRoom;
	}

	public void setLectureRoom(int lectureRoom) {
		this.lectureRoom = lectureRoom;
	}

	public int getLectureTotalNumber() {
		return lectureTotalNumber;
	}

	public void setLectureTotalNumber(int lectureTotalNumber) {
		this.lectureTotalNumber = lectureTotalNumber;
	}

	public Date getLectureCreateDate() {
		return lectureCreateDate;
	}

	public void setLectureCreateDate(Date lectureCreateDate) {
		this.lectureCreateDate = lectureCreateDate;
	}
	
	public String getLectureCreateDateYear() {
		return DateUtils.getYear(lectureCreateDate);
	}
	
	public int getProNo() {
		return proNo;
	}

	public void setProNo(int proNo) {
		this.proNo = proNo;
	}

	public String getLectureDay() {
		return lectureDay;
	}

	public void setLectureDay(String lectureDay) {
		this.lectureDay = lectureDay;
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

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	
	public int getLectNo() {
		return lectNo;
	}
	
	public void setLectNo(int lectNo) {
		this.lectNo = lectNo;
	}

	public String getTime() {
		return time;
	}
	
	public void setTime(String time) {
		this.time = time;
	}

	@Override
	public String toString() {
		return "LectureListDto [subjectName=" + subjectName + ", subjectCredit=" + subjectCredit + ", subjectMajor="
				+ subjectMajor + ", subjectObject=" + subjectObject + ", targetYear=" + targetYear + ", lectureRoom="
				+ lectureRoom + ", lectureTotalNumber=" + lectureTotalNumber + ", lectureCreateDate="
				+ lectureCreateDate + ", proNo=" + proNo + ", lectNo=" + lectNo + ", lectSemester=" + lectSemester
				+ ", lectPlace=" + lectPlace + ", lectureDay=" + lectureDay + ", firstPeriod=" + firstPeriod
				+ ", secondPeriod=" + secondPeriod + ", thirdPeriod=" + thirdPeriod + ", time=" + time + ", deptName="
				+ deptName + ", stuName=" + stuName + ", stuId=" + stuId + ", stuGrade=" + stuGrade + ", stuPhone="
				+ stuPhone + ", stuEmail=" + stuEmail + "]";
	}

	
	
	
	
	
	
	
	
}
