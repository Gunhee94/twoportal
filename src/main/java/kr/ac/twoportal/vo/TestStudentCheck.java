package kr.ac.twoportal.vo;

import org.apache.ibatis.type.Alias;

@Alias("TestStudentCheck")
public class TestStudentCheck {

	private int no;
	private int stuNo;
	private int testNo;
	private int questionStudentCheck;
	private String correct;
	private int testInfoNo;
	
	public int getTestInfoNo() {
		return testInfoNo;
	}
	public void setTestInfoNo(int testInfoNo) {
		this.testInfoNo = testInfoNo;
	}
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
	public int getTestNo() {
		return testNo;
	}
	public void setTestNo(int testNo) {
		this.testNo = testNo;
	}
	public int getQuestionStudentCheck() {
		return questionStudentCheck;
	}
	public void setQuestionStudentCheck(int questionStudentCheck) {
		this.questionStudentCheck = questionStudentCheck;
	}
	public String getCorrect() {
		return correct;
	}
	public void setCorrect(String correct) {
		this.correct = correct;
	}
	
	@Override
	public String toString() {
		return "TestStudentCheck [no=" + no + ", stuNo=" + stuNo + ", testNo=" + testNo + ", questionStudentCheck="
				+ questionStudentCheck + ", correct=" + correct + ", testInfoNo=" + testInfoNo + "]";
	}
}
