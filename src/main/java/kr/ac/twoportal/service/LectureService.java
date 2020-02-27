package kr.ac.twoportal.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import kr.ac.twoportal.dto.LectureListDto;
import kr.ac.twoportal.form.LectureAllowListForm;
import kr.ac.twoportal.vo.Criteria;
import kr.ac.twoportal.vo.Lecture;

@Transactional
public interface LectureService {
	
	List<LectureListDto> getAllLectureBycri(Map<String, Object> criteria);

	LectureListDto getLectureByLectNo (int lectNo);
	
	List<LectureListDto> getStudentLectureListByLectNo(int lectNo);
	
	List<LectureListDto> getAllLectureapplyByProNo(Map<String, Object> map);
	
	int getCountLectureapplyByProNo (int proNo);
	
	List<Lecture> getAllLectureByProNo(int proNo);
	
	void deleteLectureByNo(int lectNo);
	
	List<LectureListDto> allowLectureList ();
	
	void updateAllowLecture (Lecture Lecture);

	List<LectureListDto> getLectureTimeByProNo (Map<String, Object> map);

	List<LectureListDto> getLectureDayByProNo(Map<String, Object> map);

}
