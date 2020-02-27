package kr.ac.twoportal.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import kr.ac.twoportal.dto.DeptStudentDto;
import kr.ac.twoportal.vo.Criteria;
import kr.ac.twoportal.vo.Student;

@Transactional
public interface StudentService {
	void addOneStudent(Student student);

	void addStudents(List<Student> students);
	
	List<Student> getAllStudent();
	
	DeptStudentDto getStudentJoinDeptByNo(int no);
	
	List<DeptStudentDto> getAllStudentByCri(Map<String, Object> criteria);
	
	int countStudentPage (Map<String, Object> map);
	
	List<Student> selectStudentPage (Criteria criteria);

	void updateStudentInfo(Student student);
	
	void deleteStudent (int no);
}
