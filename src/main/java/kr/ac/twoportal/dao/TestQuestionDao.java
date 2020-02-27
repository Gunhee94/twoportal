package kr.ac.twoportal.dao;

import java.util.List;

import kr.ac.twoportal.vo.TestQuestion;

public interface TestQuestionDao {

	List<TestQuestion> getTestQuestionsByTestInfoNo(int testInfoNo);
}
