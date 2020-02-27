package kr.ac.twoportal.dao;

import java.util.List;
import java.util.Map;

import kr.ac.twoportal.dto.LectureReviewDto;

public interface LectureReviewDao {

	List<LectureReviewDto> getLectureIsReviewBymap(Map<String, Object> map);

	void insertLectureReview(Map<String, Object> map);
	
	List<LectureReviewDto> getSubjectandLectureBymap(Map<String, Object> map);
	
	List<LectureReviewDto> getLectureReviewGroupStuByLectNo (int lectNo);
}
