package kr.ac.twoportal.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import kr.ac.twoportal.dto.GradeLectureDto;
import kr.ac.twoportal.dto.LectureAndGradeDto;
import kr.ac.twoportal.dto.LectureListDto;
import kr.ac.twoportal.dto.LectureandCancelDto;
import kr.ac.twoportal.vo.Criteria;
import kr.ac.twoportal.vo.Lecture;
import kr.ac.twoportal.vo.LectureCancel;

@Transactional
public interface LectureCancelService {
	
	List<LectureandCancelDto> getLectureCancelByProNo(int proNo);

	void deleteLectureCancel(int cancelNo);

	void insertLectureCancel (LectureCancel lectureCancel);

	List<LectureandCancelDto> getLectureCancelwhereRespNull ();

	void updateLectureCancel (LectureCancel lectureCancel);

	LectureCancel getLectureCancelByNo(int lectCancellNo);

}
