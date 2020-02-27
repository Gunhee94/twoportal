package kr.ac.twoportal.vo;

import org.apache.ibatis.type.Alias;

@Alias("MainCategory")
public class MainCategory {

	private int no;
	private String title;
	private String access;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAccess() {
		return access;
	}
	public void setAccess(String access) {
		this.access = access;
	}
	@Override
	public String toString() {
		return "MainCategory [no=" + no + ", title=" + title + ", access=" + access + "]";
	}
	
	

}
