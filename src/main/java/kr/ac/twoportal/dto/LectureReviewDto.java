package kr.ac.twoportal.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import kr.ac.twoportal.utils.DateUtils;

@Alias("LectureReviewDto")
public class LectureReviewDto {
	
	private int lectNo;
	private Date lectCreatedate;
	private String lectSemester;
	private String proName;
	private String subName;
	private String deptName;
	private String iscompleted;
	private double lectavg;
	private int lectListNo;
	private int stuNo;
	private String stuName;
	private int stuTotal;
	private String subMajor;
	private int subCredit; 
	private int lectTotalNumber;
	private String stuId;
	private String stuPhone;
	private String stuEmail;
	private int stuGrade;
	private String stuDeptName;
	
	public String getDate() {
		return DateUtils.getYYYYMMDD(lectCreatedate);
	}
	
	public String getStar() {
	
		if (lectavg >= 21) {
			return "★★★★★";
		} else if (lectavg >= 16) {
			return "★★★★☆";
		} else if (lectavg >= 11) {
			return "★★★☆☆";
		} else if (lectavg >= 6) {
			return "★★☆☆☆";			
		} else {
			return "★☆☆☆☆";						
		}
		
	}	
	public String getStuTotalStar() {
		if (stuTotal >= 21) {
			return "★★★★★";
		} else if (stuTotal >= 16) {
			return "★★★★☆";
		} else if (stuTotal >= 11) {
			return "★★★☆☆";
		} else if (stuTotal >= 6) {
			return "★★☆☆☆";			
		} else {
			return "★☆☆☆☆";						
		}
	}
	
	public int getStuGrade() {
		return stuGrade;
	}

	public void setStuGrade(int stuGrade) {
		this.stuGrade = stuGrade;
	}

	public String getStuDeptName() {
		return stuDeptName;
	}

	public void setStuDeptName(String stuDeptName) {
		this.stuDeptName = stuDeptName;
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

	public String getStuId() {
		return stuId;
	}

	public void setStuId(String stuId) {
		this.stuId = stuId;
	}

	public String getSubMajor() {
		return subMajor;
	}

	public void setSubMajor(String subMajor) {
		this.subMajor = subMajor;
	}

	public int getSubCredit() {
		return subCredit;
	}

	public void setSubCredit(int subCredit) {
		this.subCredit = subCredit;
	}

	public int getLectTotalNumber() {
		return lectTotalNumber;
	}

	public void setLectTotalNumber(int lectTotalNumber) {
		this.lectTotalNumber = lectTotalNumber;
	}

	public int getStuNo() {
		return stuNo;
	}

	public void setStuNo(int stuNo) {
		this.stuNo = stuNo;
	}

	public String getStuName() {
		return stuName;
	}

	public void setStuName(String stuName) {
		this.stuName = stuName;
	}

	public int getStuTotal() {
		return stuTotal;
	}

	public void setStuTotal(int stuTotal) {
		this.stuTotal = stuTotal;
	}

	public int getLectListNo() {
		return lectListNo;
	}

	public void setLectListNo(int lectListNo) {
		this.lectListNo = lectListNo;
	}

	public int getLectNo() {
		return lectNo;
	}
	public void setLectNo(int lectNo) {
		this.lectNo = lectNo;
	}
	public Date getLectCreatedate() {
		return lectCreatedate;
	}
	public void setLectCreatedate(Date lectCreatedate) {
		this.lectCreatedate = lectCreatedate;
	}
	public String getLectSemester() {
		return lectSemester;
	}
	public void setLectSemester(String lectSemester) {
		this.lectSemester = lectSemester;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public String getSubName() {
		return subName;
	}
	public void setSubName(String subName) {
		this.subName = subName;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public String getIscompleted() {
		return iscompleted;
	}
	public void setIscompleted(String iscompleted) {
		this.iscompleted = iscompleted;
	}
	
	public double getLectavg() {
		return lectavg;
	}
	public void setLectavg(double lectavg) {
		this.lectavg = lectavg;
	}
	@Override
	public String toString() {
		return "LectureReviewDto [lectNo=" + lectNo + ", lectCreatedate=" + lectCreatedate + ", lectSemester="
				+ lectSemester + ", proName=" + proName + ", subName=" + subName + ", deptName=" + deptName
				+ ", iscompleted=" + iscompleted + "]";
	}
	
	
}
