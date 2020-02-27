package kr.ac.twoportal.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("Lecture")
public class Lecture {

	private int no;
	private int subjectNo;
	private int proNo;
	private Date createDate;
	private int totalNumber;
	private int room;
	private String semester;
	private String place;
	private String status; // 신청, 미허용, 허용, 진행중, 휴강중,  종료
	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPlace() {
		return place;
	}
	
	public void setPlace(String place) {
		this.place = place;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getSubjectNo() {
		return subjectNo;
	}
	public void setSubjectNo(int subjectNo) {
		this.subjectNo = subjectNo;
	}
	public int getProNo() {
		return proNo;
	}
	public void setProNo(int proNo) {
		this.proNo = proNo;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public int getTotalNumber() {
		return totalNumber;
	}
	public void setTotalNumber(int totalNumber) {
		this.totalNumber = totalNumber;
	}
	public int getRoom() {
		return room;
	}
	public void setRoom(int room) {
		this.room = room;
	}
	public String getSemester() {
		return semester;
	}
	public void setSemester(String semester) {
		this.semester = semester;
	}

	@Override
	public String toString() {
		return "Lecture [no=" + no + ", subjectNo=" + subjectNo + ", proNo=" + proNo + ", createDate=" + createDate
				+ ", totalNumber=" + totalNumber + ", room=" + room + ", semester=" + semester + ", place=" + place
				+ "]";
	}

	
	
	
}
