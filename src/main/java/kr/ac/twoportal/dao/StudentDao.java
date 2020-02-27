package kr.ac.twoportal.dao;

import java.util.List;
import java.util.Map;

import kr.ac.twoportal.dto.DeptStudentDto;
import kr.ac.twoportal.dto.StudentMypageDto;
import kr.ac.twoportal.vo.Criteria;
import kr.ac.twoportal.vo.Student;

public interface StudentDao {
	
	//학생 아디로 학생 찾기
	Student getStudentById(String id);
	//학생 한명 추가
	void addOneStudent(Student student);
	//학생 전체 조회
	List<Student> getAllStudent();

	//학생 한명 가져옴
	DeptStudentDto getStudentJoinDeptByNo(int stuNo);

	//고유 번호로 학생 찾기
	Student getStudentByNo(int no);
	
	//학년,학과,년도 이름으로 학생 찾기
	List<DeptStudentDto> getAllStudentByCri(Map<String, Object> criteria);
	
	int countStudentPage (Map<String, Object> map);


	//오늘 출석안된 학생들
	List<Student> getNotDayCheckedStudents(int lecNo);
	//오늘 출석한 학생들 
	List<Student> getDayCheckedStudents(int lecNo);


	List<Student> selectStudentPage (Criteria criteria);
	
	void updateStudentInfo(Student student);

	void deleteStudent (int no);
	//학생 마이페이지 폼 정보 조회
	StudentMypageDto getMyPageForm(int stuNo);
	void updateStudentMypageForm(Student student);
	
}
