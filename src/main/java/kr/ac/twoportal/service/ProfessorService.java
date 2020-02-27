package kr.ac.twoportal.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import kr.ac.twoportal.dto.DeptProfessorDto;
import kr.ac.twoportal.dto.DetailProfessorDto;
import kr.ac.twoportal.vo.Professor;

@Transactional
public interface ProfessorService {
	
	List<DeptProfessorDto> getProfessors (Map<String, Object> map);
	
	int totalCountProfessors(Map<String, Object> map);
	
	void addProfessor(Professor professor);
	
	DetailProfessorDto getProfessorDetailInfo(int proNo);
	
	void updateProfessorInfo (Professor professor);
	
	void deleteProfessor (int proNo);
	
	Professor getProFessorByNo(int proNo);
	
	// 이건희 
	DeptProfessorDto getProfessorByProNo (int proNo);

	void updateProfessor(Professor professor, int proNo);
}
