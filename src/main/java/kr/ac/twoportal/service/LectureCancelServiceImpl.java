package kr.ac.twoportal.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.twoportal.dao.LectureCancelDao;
import kr.ac.twoportal.dto.LectureandCancelDto;
import kr.ac.twoportal.vo.LectureCancel;

@Service
public class LectureCancelServiceImpl implements LectureCancelService {
	
	@Autowired
	private LectureCancelDao lectureCancelDao;

	@Override
	public List<LectureandCancelDto> getLectureCancelByProNo(int proNo) {
		return lectureCancelDao.getLectureCancelByProNo(proNo);
	}

	@Override
	public void deleteLectureCancel(int cancelNo) {
		lectureCancelDao.deleteLectureCancel(cancelNo);
	}

	@Override
	public void insertLectureCancel(LectureCancel lectureCancel) {
		lectureCancelDao.insertLectureCancel(lectureCancel);
	}

	@Override
	public List<LectureandCancelDto> getLectureCancelwhereRespNull() {
		return lectureCancelDao.getLectureCancelwhereRespNull();
	}

	@Override
	public void updateLectureCancel(LectureCancel lectureCancel) {
		lectureCancelDao.updateLectureCancel(lectureCancel);
	}

	@Override
	public LectureCancel getLectureCancelByNo(int lectCancellNo) {
		return lectureCancelDao.getLectureCancelByNo(lectCancellNo);
	}
	
	
	
		
	
	
	
}
