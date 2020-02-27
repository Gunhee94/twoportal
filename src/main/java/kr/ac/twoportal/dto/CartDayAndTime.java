package kr.ac.twoportal.dto;

import org.apache.ibatis.type.Alias;

@Alias("CartDayAndTime")
public class CartDayAndTime {

	// school_lecture_time
	private int lectTimeNo;
	private String lectDay;
	private int firstPeriod;
	private int secondPeriod;
	private int thirdPeriod;
	
	public CartDayAndTime() {}
	
	public CartDayAndTime(String lectDay, int firstPeriod, int secondPeriod, int thirdPeriod) {
		super();
		this.lectDay = lectDay;
		this.firstPeriod = firstPeriod;
		this.secondPeriod = secondPeriod;
		this.thirdPeriod = thirdPeriod;
	}

	public int getLectTimeNo() {
		return lectTimeNo;
	}
	public void setLectTimeNo(int lectTimeNo) {
		this.lectTimeNo = lectTimeNo;
	}
	public String getLectDay() {
		return lectDay;
	}
	public void setLectDay(String lectDay) {
		this.lectDay = lectDay;
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
	@Override
	public String toString() {
		return "CartDayAndTime [lectTimeNo=" + lectTimeNo + ", lectDay=" + lectDay + ", firstPeriod=" + firstPeriod
				+ ", secondPeriod=" + secondPeriod + ", thirdPeriod=" + thirdPeriod + "]";
	}
	
	
}
