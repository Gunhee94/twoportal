package kr.ac.twoportal.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("Board")
public class Board {

	private int no;
	private int proNo;
	private int staffNo;
	private int stuNo;
	private String guestNickname;
	private String title;
	private String content;
	private Date createDate;
	private String category;
	private int viewCount;
	private String pwd;
	private String pwdIsInput;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getProNo() {
		return proNo;
	}
	public void setProNo(int proNo) {
		this.proNo = proNo;
	}
	public int getStaffNo() {
		return staffNo;
	}
	public void setStaffNo(int staffNo) {
		this.staffNo = staffNo;
	}
	public int getStuNo() {
		return stuNo;
	}
	public void setStuNo(int stuNo) {
		this.stuNo = stuNo;
	}
	public String getGuestNickname() {
		return guestNickname;
	}
	public void setGuestNickname(String guestNickname) {
		this.guestNickname = guestNickname;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getPwdIsInput() {
		return pwdIsInput;
	}
	public void setPwdIsInput(String pwdIsInput) {
		this.pwdIsInput = pwdIsInput;
	}
	@Override
	public String toString() {
		return "Board [no=" + no + ", proNo=" + proNo + ", staffNo=" + staffNo + ", stuNo=" + stuNo + ", guestNickname="
				+ guestNickname + ", title=" + title + ", content=" + content + ", createDate=" + createDate
				+ ", category=" + category + ", viewCount=" + viewCount + ", pwd=" + pwd + ", pwdIsInput=" + pwdIsInput
				+ "]";
	}
	
	
}
