package kr.ac.twoportal.service;

import org.springframework.transaction.annotation.Transactional;

import kr.ac.twoportal.form.LectureAddForm;

@Transactional
public interface LectureAddService {
	
	void addLecture (LectureAddForm form, int proNo);
	
}
