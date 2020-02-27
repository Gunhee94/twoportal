package kr.ac.twoportal.service;


import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.twoportal.dao.GradeResultDao;
import kr.ac.twoportal.dao.LectureDayCheckDao;
import kr.ac.twoportal.dto.GradeLectureDto;
import kr.ac.twoportal.dto.GradeRankDto;
import kr.ac.twoportal.dto.LectureAndGradeDto;
import kr.ac.twoportal.dto.LectureTotaldayAndDaycheckDto;
import kr.ac.twoportal.vo.GradeResult;


@Service
public class GradeServiceImpl implements GradeService {
	
	@Autowired
	private GradeResultDao gradeResultDao;
	@Autowired
	private LectureDayCheckDao lectureDayCheckDao;
	
	// 강의에 대한 성적나왔는지 교수번호로 조회
	@Override
	public List<LectureAndGradeDto> getAllIsLectureGradeByProNo(int proNo) {
		return gradeResultDao.getAllIsLectureGradeByProNo(proNo);
	}

	@Override
	public void insertGrade(int lectNo) {
		// 출석 점수를 불러오고 
		// 한 강의의 각 학생의 총 강의일수 확인
		List<LectureTotaldayAndDaycheckDto> daychecks = lectureDayCheckDao.getLectureTotaldayAndCountdaycheckByLectNo(lectNo);
		List<GradeResult> grades = gradeResultDao.getAllLectureListTestScore();
		for (LectureTotaldayAndDaycheckDto day : daychecks) {
			for (GradeResult grade : grades) {
				if (day.getLectureListNo() == grade.getLectureListNo()) {
					
					int totalScore = (int) (day.daycheckscore() + grade.getScore()*0.7);
					
					GradeResult gradeResult = new GradeResult();
					gradeResult.setLectureListNo(day.getLectureListNo());
					gradeResult.setScore(totalScore);
					gradeResult.setRating(gradeResult.getRate());
					gradeResult.setFinalScore(gradeResult.getMyFinalScore());
				
					gradeResultDao.insertGrade(gradeResult);
				}
			}
		}
	
		List<GradeRankDto> ranks = gradeResultDao.getTotalScoreRankByLectNo(lectNo);
		for (GradeRankDto rank : ranks) {
			
			GradeResult grade = gradeResultDao.getGradeResultByNo(rank.getGradeNo());
			grade.setRank(rank.getRank());
			gradeResultDao.updateGradeResult(grade);
		}
		
	}

	@Override
	public List<GradeLectureDto> getGradeResultBycri(Map<String, Object> map) {
		return gradeResultDao.getGradeResultBycri(map);
	}

	@Override
	public int getCountGradeResultBycri(Map<String, Object> map) {
		return gradeResultDao.getCountGradeResultBycri(map);
	}
		
	
	
	
}
