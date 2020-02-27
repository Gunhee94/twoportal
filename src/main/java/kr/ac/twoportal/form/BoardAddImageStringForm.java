package kr.ac.twoportal.form;

import java.util.List;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;
@Alias("BoardAddImageStringForm")
public class BoardAddImageStringForm {
	private int no;
	private int proNo;
	private int staffNo;
	private int stuNo;
	private String Nickname;
	private String title;
	private String content;
	private String createDate;
	private String category;
	private int viewCount;
	private int BoardimageNo;
	private String BoardImageName;
	
	
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
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
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
	public int getBoardimageNo() {
		return BoardimageNo;
	}
	public void setBoardimageNo(int boardimageNo) {
		BoardimageNo = boardimageNo;
	}
	public String getBoardImageName() {
		return BoardImageName;
	}
	public void setBoardImageName(String boardImageName) {
		BoardImageName = boardImageName;
	}
	@Override
	public String toString() {
		return "BoardAddImageStringForm [no=" + no + ", proNo=" + proNo + ", staffNo=" + staffNo + ", stuNo=" + stuNo
				+ ", Nickname=" + Nickname + ", title=" + title + ", content=" + content + ", createDate=" + createDate
				+ ", category=" + category + ", viewCount=" + viewCount + ", BoardimageNo=" + BoardimageNo
				+ ", BoardImageName=" + BoardImageName + "]";
	}
	
	
	
}
