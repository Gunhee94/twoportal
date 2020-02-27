package kr.ac.twoportal.dao;

import java.util.List;

import kr.ac.twoportal.dto.LectureandCancelDto;
import kr.ac.twoportal.vo.LectureCancel;

public interface LectureCancelDao {

	// 잡관련
	LectureCancel getLectureCancelByNo(int lectCancellNo);
	void updateLectureCancel (LectureCancel lectureCancel);
	
	List<LectureandCancelDto> getLectureCancelByProNo(int proNo);

	void insertLectureCancel (LectureCancel lectureCancel);
	
	void deleteLectureCancel(int cancelNo);
	
	List<LectureandCancelDto> getLectureCancelwhereRespNull ();
}
