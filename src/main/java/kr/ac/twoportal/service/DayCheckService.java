package kr.ac.twoportal.service;

import java.util.List;

import kr.ac.twoportal.dto.ProsessorDayCheckDto;
import kr.ac.twoportal.vo.LectureList;
import kr.ac.twoportal.vo.Student;

public interface DayCheckService {

	boolean studentDayChecking(LectureList lectureList);

	boolean dayCheckDuplicateCheck(int listNo);

	int professorDayChecking(int no);

	ProsessorDayCheckDto getProDayCheckDto(int findLecNo);

	List<Student> getDayCheckedStudents(int lecNo);

	List<Student> getNotDayCheckdStudents(int lecNo);

}
