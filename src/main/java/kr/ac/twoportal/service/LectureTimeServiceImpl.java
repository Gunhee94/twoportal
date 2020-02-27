package kr.ac.twoportal.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.twoportal.dao.LectureTimeDao;
import kr.ac.twoportal.vo.LectureTime;


@Service
public class LectureTimeServiceImpl implements LectureTimeService{

	@Autowired
	private LectureTimeDao lectureTimeDao;

	@Override
	public LectureTime getLectureTimeOnlyOne(Map<String, Object> map) {
		return lectureTimeDao.getLectureTimeOnlyOne(map);
	}
	
	@Override
	public List<LectureTime> getLectureByPlaceandRoom(Map<String, Object> criteria) {
		return lectureTimeDao.getLectureByPlaceandRoom(criteria);
	}

	


}
