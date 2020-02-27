package kr.ac.twoportal.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import kr.ac.twoportal.utils.DateUtils;

@Alias("LectureandCancelDto")
public class LectureandCancelDto {
	private int lectNo;
	private int proNo;
	private Date lectCreateDate;
	private int lectSemester;
	private String lectStatus;
	private int cacellNo;
	private Date calcellStartDate;
	private Date calcellEndDate;
	private Date cancellReqDate;
	private String subName;
	private String cancellReason;
	private Date cancellRespDate;
	private String proName;
	
	public LectureandCancelDto () {}

	public String getmycancellReqDate() {
		return DateUtils.getYYYYMMDD(cancellReqDate);
	}
	public String getmycalcellStartDate() {
		return DateUtils.getYYYYMMDD(calcellStartDate);
	}
	public String getmycalcellEndDate() {
		return DateUtils.getYYYYMMDD(calcellEndDate);
	}
	public String getmycancellRespDate() {
		return DateUtils.getYYYYMMDD(cancellRespDate);
	}

	
	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public Date getCancellReqDate() {
		return cancellReqDate;
	}

	public void setCancellReqDate(Date cancellReqDate) {
		this.cancellReqDate = cancellReqDate;
	}

	public String getSubName() {
		return subName;
	}

	public void setSubName(String subName) {
		this.subName = subName;
	}

	public String getCancellReason() {
		return cancellReason;
	}

	public void setCancellReason(String cancellReason) {
		this.cancellReason = cancellReason;
	}

	public Date getCancellRespDate() {
		return cancellRespDate;
	}

	public void setCancellRespDate(Date cancellRespDate) {
		this.cancellRespDate = cancellRespDate;
	}

	public Date getLectCreateDate() {
		return lectCreateDate;
	}

	public void setLectCreateDate(Date lectCreateDate) {
		this.lectCreateDate = lectCreateDate;
	}

	public Date getCalcellStartDate() {
		return calcellStartDate;
	}

	public void setCalcellStartDate(Date calcellStartDate) {
		this.calcellStartDate = calcellStartDate;
	}

	public Date getCalcellEndDate() {
		return calcellEndDate;
	}

	public void setCalcellEndDate(Date calcellEndDate) {
		this.calcellEndDate = calcellEndDate;
	}

	public int getLectNo() {
		return lectNo;
	}

	public void setLectNo(int lectNo) {
		this.lectNo = lectNo;
	}

	public int getProNo() {
		return proNo;
	}

	public void setProNo(int proNo) {
		this.proNo = proNo;
	}

	

	public int getLectSemester() {
		return lectSemester;
	}

	public void setLectSemester(int lectSemester) {
		this.lectSemester = lectSemester;
	}

	public String getLectStatus() {
		return lectStatus;
	}

	public void setLectStatus(String lectStatus) {
		this.lectStatus = lectStatus;
	}

	public int getCacellNo() {
		return cacellNo;
	}

	public void setCacellNo(int cacellNo) {
		this.cacellNo = cacellNo;
	}

	@Override
	public String toString() {
		return "LectureandCancelDto [lectNo=" + lectNo + ", proNo=" + proNo + ", lectCreateDate=" + lectCreateDate
				+ ", lectSemester=" + lectSemester + ", lectStatus=" + lectStatus + ", cacellNo=" + cacellNo
				+ ", calcellStartDate=" + calcellStartDate + ", calcellEndDate=" + calcellEndDate + ", cancellReqDate="
				+ cancellReqDate + ", subName=" + subName + ", cancellReason=" + cancellReason + ", cancellRespDate="
				+ cancellRespDate + "]";
	}


	

	
	
}
