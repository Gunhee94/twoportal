package kr.ac.twoportal.vo;

import org.apache.ibatis.type.Alias;

@Alias("Subject")
public class Subject {

	private int no;
	private int deptNo;
	private String name;
	private int credit;
	private String major;
	private String object;
	private int targetYear;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getDeptNo() {
		return deptNo;
	}
	public void setDeptNo(int deptNo) {
		this.deptNo = deptNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public String getObject() {
		return object;
	}
	public void setObject(String object) {
		this.object = object;
	}
	public int getTargetYear() {
		return targetYear;
	}
	public void setTargetYear(int targetYear) {
		this.targetYear = targetYear;
	}
	
	@Override
	public String toString() {
		return "Subject [no=" + no + ", deptNo=" + deptNo + ", name=" + name + ", credit=" + credit + ", major=" + major
				+ ", object=" + object + ", targetYear=" + targetYear + "]";
	}
	
	
}
