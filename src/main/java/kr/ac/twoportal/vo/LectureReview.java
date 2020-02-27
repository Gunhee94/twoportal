package kr.ac.twoportal.vo;

import org.apache.ibatis.type.Alias;

@Alias("LectureReview")
public class LectureReview {

	private int no;
	private int totalScore;
	private int listNo;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getTotalScore() {
		return totalScore;
	}
	public void setTotalScore(int totalScore) {
		this.totalScore = totalScore;
	}
	public int getListNo() {
		return listNo;
	}
	public void setListNo(int listNo) {
		this.listNo = listNo;
	}
	@Override
	public String toString() {
		return "LectureReview [no=" + no + ", totalScore=" + totalScore + ", listNo=" + listNo + "]";
	}
	
	
	
}
