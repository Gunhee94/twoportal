package kr.ac.twoportal.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("LectureDayCheck")
public class LectureDayCheck {

	private int no;
	private int listNo;
	private Date createDate;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getListNo() {
		return listNo;
	}
	public void setListNo(int listNo) {
		this.listNo = listNo;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	@Override
	public String toString() {
		return "LectureDayCheck [no=" + no + ", listNo=" + listNo + ", createDate=" + createDate + "]";
	}
	
	
	
	
}
