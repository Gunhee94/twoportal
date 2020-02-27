package kr.ac.twoportal.vo;

import org.apache.ibatis.type.Alias;

@Alias("TestQuestion")
public class TestQuestion {

	private int testNo;
	private int infoNo;
	private int no;
	private String content;
	private int scoring;
	private String firstQuestion;
	private String secondQuestion;
	private String thirdQuestion;
	private String forthQuestion;
	private String fifthQuestion;
	private String answer;
	public int getTestNo() {
		return testNo;
	}
	public void setTestNo(int testNo) {
		this.testNo = testNo;
	}
	public int getInfoNo() {
		return infoNo;
	}
	public void setInfoNo(int infoNo) {
		this.infoNo = infoNo;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getScoring() {
		return scoring;
	}
	public void setScoring(int scoring) {
		this.scoring = scoring;
	}
	public String getFirstQuestion() {
		return firstQuestion;
	}
	public void setFirstQuestion(String firstQuestion) {
		this.firstQuestion = firstQuestion;
	}
	public String getSecondQuestion() {
		return secondQuestion;
	}
	public void setSecondQuestion(String secondQuestion) {
		this.secondQuestion = secondQuestion;
	}
	public String getThirdQuestion() {
		return thirdQuestion;
	}
	public void setThirdQuestion(String thirdQuestion) {
		this.thirdQuestion = thirdQuestion;
	}
	public String getForthQuestion() {
		return forthQuestion;
	}
	public void setForthQuestion(String forthQuestion) {
		this.forthQuestion = forthQuestion;
	}
	public String getFifthQuestion() {
		return fifthQuestion;
	}
	public void setFifthQuestion(String fifthQuestion) {
		this.fifthQuestion = fifthQuestion;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	@Override
	public String toString() {
		return "TestQuestion [testNo=" + testNo + ", infoNo=" + infoNo + ", no=" + no + ", content=" + content
				+ ", scoring=" + scoring + ", firstQuestion=" + firstQuestion + ", secondQuestion=" + secondQuestion
				+ ", thirdQuestion=" + thirdQuestion + ", forthQuestion=" + forthQuestion + ", fifthQuestion="
				+ fifthQuestion + ", answer=" + answer + "]";
	}
	
	
	
}
