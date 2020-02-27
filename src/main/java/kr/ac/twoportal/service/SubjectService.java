package kr.ac.twoportal.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import kr.ac.twoportal.dto.LectureAndGradeDto;
import kr.ac.twoportal.dto.LectureListDto;
import kr.ac.twoportal.vo.Criteria;
import kr.ac.twoportal.vo.Lecture;
import kr.ac.twoportal.vo.Subject;

@Transactional
public interface SubjectService {
	
	List<Subject> getSubjectBydeptNo(int deptNo); 
	
	List<LectureListDto> getFiveLectureByProNo(int proNo);

	List<Subject> getSubjectNameBymap (Map<String, Object> map);

}
