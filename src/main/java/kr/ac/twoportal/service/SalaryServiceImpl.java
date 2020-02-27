package kr.ac.twoportal.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.twoportal.dao.LectureDao;
import kr.ac.twoportal.dao.LectureTimeDao;
import kr.ac.twoportal.dao.SalaryDao;
import kr.ac.twoportal.dao.SubjectDao;
import kr.ac.twoportal.dto.LectureListDto;
import kr.ac.twoportal.dto.SalaryInfoDto;
import kr.ac.twoportal.dto.SalaryProfessorDto;
import kr.ac.twoportal.form.LectureAllowListForm;
import kr.ac.twoportal.vo.Criteria;
import kr.ac.twoportal.vo.Lecture;
import kr.ac.twoportal.vo.Salary;

@Service
public class SalaryServiceImpl implements SalaryService {

	@Autowired
	private SalaryDao salaryDao;
	
	@Override
	public List<SalaryProfessorDto> getSalaryByProNo(int proNo) {
		return salaryDao.getSalaryByProNo(proNo);
	}
	@Override
	public SalaryProfessorDto getAvgSalaryByProNo(int proNo) {
		return salaryDao.getAvgSalaryByProNo(proNo);
	}
	@Override
	public List<Salary> getSalaryByMap(Map<String, Object> map) {
		return salaryDao.getSalaryByMap(map);
	}
	@Override
	public List<SalaryInfoDto> salaryInfo() {
		return salaryDao.salaryInfo();
	}
	  
	

	
	
}
