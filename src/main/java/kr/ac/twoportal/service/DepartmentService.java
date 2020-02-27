package kr.ac.twoportal.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import kr.ac.twoportal.vo.Department;

@Transactional
public interface DepartmentService {
	
	List<Department> getAllDepartment();
	
	List<Department> getDepartmentByProNo (int proNo); 
}
