package kr.ac.twoportal.vo;

import org.apache.ibatis.type.Alias;

@Alias("BoardImage")
public class BoardImage {

	private int no;
	private String name;
	private int boardNo;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	@Override
	public String toString() {
		return "BoardImage [no=" + no + ", name=" + name + ", boardNo=" + boardNo + "]";
	}
	
	
}
