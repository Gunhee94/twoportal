package kr.ac.twoportal.dto;

import org.apache.ibatis.type.Alias;

@Alias("SubNoAndLectTimeNo")
public class SubNoAndLectTimeNo {

	private int subNo;
	private int lectTimeNo;
	
	public int getSubNo() {
		return subNo;
	}
	public void setSubNo(int subNo) {
		this.subNo = subNo;
	}
	
	
	public int getLectTimeNo() {
		return lectTimeNo;
	}
	public void setLectTimeNo(int lectTimeNo) {
		this.lectTimeNo = lectTimeNo;
	}
	@Override
	public String toString() {
		return "SubNoAndLectTimeNo [subNo=" + subNo + ", lectTimeNo=" + lectTimeNo + "]";
	}


}
