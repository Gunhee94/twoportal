package kr.ac.twoportal.dao;

import java.util.List;
import java.util.Map;

import kr.ac.twoportal.dto.TuitionHisDto;
import kr.ac.twoportal.form.TutionAddForm;
import kr.ac.twoportal.vo.Tuition;

public interface TuitionDao {

	void insertTuition(Tuition tuition);

	Tuition getTuitionByNo(int no);

	Tuition getTutionDuplicateCheck(Tuition tuition);

	List<TuitionHisDto> getTutionHisDtoByJsonParam(Tuition tuition);

	Tuition getNotClosedTuitionBydeptNo(Map<String, Object> map);

	void TuitionUpdate(Tuition tuition);

	void deleteTution(int tuitionNo);

	TutionAddForm getTuitionPayByStuNo(int no);

	Tuition getIsTuitionPayFake(Map<String, Object> map);

}
