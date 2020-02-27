package kr.ac.twoportal.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("Scholarship")
public class Scholarship {

	private int no;
	private int stuNo;
	private String isPayment;
	private int price;
	private Date date;
	private int semester;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getStuNo() {
		return stuNo;
	}
	public void setStuNo(int stuNo) {
		this.stuNo = stuNo;
	}
	public String getIsPayment() {
		return isPayment;
	}
	public void setIsPayment(String isPayment) {
		this.isPayment = isPayment;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getSemester() {
		return semester;
	}
	public void setSemester(int semester) {
		this.semester = semester;
	}
	@Override
	public String toString() {
		return "Scholarship [no=" + no + ", stuNo=" + stuNo + ", isPayment=" + isPayment + ", price=" + price
				+ ", date=" + date + ", semester=" + semester + "]";
	}
	
	

}
