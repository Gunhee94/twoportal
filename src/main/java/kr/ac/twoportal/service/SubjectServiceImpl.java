package kr.ac.twoportal.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.twoportal.dao.SubjectDao;
import kr.ac.twoportal.dto.LectureListDto;
import kr.ac.twoportal.vo.Subject;
 

@Service
public class SubjectServiceImpl implements SubjectService {

	@Autowired
	private SubjectDao subjectDao;
	
	@Override
	public List<Subject> getSubjectBydeptNo(int deptNo) {
		return subjectDao.getSubjectBydeptNo(deptNo);
	}

	@Override
	public List<LectureListDto> getFiveLectureByProNo(int proNo) {
		return subjectDao.getFiveLectureByProNo(proNo);
	}

	@Override
	public List<Subject> getSubjectNameBymap(Map<String, Object> map) {
		return subjectDao.getSubjectNameBymap(map);
	}
	

	

		
	
	
	
}
