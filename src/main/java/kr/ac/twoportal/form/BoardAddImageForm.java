package kr.ac.twoportal.form;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;
@Alias("BoardAddImageForm")
public class BoardAddImageForm {
	
	private int proNo;
	private int staffNo;
	private int stuNo;
	private String Nickname;
	private String title;
	private String content;
	private String category;
	private int viewCount;
	private String pwd;
	private List<MultipartFile> BoardImageName;
	
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
	
	public String getNickname() {
		return Nickname;
	}
	public void setNickname(String nickname) {
		Nickname = nickname;
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
	public List<MultipartFile> getBoardImageName() {
		return BoardImageName;
	}
	public void setBoardImageName(List<MultipartFile> boardImageName) {
		BoardImageName = boardImageName;
	}
	@Override
	public String toString() {
		return "BoardAddImageForm [proNo=" + proNo + ", staffNo=" + staffNo + ", stuNo=" + stuNo + ", Nickname="
				+ Nickname + ", title=" + title + ", content=" + content + ", category=" + category + ", viewCount="
				+ viewCount + ", pwd=" + pwd + ", BoardImageName=" + BoardImageName + "]";
	}
	
	
	
}
