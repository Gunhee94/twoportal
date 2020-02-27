package kr.ac.twoportal.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.twoportal.dao.LectureDao;
import kr.ac.twoportal.dao.LectureDayCheckDao;
import kr.ac.twoportal.dao.LectureListDao;
import kr.ac.twoportal.dao.LectureTimeDao;
import kr.ac.twoportal.dao.ProfessorDao;
import kr.ac.twoportal.dao.StudentDao;
import kr.ac.twoportal.dao.SubjectDao;
import kr.ac.twoportal.dto.ProsessorDayCheckDto;
import kr.ac.twoportal.utils.DateUtils;
import kr.ac.twoportal.utils.LectureTimeUtils;
import kr.ac.twoportal.vo.Lecture;
import kr.ac.twoportal.vo.LectureDayCheck;
import kr.ac.twoportal.vo.LectureList;
import kr.ac.twoportal.vo.LectureTime;
import kr.ac.twoportal.vo.Professor;
import kr.ac.twoportal.vo.Student;
import kr.ac.twoportal.vo.Subject;

@Service
public class DayCheckServiceImpl implements DayCheckService{


	@Autowired
	private LectureListDao lectureListDao;
	@Autowired
	private LectureDayCheckDao lectureDayCheckDao;
	@Autowired
	private LectureTimeDao lectureTimeDao;
	@Autowired 
	private LectureDao lectureDao;
	@Autowired
	private SubjectDao subjectDao;
	@Autowired
	private StudentDao stuentDao; 
	@Autowired
	private ProfessorDao professorDao;
	
	@Override
	public int professorDayChecking(int proNo) {

		List<Lecture> lectures = lectureDao.getAllProcessingLectures(proNo);
		System.out.println("렉쳐"+lectures);
		int periodTime = LectureTimeUtils.getPeriodTime();
		String today = LectureTimeUtils.getToday();
		
		//현재시간에 해당교수가 하는 강좌가 존재하는지와 시간이 맞는지
		int findLecNo = 0;
		
		for(Lecture lecture : lectures) {
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("lectNo", lecture.getNo());
			map.put("periodTime", periodTime);
			map.put("today", today);
			
			LectureTime lectureTimeOnlyOne = lectureTimeDao.getLectureTimeOnlyOne(map);
			System.out.println("찾은 강의"+lectureTimeOnlyOne);
			//찾으면 브레이크
			if(null != lectureTimeOnlyOne) {
				findLecNo = lectureTimeOnlyOne.getLectNo();
				break;
			}
		}

		return findLecNo;
	}
	
	@Override
	public ProsessorDayCheckDto getProDayCheckDto(int lecNo) {
		
		Lecture lecture = lectureDao.getLectureByNo(lecNo);
		Subject subject = subjectDao.getSubjectByNo(lecture.getSubjectNo());
		Professor professor = professorDao.getProFessorByNo(lecture.getProNo());
		
		ProsessorDayCheckDto dto = new ProsessorDayCheckDto();
		dto.setSubjectName(subject.getName());
		dto.setPlace(lecture.getPlace());
		dto.setProName(professor.getName());
		dto.setToday(DateUtils.getYYYYMMDD(new Date()));
		
		return dto;
	}
	
	@Override
	public List<Student> getDayCheckedStudents(int lecNo) {
		return stuentDao.getDayCheckedStudents(lecNo);
	}
	
	@Override
	public List<Student> getNotDayCheckdStudents(int lecNo) {
		return	stuentDao.getNotDayCheckedStudents(lecNo);
	}
	
	
	@Override
	public boolean studentDayChecking(LectureList lectureList) {

		Map<String,Object> map = new HashMap<String, Object>();
		map.put("lectNo", lectureList.getLectNo());
		map.put("today", LectureTimeUtils.getToday());
		map.put("periodTime", LectureTimeUtils.getPeriodTime());

		LectureTime lectureTime = lectureTimeDao.getLectureTimeOnlyOne(map);
		LectureList findLectureList = lectureListDao.getLectureListBylectstuNos(lectureList);

		if(null == lectureTime || null == findLectureList ) {
			return false;
		}

		boolean isDuplicate =  dayCheckDuplicateCheck(findLectureList.getNo());
		if(isDuplicate) {
			return false;
		}

		lectureDayCheckDao.insertDayCheck(findLectureList.getNo());
		return true;
	}

	@Override
	public boolean dayCheckDuplicateCheck(int listNo) {
		LectureDayCheck result = lectureDayCheckDao.getDuplicateCheck(listNo);
		if(null == result) {
			return false;
		}
		return true;
	}
}
