package kr.ac.twoportal.dao;

import java.util.List;
import java.util.Map;

import kr.ac.twoportal.dto.SalaryInfoDto;
import kr.ac.twoportal.dto.SalaryProfessorDto;
import kr.ac.twoportal.vo.Salary;

public interface SalaryDao {

	List<SalaryProfessorDto> getSalaryByProNo (int proNo);
	
	SalaryProfessorDto getAvgSalaryByProNo(int proNo);
	
	List<Salary> getSalaryByMap(Map<String, Object> map);
	
	List<SalaryInfoDto> salaryInfo();
}
