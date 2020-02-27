package kr.ac.twoportal.vo;

import org.apache.ibatis.type.Alias;

@Alias("TestResult")
public class TestResult {

	private int no;
	private int stuNo;
	private int infoNo;
	private int score;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getStuNo() {
		return stuNo;
	}
	public void setStuNo(int stuNo) {
		this.stuNo = stuNo;
	}
	public int getInfoNo() {
		return infoNo;
	}
	public void setInfoNo(int infoNo) {
		this.infoNo = infoNo;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	@Override
	public String toString() {
		return "TestResult [no=" + no + ", stuNo=" + stuNo + ", infoNo=" + infoNo + ", score=" + score + "]";
	}
	
	
	
}
