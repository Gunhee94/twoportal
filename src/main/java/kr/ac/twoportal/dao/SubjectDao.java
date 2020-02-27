package kr.ac.twoportal.dao;

import java.util.List;
import java.util.Map;

import kr.ac.twoportal.dto.LectureListDto;
import kr.ac.twoportal.vo.Subject;

public interface SubjectDao {

	Subject getSubjectByNo(int subjectNo);
	
	void insertSubject(Subject subject);
	
	void deleteSubjectBySubNo (int subNo);

	List<Subject> getSubjectBydeptNo(int deptNo); 
	
	List<Subject> getSubjectNameBymap (Map<String, Object> map);
	
	List<LectureListDto> getFiveLectureByProNo(int proNo);
}
