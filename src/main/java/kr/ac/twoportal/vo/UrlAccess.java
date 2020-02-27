package kr.ac.twoportal.vo;

import org.apache.ibatis.type.Alias;

@Alias("UrlAccess")
public class UrlAccess {

	private int no;
	private int urlNo;
	private String access;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getUrlNo() {
		return urlNo;
	}
	public void setUrlNo(int urlNo) {
		this.urlNo = urlNo;
	}
	public String getAccess() {
		return access;
	}
	public void setAccess(String access) {
		this.access = access;
	}
	@Override
	public String toString() {
		return "UrlAccess [no=" + no + ", urlNo=" + urlNo + ", access=" + access + "]";
	}
	
	
}
