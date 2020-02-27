package kr.ac.twoportal.dto;

import org.apache.ibatis.type.Alias;

@Alias("GradeRankDto")
public class GradeRankDto {

	private int lectNo;
	private int lectureListNo;
	private int totalscore;
	private int rank;
	private int gradeNo;
	
	public GradeRankDto () {}

	
	public int getGradeNo() {
		return gradeNo;
	}

	public void setGradeNo(int gradeNo) {
		this.gradeNo = gradeNo;
	}

	public int getLectNo() {
		return lectNo;
	}

	public void setLectNo(int lectNo) {
		this.lectNo = lectNo;
	}

	public int getLectureListNo() {
		return lectureListNo;
	}

	public void setLectureListNo(int lectureListNo) {
		this.lectureListNo = lectureListNo;
	}

	public int getTotalscore() {
		return totalscore;
	}

	public void setTotalscore(int totalscore) {
		this.totalscore = totalscore;
	}

	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}
	
	
}
