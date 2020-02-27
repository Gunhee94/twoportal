package kr.ac.twoportal.service;

import java.util.List;
import java.util.Map;

import kr.ac.twoportal.dto.TuitionHisDto;
import kr.ac.twoportal.form.TutionAddForm;
import kr.ac.twoportal.vo.Tuition;
import kr.ac.twoportal.vo.TuitionHistory;

public interface TuitionService {

	boolean insertTuition(Tuition tuition);

	void InsertTuitionHistory(TuitionHistory tuitionHistory);

	List<TuitionHisDto> getTutionHistoriesListByJsonParam(Tuition tuition);

	TutionAddForm getTuitionForm(int deptNo, String quarter);

	TutionAddForm getTuitionPayForm(int no);

	boolean tuitionModify(Tuition tuition);

	void tutionDelete(int tutionNo);

	String tuitionPayFakeCheck(Map<String, Object> map);

	String isTuitionPayDuplicate(int stuNo);

	List<TuitionHisDto> getTuitionPayHistoryList(Map<String, Object> map);



}
