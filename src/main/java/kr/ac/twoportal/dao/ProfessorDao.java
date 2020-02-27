package kr.ac.twoportal.dao;

import java.util.List;
import java.util.Map;

import kr.ac.twoportal.dto.DeptProfessorDto;
import kr.ac.twoportal.dto.DetailProfessorDto;
import kr.ac.twoportal.vo.Professor;

public interface ProfessorDao {

	Professor getProFessorById(String id);

	Professor getProFessorByNo(int proNo);

	List<DeptProfessorDto> getProfessors (Map<String, Object> map);
	
	int totalCountProfessors(Map<String, Object> map);
	
	void addProfessor(Professor professor);
	
	DetailProfessorDto getProfessorDetailInfo(int proNo);
	
	void updateProfessorInfo (Professor professor);
	
	void deleteProfessor (int proNo);
	
	
	
	///////////이건희 
	DeptProfessorDto getProfessorByProNo (int proNo);
}
