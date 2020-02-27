package kr.ac.twoportal.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.twoportal.dao.LectureDao;
import kr.ac.twoportal.dao.LectureTimeDao;
import kr.ac.twoportal.dao.SubjectDao;
import kr.ac.twoportal.form.LectureAddForm;
import kr.ac.twoportal.utils.DateUtils;
import kr.ac.twoportal.vo.Lecture;
import kr.ac.twoportal.vo.LectureTime;
import kr.ac.twoportal.vo.Subject;

@Service
public class LectureAddServiceImpl implements LectureAddService {
	
	@Autowired
	private SubjectDao subjectDao;
	@Autowired
	private LectureDao lectureDao;
	@Autowired
	private LectureTimeDao lectureTimeDao;
	
	public void addLecture (LectureAddForm form, int proNo) {
		
		Subject subject = new Subject();
		subject.setDeptNo(form.getDepartment());
		subject.setName(form.getSubname());
		
		String credits = form.getCredit();  // 전공
		int credit = 0;			
		if (credits.equals("전공")) {
			credit = 3;		// 전공일때 학점
		} else {	
			credit = 2;		// 전공 아니면 학점
		}
		subject.setCredit(credit);
		subject.setMajor(credits);
		subject.setObject(form.getObject());
		subject.setTargetYear(form.getTargetYear());
		
		subjectDao.insertSubject(subject);
		
		Lecture lecture = new Lecture();
		lecture.setSubjectNo(subject.getNo());
		lecture.setProNo(proNo);
		lecture.setCreateDate(form.getDate());
		
		Date semester = form.getDate();
		String month = DateUtils.getMonth(semester);
		int monthInt = Integer.parseInt(month);
		double bungi =  Math.ceil(monthInt/6)+1;
		int bungii = (int) bungi;
		
		String sem = String.valueOf(bungii);
		lecture.setSemester(sem);
		
		lecture.setPlace(form.getPlace());
		lecture.setRoom(form.getRoom());
		
		lectureDao.insertLecture(lecture);
		
		LectureTime lectureTime = new LectureTime();
		
		String[] dayandPeriod = form.getDayandPeriodArr();
	
		for (String arr : dayandPeriod) {
			lectureTime.setLectNo(lecture.getNo());
			
			String[] dayandPeriodArr = arr.split("/");
		
			switch (dayandPeriodArr.length) {
				case 4:
					lectureTime.setThirdPeriod(Integer.parseInt(dayandPeriodArr[3]));
				case 3:
					lectureTime.setSecondPeriod(Integer.parseInt(dayandPeriodArr[2]));
				case 2:
					lectureTime.setFirstPeriod(Integer.parseInt(dayandPeriodArr[1]));
				case 1:
					lectureTime.setDay(dayandPeriodArr[0]);
			}
			lectureTimeDao.insertLectureTime(lectureTime);
		}
	}
		
	
	
	
}
