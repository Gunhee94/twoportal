package kr.ac.twoportal.dto;

import java.util.Date;

public class ProsessorDayCheckDto {

	private	String subjectName;
	private String place;
	private String proName;
	private String today;
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
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public String getToday() {
		return today;
	}
	public void setToday(String today) {
		this.today = today;
	}
	@Override
	public String toString() {
		return "ProsessorDayCheckDto [subjectName=" + subjectName + ", place=" + place + ", proName=" + proName
				+ ", today=" + today + "]";
	}
	
	

	

	
}
