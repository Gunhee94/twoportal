package kr.ac.twoportal.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.twoportal.dao.ExamDao;
import kr.ac.twoportal.dao.TestQuestionDao;
import kr.ac.twoportal.vo.TestQuestion;
import kr.ac.twoportal.vo.TestStudentCheck;

@Service
public class ExamServiceImpl implements ExamService {

	@Autowired
	private TestQuestionDao testQuestionDao;
	@Autowired
	private ExamDao examDao;
	
	@Override
	public List<TestQuestion> getTestQuestionsByTestInfoNo(int testInfoNo) {
		return testQuestionDao.getTestQuestionsByTestInfoNo(testInfoNo);
	}

	// 시험 제출하기 클릭시 studentCheck 테이블(DB)에 저장되고, 시험번호에 따라 시험결과가 저장된다.
	@Override
	public void insertStudentCheck(TestStudentCheck testStudentCheck) {
		examDao.insertStudentCheck(testStudentCheck);
	}

	@Override
	public void checkAllAnswers() {
		examDao.checkAllAnswers();
	}

	// 점수계산쿼리 : VO에는 학생번호, testInfoNo만있다.
	@Override
	public int getTestScoreByStudentCheck(TestStudentCheck testStudentCheck) {
		return examDao.getTestScoreByStudentCheck(testStudentCheck);
	}
	
	// 테스트결과테이블에저장 (학생번호, testInfoNo, testScore로)
	@Override
	public void insertStudentScoreByTestStudentCheck(Map<String, Object> creteria) {
		examDao.insertStudentScoreByTestStudentCheck(creteria);
	}

}
