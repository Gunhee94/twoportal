package kr.ac.twoportal.form;

import java.util.Date;

public class LectureAddForm {
	private Date date;   //
	private int department; //
	private int targetYear; //
	private String subname; //
	private String credit; //
	private String place;  //  
	private int room;      //
	private String[] dayandPeriodArr;
	private String object; //
	  
	
	public String[] getDayandPeriodArr() {
		return dayandPeriodArr;
	}
	public void setDayandPeriodArr(String[] dayandPeriodArr) {
		this.dayandPeriodArr = dayandPeriodArr;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getDepartment() {
		return department;
	}
	public void setDepartment(int department) {
		this.department = department;
	}
	public int getTargetYear() {
		return targetYear;
	}
	public void setTargetYear(int targetYear) {
		this.targetYear = targetYear;
	}
	public String getSubname() {
		return subname;
	}
	public void setSubname(String subname) {
		this.subname = subname;
	}
	public String getCredit() {
		return credit;
	}
	public void setCredit(String credit) {
		this.credit = credit;
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
	public String getObject() {
		return object;
	}
	public void setObject(String object) {
		this.object = object;
	}
	@Override
	public String toString() {
		return "LectureAddForm [date=" + date + ", department=" + department + ", targetYear=" + targetYear
				+ ", subname=" + subname + ", credit=" + credit + ", place=" + place + ", room=" + room
				+ ", dayandPeriodArr=" + dayandPeriodArr + ", object=" + object + "]";
	}
	
	
	
	
	
}
