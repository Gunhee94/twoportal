package kr.ac.twoportal.dao;

import java.util.List;
import java.util.Map;

import kr.ac.twoportal.dto.GradeLectureDto;
import kr.ac.twoportal.dto.GradeRankDto;
import kr.ac.twoportal.dto.LectureAndGradeDto;
import kr.ac.twoportal.vo.GradeResult;

public interface GradeResultDao {

	List<LectureAndGradeDto> getAllIsLectureGradeByProNo (int proNo);

	void insertGrade(GradeResult gradeResult);
	
	List<GradeResult> getAllLectureListTestScore();
	
	List<GradeRankDto> getTotalScoreRankByLectNo (int lectNo);
	
	GradeResult getGradeResultByNo (int no);

	void updateGradeResult(GradeResult gradeResult);
	
	List<GradeLectureDto> getGradeResultBycri (Map<String, Object> map);
	
	int getCountGradeResultBycri (Map<String, Object> map);
}
