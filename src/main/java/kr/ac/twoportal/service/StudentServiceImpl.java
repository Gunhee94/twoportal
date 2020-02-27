package kr.ac.twoportal.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.twoportal.dao.StudentDao;
import kr.ac.twoportal.dto.DeptStudentDto;
import kr.ac.twoportal.vo.Criteria;
import kr.ac.twoportal.vo.Student;

@Service
public class StudentServiceImpl implements StudentService{

	@Autowired
	private StudentDao studentDao;
	
	@Override
	public void addOneStudent(Student student) {
		System.out.println(student);
		studentDao.addOneStudent(student);
	}

	@Override
	public void addStudents(List<Student> students) {
		for(Student s : students) {
			studentDao.addOneStudent(s);
		}
		
	}

	@Override
	public List<Student> getAllStudent() {
		return studentDao.getAllStudent();
	}

	@Override
	public DeptStudentDto getStudentJoinDeptByNo(int no) {
		DeptStudentDto dept = studentDao.getStudentJoinDeptByNo(no);
		if(dept.getImageName() == null || dept.getImageName().isEmpty()) {
			String filename= "student0.jpg";
			dept.setImageName(filename);
		}
		return dept;
	}

	@Override
	public List<DeptStudentDto> getAllStudentByCri(Map<String, Object> criteria) {
		
		return studentDao.getAllStudentByCri(criteria);
	}


	@Override
	public int countStudentPage(Map<String, Object> map) {
		return studentDao.countStudentPage(map);
	}

	@Override
	public List<Student> selectStudentPage(Criteria criteria) {
		return studentDao.selectStudentPage(criteria);
	}

	@Override
	public void updateStudentInfo(Student student) {
		studentDao.updateStudentInfo(student);
	}

	@Override
	public void deleteStudent(int no) {
		studentDao.deleteStudent(no);
	}

}
