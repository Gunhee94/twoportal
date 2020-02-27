package kr.ac.twoportal.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.twoportal.dao.LectureDao;
import kr.ac.twoportal.dao.LectureTimeDao;
import kr.ac.twoportal.dao.SubjectDao;
import kr.ac.twoportal.dto.LectureListDto;
import kr.ac.twoportal.form.LectureAllowListForm;
import kr.ac.twoportal.vo.Criteria;
import kr.ac.twoportal.vo.Lecture;

@Service
public class LectureServiceImpl implements LectureService {

	@Autowired
	private LectureDao lectureDao;
	@Autowired
	private LectureTimeDao lectTimeDao;
	@Autowired
	private SubjectDao subjectDao;
	  
	@Override
	public List<LectureListDto> getAllLectureBycri(Map<String, Object> criteria) {
		return lectureDao.getAllLectureBycri(criteria);
	}  

	@Override
	public LectureListDto getLectureByLectNo(int lectNo) {
		return lectureDao.getLectureByLectNo(lectNo);
	}
	
	@Override
	public List<LectureListDto> getStudentLectureListByLectNo(int lectNo) {
		return lectureDao.getStudentLectureListByLectNo(lectNo);
	}
	
	@Override
	public List<LectureListDto> getAllLectureapplyByProNo(Map<String, Object> map) {
		return lectureDao.getAllLectureapplyByProNo(map);
	}

	@Override
	public int getCountLectureapplyByProNo(int proNo) {
		return lectureDao.getCountLectureapplyByProNo(proNo);
	}
	
	@Override
	public List<Lecture> getAllLectureByProNo(int proNo) {
		return lectureDao.getAllLectureByProNo(proNo);
	}

	@Override
	public void deleteLectureByNo(int lectNo) {
	
		Lecture lecture = lectureDao.getLectureByNo(lectNo);
		
		int subNo = lecture.getSubjectNo();
		
		lectTimeDao.deleteLectureByLectNo(lectNo);
		
		lectureDao.deleteLectureByNo(lectNo);
		
		subjectDao.deleteSubjectBySubNo(subNo);
	}

	@Override
	public List<LectureListDto> allowLectureList() {
		return lectureDao.allowLectureList();
	}

	@Override
	public void updateAllowLecture(Lecture Lecture) {
		lectureDao.updateAllowLecture(Lecture);	
	}

	@Override
	public List<LectureListDto> getLectureTimeByProNo(Map<String, Object> map) {
		return lectureDao.getLectureTimeByProNo(map);
	}

	@Override
	public List<LectureListDto> getLectureDayByProNo(Map<String, Object> map) {
		return lectureDao.getLectureDayByProNo(map);
	}


	
	
}
