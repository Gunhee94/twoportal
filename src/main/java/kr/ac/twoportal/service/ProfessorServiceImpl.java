package kr.ac.twoportal.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.twoportal.dao.ProfessorDao;
import kr.ac.twoportal.dto.DeptProfessorDto;
import kr.ac.twoportal.dto.DeptStudentDto;
import kr.ac.twoportal.dto.DetailProfessorDto;
import kr.ac.twoportal.vo.Professor;

@Service
public class ProfessorServiceImpl implements ProfessorService{

	@Autowired
	private ProfessorDao professorDao;
	

	@Override
	public List<DeptProfessorDto> getProfessors(Map<String, Object> map) {
		return professorDao.getProfessors(map);
	}
	
	@Override
	public int totalCountProfessors(Map<String, Object> map) {
		return professorDao.totalCountProfessors(map);
	}

	@Override
	public void addProfessor(Professor professor) {
		professorDao.addProfessor(professor);	
	}

	@Override
	public DetailProfessorDto getProfessorDetailInfo(int proNo) {
		DetailProfessorDto detail = professorDao.getProfessorDetailInfo(proNo);
		if(detail.getImageName() == null || detail.getImageName().isEmpty()) {
			String filename= "professor0.jpg";
			detail.setImageName(filename);
		}
		return detail;
	}

	@Override
	public void updateProfessorInfo(Professor professor) {
		professorDao.updateProfessorInfo(professor);
	}

	@Override
	public void deleteProfessor(int proNo) {
		professorDao.deleteProfessor(proNo);
		
	}
	
	// 이건희/////////////////////////////
	@Override
	public DeptProfessorDto getProfessorByProNo(int proNo) {
		return professorDao.getProfessorByProNo(proNo);
	}

	@Override
	public void updateProfessor(Professor professor, int proNo) {
		
		Professor pro = professorDao.getProFessorByNo(proNo);
		
		pro.setPwd(professor.getPwd());
		pro.setEmail(professor.getEmail());
		pro.setImageName(professor.getImageName());
		
		professorDao.updateProfessorInfo(pro);
	}

	@Override
	public Professor getProFessorByNo(int proNo) {
		return professorDao.getProFessorByNo(proNo);
	}

	
	
}
