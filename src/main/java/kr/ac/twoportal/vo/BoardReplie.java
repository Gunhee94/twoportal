package kr.ac.twoportal.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import kr.ac.twoportal.utils.DateUtils;

@Alias("BoardReplie")
public class BoardReplie {

	private int no;
	private int boardNo;
	private String content;
	private Date createDate;
	private String boardNickName;
	private String boardPassword;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
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
	public String getFormatedCreateDate() {
		if (createDate == null) {
			return "";
		}
		return DateUtils.getYYYYMMDD(createDate);
	}
	public String getBoardNickName() {
		return boardNickName;
	}
	public void setBoardNickName(String boardNickName) {
		this.boardNickName = boardNickName;
	}
	public String getBoardPassword() {
		return boardPassword;
	}
	public void setBoardPassword(String boardPassword) {
		this.boardPassword = boardPassword;
	}
	@Override
	public String toString() {
		return "BoardReplie [no=" + no + ", boardNo=" + boardNo + ", content=" + content + ", createDate=" + createDate
				+ ", boardNickName=" + boardNickName + ", boardPassword=" + boardPassword + "]";
	}
	
	

	
	
	
	
	
}
