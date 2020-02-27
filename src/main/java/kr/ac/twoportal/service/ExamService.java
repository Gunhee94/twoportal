package kr.ac.twoportal.service;

import java.util.List;
import java.util.Map;

import kr.ac.twoportal.vo.TestQuestion;
import kr.ac.twoportal.vo.TestStudentCheck;

public interface ExamService {
	
	// 시험정보번호로 질문들 불러오기
	List<TestQuestion> getTestQuestionsByTestInfoNo(int testInfoNo);
	
	// 학생 체크테이블에 DB저장
	void insertStudentCheck(TestStudentCheck testStudentCheck);
	
	// 정답시 전부를 Y로 바꾸는 쿼리(파라미터필요X)
	void checkAllAnswers();
	
	// 점수계산쿼리 : VO에는 학생번호, testInfoNo만있다.
	int getTestScoreByStudentCheck(TestStudentCheck testStudentCheck);
	
	// 테스트결과테이블에저장 (학생번호, testInfoNo, testScore로)
	void insertStudentScoreByTestStudentCheck(Map<String, Object> creteria);
}
