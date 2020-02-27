package kr.ac.twoportal.vo;

import org.apache.ibatis.type.Alias;

@Alias("GradeResult")
public class GradeResult {

	private int no;
	private int lectureListNo;
	private int score;
	private String rating;
	private int rank;
	private double finalScore;
	
	public String getRate() {
		if (score >= 95) {
			return "A+";
		}
		if (score >= 90) {
			return "A0";
		}
		if (score >= 85) {
			return "B+";
		}
		if (score >= 80) {
			return "B0";
		}
		if (score >= 75) {
			return "C+";
		}
		if (score >= 70) {
			return "C0";
		}
		if (score >= 65) {
			return "D+";
		}
		if (score >= 60) {
			return "D0";
		}
		if (score <= 59) {
			return "F";
		}
		return "";
	}
	
	public double getMyFinalScore() {
		if (score >= 95) {
			return 4.5;
		}
		if (score >= 90) {
			return 4.0;
		}
		if (score >= 85) {
			return 3.5;
		}
		if (score >= 80) {
			return 3.0;
		}
		if (score >= 75) {
			return 2.5;
		}
		if (score >= 70) {
			return 2.0;
		}
		if (score >= 65) {
			return 1.5;
		}
		if (score >= 60) {
			return 1.0;
		}
		if (score <= 59) {
			return 0.0;
		}
		return 0.0;
	} 
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getLectureListNo() {
		return lectureListNo;
	}
	public void setLectureListNo(int lectureListNo) {
		this.lectureListNo = lectureListNo;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getRating() {
		return rating;
	}
	public void setRating(String rating) {
		this.rating = rating;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public double getFinalScore() {
		return finalScore;
	}
	public void setFinalScore(double finalScore) {
		this.finalScore = finalScore;
	}
	@Override
	public String toString() {
		return "GradeResult [no=" + no + ", lectureListNo=" + lectureListNo + ", score=" + score + ", rating=" + rating
				+ ", rank=" + rank + ", finalScore=" + finalScore + "]";
	}
	
	
}
