package kr.ac.twoportal.dto;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.StringJoiner;

import org.apache.ibatis.type.Alias;

@Alias("RegisterListDto")
public class RegisterListDto {

	// school_subjects : 과목번호/학과번호/학점/전공,교양/대상학년/과목명
	private int subNo;
	private int deptNo;
	private int credit;
	private String major;
	private int targetYear;
	private String subName;
	
	// school_lectures : 강의시간/강의실/인원
	private int lectNo;
	private String place;
	private int room;
	private int totalNumber;
	
	private Date lectCreateDate;
	private String semester;
	
	// school_professors : 담당교수명
	private String proName;
	
	// school_student_lecture_list : 수강신청일
	private Date createDate;
	
	// 수강중복이면 버튼비활성화하기
	private Integer registeredLectNo;
	
	// 장바구니에 있으면 버튼비활성화하기
	private Integer existInCart;
	
	// school_lecture_time
	private int lectTimeNo;
	private String lectDay;
	private int firstPeriod;
	private int secondPeriod;
	private int thirdPeriod;
	
	
	List<CartDayAndTime> timeTables = new ArrayList<CartDayAndTime>();
	
	
	public Date getLectCreateDate() {
		return lectCreateDate;
	}

	public void setLectCreateDate(Date lectCreateDate) {
		this.lectCreateDate = lectCreateDate;
	}

	public String getSemester() {
		return semester;
	}

	public void setSemester(String semester) {
		this.semester = semester;
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

	public Integer getExistInCart() {
		return existInCart;
	}

	public void setExistInCart(Integer existInCart) {
		this.existInCart = existInCart;
	}

	public Integer getRegisteredLectNo() {
		return registeredLectNo;
	}

	public void setRegisteredLectNo(Integer registeredLectNo) {
		this.registeredLectNo = registeredLectNo;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public int getSubNo() {
		return subNo;
	}

	public void setSubNo(int subNo) {
		this.subNo = subNo;
	}

	public int getLectNo() {
		return lectNo;
	}

	public void setLectNo(int lectNo) {
		this.lectNo = lectNo;
	}

	public int getDeptNo() {
		return deptNo;
	}

	public void setDeptNo(int deptNo) {
		this.deptNo = deptNo;
	}

	public int getCredit() {
		return credit;
	}

	public void setCredit(int credit) {
		this.credit = credit;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public int getTargetYear() {
		return targetYear;
	}

	public void setTargetYear(int targetYear) {
		this.targetYear = targetYear;
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

	public int getTotalNumber() {
		return totalNumber;
	}

	public void setTotalNumber(int totalNumber) {
		this.totalNumber = totalNumber;
	}

	public String getSubName() {
		return subName;
	}

	public void setSubName(String subName) {
		this.subName = subName;
	}

	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public List<CartDayAndTime> getTimeTables() {
		return timeTables;
	}
	
	public List<String> getTimeTableList() {
		List<String> list = new ArrayList<String>();
		if (timeTables.isEmpty()) {
			return list;
		}
		
		for (CartDayAndTime table : timeTables) {
			StringBuilder sb = new StringBuilder();
			StringJoiner joiner = new StringJoiner(",");
			sb.append(table.getLectDay() + ":");
			
			if (table.getFirstPeriod() != 0) {
				joiner.add(String.valueOf(table.getFirstPeriod()));
			}
			if (table.getSecondPeriod() != 0) {
				joiner.add(String.valueOf(table.getSecondPeriod()));
			}
			if (table.getThirdPeriod() != 0) {
				joiner.add(String.valueOf(table.getThirdPeriod()));
			}
			sb.append(joiner.toString());
			list.add(sb.toString());
		}
		return list;
	}
	
	public void addTimeTables(CartDayAndTime timeTable) {
		timeTables.add(timeTable);
	}

	@Override
	public String toString() {
		return "RegisterListDto [subNo=" + subNo + ", deptNo=" + deptNo + ", credit=" + credit + ", major=" + major
				+ ", targetYear=" + targetYear + ", subName=" + subName + ", lectNo=" + lectNo + ", place=" + place
				+ ", room=" + room + ", totalNumber=" + totalNumber + ", proName=" + proName + ", createDate="
				+ createDate + ", registeredLectNo=" + registeredLectNo + ", existInCart=" + existInCart
				+ ", lectTimeNo=" + lectTimeNo + ", lectDay=" + lectDay + ", firstPeriod=" + firstPeriod
				+ ", secondPeriod=" + secondPeriod + ", thirdPeriod=" + thirdPeriod + ", timeTables=" + timeTables
				+ "]";
	}
	
	
	
}
