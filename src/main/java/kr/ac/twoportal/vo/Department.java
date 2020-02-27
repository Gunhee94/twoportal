package kr.ac.twoportal.vo;

import org.apache.ibatis.type.Alias;

@Alias("Department")
public class Department {

	private int no;
	private String name;
	
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
	@Override
	public String toString() {
		return "Department [no=" + no + ", name=" + name + "]";
	}

	
}
