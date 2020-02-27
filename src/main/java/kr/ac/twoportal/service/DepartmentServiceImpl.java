package kr.ac.twoportal.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.twoportal.dao.DepartmentDao;
import kr.ac.twoportal.vo.Department;

@Service
public class DepartmentServiceImpl implements DepartmentService {

	@Autowired
	private DepartmentDao departmentDao;

	@Override
	public List<Department> getAllDepartment() {
		return departmentDao.getAllDepartment();
	}

	@Override
	public List<Department> getDepartmentByProNo(int proNo) {
		return departmentDao.getDepartmentByProNo(proNo);
	}
	
	
	
	
}
