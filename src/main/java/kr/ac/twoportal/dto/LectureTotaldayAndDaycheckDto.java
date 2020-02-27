package kr.ac.twoportal.dto;

import org.apache.ibatis.type.Alias;

@Alias("LectureTotaldayAndDaycheckDto")
public class LectureTotaldayAndDaycheckDto {

	private int lectureListNo;
	private int lectureTotalday;
	private int daycheck;
	
	public LectureTotaldayAndDaycheckDto() {}

	// 출석점수 :  0 이면 30점, 1일이상 25점, 3일이상 20점, 5일이상 15점, 7일이상 10점, 그 외 5 점
	public int daycheckscore() {
		int score = lectureTotalday-daycheck;
		if (score == 0) {
			return 30;
		}
		if (score == 1) {
			return 25;
		}
		if (score >= 2 && score <= 3) {
			return 20;
		}
		if (score >= 4 && score <= 5) {
			return 15;
		}
		if (score >= 6 && score <= 7) {
			return 10;
		}
		return 5;
	}
	
	public int getLectureListNo() {
		return lectureListNo;
	}

	public void setLectureListNo(int lectureListNo) {
		this.lectureListNo = lectureListNo;
	}

	public int getLectureTotalday() {
		return lectureTotalday;
	}

	public void setLectureTotalday(int lectureTotalday) {
		this.lectureTotalday = lectureTotalday;
	}

	public int getDaycheck() {
		return daycheck;
	}

	public void setDaycheck(int daycheck) {
		this.daycheck = daycheck;
	}
	
	
}
