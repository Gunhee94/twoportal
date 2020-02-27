package kr.ac.twoportal.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.twoportal.dao.LectureDao;
import kr.ac.twoportal.dao.LectureReviewDao;
import kr.ac.twoportal.dto.LectureListDto;
import kr.ac.twoportal.dto.LectureReviewDto;
import kr.ac.twoportal.vo.Criteria;
import kr.ac.twoportal.vo.Lecture;

@Service
public class LectureReviewServiceImpl implements LectureReviewService {

	@Autowired
	private LectureReviewDao lectureReviewDao;

	@Override
	public List<LectureReviewDto> getLectureIsReviewBymap(Map<String, Object> map) {
		return lectureReviewDao.getLectureIsReviewBymap(map);
	}

	@Override
	public void insertReview(Map<String, Object> map) {
		lectureReviewDao.insertLectureReview(map);
	}

	@Override
	public List<LectureReviewDto> getSubjectandLectureBymap(Map<String, Object> map) {
		return lectureReviewDao.getSubjectandLectureBymap(map);
	}

	@Override
	public List<LectureReviewDto> getLectureReviewGroupStuByLectNo(int lectNo) {
		return lectureReviewDao.getLectureReviewGroupStuByLectNo(lectNo);
	}
	  



	
	
}
