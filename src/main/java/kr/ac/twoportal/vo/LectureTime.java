package kr.ac.twoportal.vo;

import org.apache.ibatis.type.Alias;

@Alias("LectureTime")
public class LectureTime {

	private int no;
	private int lectNo;
	private String day;
	private int firstPeriod;
	private int secondPeriod;
	private int thirdPeriod;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getLectNo() {
		return lectNo;
	}
	public void setLectNo(int lectNo) {
		this.lectNo = lectNo;
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
	@Override
	public String toString() {
		return "LectureTime [no=" + no + ", lectNo=" + lectNo + ", day=" + day + ", firstPeriod=" + firstPeriod
				+ ", secondPeriod=" + secondPeriod + ", thirdPeriod=" + thirdPeriod + "]";
	}
	
	
	
}
