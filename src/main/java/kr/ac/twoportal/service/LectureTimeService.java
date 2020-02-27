package kr.ac.twoportal.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import kr.ac.twoportal.vo.LectureTime;

@Transactional
public interface LectureTimeService {

	LectureTime getLectureTimeOnlyOne(Map<String, Object> map);

	List<LectureTime> getLectureByPlaceandRoom(Map<String, Object> criteria);

}
