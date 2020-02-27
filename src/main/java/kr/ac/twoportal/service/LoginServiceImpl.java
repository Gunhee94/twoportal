package kr.ac.twoportal.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.twoportal.dao.ProfessorDao;
import kr.ac.twoportal.dao.StaffDao;
import kr.ac.twoportal.dao.StudentDao;
import kr.ac.twoportal.dto.LoginInfo;
import kr.ac.twoportal.vo.Professor;
import kr.ac.twoportal.vo.Staff;
import kr.ac.twoportal.vo.Student;

@Service
public class LoginServiceImpl implements LoginService  {
	
	@Autowired
	private StudentDao studentDao; 
	@Autowired
	private StaffDao staffDao;
	@Autowired
	private ProfessorDao professorDao;
	
	@Override
	public LoginInfo getLoginCheck(LoginInfo loginInfo) {
		LoginInfo loginInfoCheck = new LoginInfo();
		
		if("student".equals(loginInfo.getJob())) {
			Student student =  studentDao.getStudentById(loginInfo.getId());
			loginInfoCheck.setName(student.getName());
			loginInfoCheck.setPwd(student.getPwd());
			loginInfoCheck.setJob("student");
			loginInfoCheck.setStudent(student);

		} else if("professor".equals(loginInfo.getJob())) {
			Professor professor = professorDao.getProFessorById(loginInfo.getId());
			loginInfoCheck.setName(professor.getName());
			loginInfoCheck.setPwd(professor.getPwd());
			loginInfoCheck.setJob("professor");
			loginInfoCheck.setProfessor(professor);
			
		} else if("staff".equals(loginInfo.getJob())) {
			Staff staff = staffDao.getStaffById(loginInfo.getId());
			loginInfoCheck.setName(staff.getName());
			loginInfoCheck.setPwd(staff.getPwd());
			loginInfoCheck.setJob("staff");
			loginInfoCheck.setStaff(staff);;
		}
		return loginInfoCheck;
	}


		
}


