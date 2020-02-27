package kr.ac.twoportal.dto;

public class RegisteredCountDto {

	// 신청과목수/신청학점
	private int subCount;
	private int creditCount;
	
	public int getSubCount() {
		return subCount;
	}
	public void setSubCount(int subCount) {
		this.subCount = subCount;
	}
	public int getCreditCount() {
		return creditCount;
	}
	public void setCreditCount(int creditCount) {
		this.creditCount = creditCount;
	}
	
	@Override
	public String toString() {
		return "RegisteredCountDto [subCount=" + subCount + ", creditCount=" + creditCount + "]";
	}
	
}
