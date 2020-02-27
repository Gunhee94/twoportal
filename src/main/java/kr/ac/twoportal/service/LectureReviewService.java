package kr.ac.twoportal.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import kr.ac.twoportal.dto.LectureListDto;
import kr.ac.twoportal.dto.LectureReviewDto;
import kr.ac.twoportal.vo.Criteria;
import kr.ac.twoportal.vo.Lecture;

@Transactional
public interface LectureReviewService {
	
	List<LectureReviewDto> getLectureIsReviewBymap(Map<String, Object> map);

	void insertReview(Map<String, Object> map);

	List<LectureReviewDto> getSubjectandLectureBymap(Map<String, Object> map);

	List<LectureReviewDto> getLectureReviewGroupStuByLectNo (int lectNo);
}
