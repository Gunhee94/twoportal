package kr.ac.twoportal.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import kr.ac.twoportal.dto.GradeLectureDto;
import kr.ac.twoportal.dto.LectureAndGradeDto;
import kr.ac.twoportal.dto.LectureListDto;
import kr.ac.twoportal.vo.Criteria;
import kr.ac.twoportal.vo.Lecture;

@Transactional
public interface GradeService {
	
	List<LectureAndGradeDto> getAllIsLectureGradeByProNo (int proNo);

	void insertGrade(int lectNo);
	
	List<GradeLectureDto> getGradeResultBycri (Map<String, Object> map);

	int getCountGradeResultBycri (Map<String, Object> map);
}
