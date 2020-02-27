package kr.ac.twoportal.dao;

import java.util.List;

import kr.ac.twoportal.dto.LectureTotaldayAndDaycheckDto;
import kr.ac.twoportal.vo.LectureDayCheck;

public interface LectureDayCheckDao {

	void insertDayCheck(int no);

	LectureDayCheck getDuplicateCheck(int listNo);

	LectureDayCheck getDayCheckByLecListNo(int listNo);
	LectureDayCheck getDayCheckByLecListNoAndToday(int listNo);

	// 이건희
	List<LectureTotaldayAndDaycheckDto> getLectureTotaldayAndCountdaycheckByLectNo(int lectNo);
}
