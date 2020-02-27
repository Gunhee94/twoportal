package kr.ac.twoportal.dao;

import java.util.List;

import kr.ac.twoportal.vo.Department;

public interface DepartmentDao {

	List<Department> getAllDepartment();

	Department getDepartmentByNo(int deptNo);
	
	List<Department> getDepartmentByProNo (int proNo); 
}
