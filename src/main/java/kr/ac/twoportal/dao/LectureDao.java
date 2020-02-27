package kr.ac.twoportal.dao;

import java.util.List;
import java.util.Map;

import kr.ac.twoportal.dto.LectureListDto;
import kr.ac.twoportal.dto.ProsessorDayCheckDto;
import kr.ac.twoportal.form.LectureAllowListForm;
import kr.ac.twoportal.vo.Criteria;
import kr.ac.twoportal.vo.Lecture;

import kr.ac.twoportal.dto.LectureandCancelDto;


public interface LectureDao {

	List<LectureListDto> getAllLectureBycri(Map<String, Object> criteria);

	LectureListDto getLectureByLectNo(int lectNo);
	
	List<LectureListDto> getStudentLectureListByLectNo(int lectNo);
	
	List<LectureListDto> getAllLectureapplyByProNo(Map<String, Object> map);
	
	int getCountLectureapplyByProNo (int proNo);
	  
	List<Lecture> getAllLectureByProNo(int proNo);

	List<Lecture> getAllProcessingLectures(int proNo);

	Lecture getLectureByNo(int lecNo);
	
	void insertLecture(Lecture lecture);

	void deleteLectureByNo(int lectNo);
	
	List<LectureListDto> getLectureDayByProNo(Map<String, Object> map);
	
	// 잡 관련 
	void updateLecture (Lecture lecture);
	List<Lecture> getLectureByStatusAndDate();
	List<LectureandCancelDto> getLectureAndCancelStartByStatusAndDate();
	List<LectureandCancelDto> getLectureAndCancelEndByStatusAndDate();
	List<Lecture> getLectureAndTestByStatusAndDate();
	
	//서씨 dao
	List<LectureListDto> allowLectureList ();
	
	void updateAllowLecture (Lecture Lecture);
	
	List<LectureListDto> getLectureTimeByProNo (Map<String, Object> map);
	
}
