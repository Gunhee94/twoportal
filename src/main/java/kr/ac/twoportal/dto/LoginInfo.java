package kr.ac.twoportal.dto;

import kr.ac.twoportal.vo.Professor;
import kr.ac.twoportal.vo.Staff;
import kr.ac.twoportal.vo.Student;

public class LoginInfo {
	private String id;
	private String pwd;
	private String job;
	private String name;
	private Student student;
	private Professor professor;
	private Staff staff;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	public Professor getProfessor() {
		return professor;
	}
	public void setProfessor(Professor professor) {
		this.professor = professor;
	}
	public Staff getStaff() {
		return staff;
	}
	public void setStaff(Staff staff) {
		this.staff = staff;
	}
	@Override
	public String toString() {
		return "LoginInfo [id=" + id + ", pwd=" + pwd + ", job=" + job + ", name=" + name + ", student=" + student
				+ ", professor=" + professor + ", staff=" + staff + "]";
	}
	
	
	
	
}
