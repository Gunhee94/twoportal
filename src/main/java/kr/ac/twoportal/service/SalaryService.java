package kr.ac.twoportal.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import kr.ac.twoportal.dto.LectureListDto;
import kr.ac.twoportal.dto.SalaryInfoDto;
import kr.ac.twoportal.dto.SalaryProfessorDto;
import kr.ac.twoportal.form.LectureAllowListForm;
import kr.ac.twoportal.vo.Criteria;
import kr.ac.twoportal.vo.Lecture;
import kr.ac.twoportal.vo.Salary;

@Transactional
public interface SalaryService {
	
	List<SalaryProfessorDto> getSalaryByProNo (int proNo);
	
	SalaryProfessorDto getAvgSalaryByProNo(int proNo);
	
	List<Salary> getSalaryByMap(Map<String, Object> map);
	
	List<SalaryInfoDto> salaryInfo();
}
