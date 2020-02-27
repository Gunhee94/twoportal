package kr.ac.twoportal.dao;

import java.util.List;
import java.util.Map;

import kr.ac.twoportal.vo.LectureTime;

public interface LectureTimeDao {

	LectureTime getLectureTimeOnlyOne(Map<String, Object> map);
	
	List<LectureTime> getLectureByPlaceandRoom(Map<String, Object> criteria);

	void insertLectureTime (LectureTime lectureTime);
	
	void deleteLectureByLectNo (int lectNo);
}
