package kr.ac.twoportal.dao;

import java.util.List;
import java.util.Map;

import kr.ac.twoportal.dto.TuitionHisDto;
import kr.ac.twoportal.vo.Tuition;
import kr.ac.twoportal.vo.TuitionHistory;

public interface TuitionHistoryDao {

	void InsertTuitionHistory(TuitionHistory tuitionHistory);

	TuitionHistory isPayHisDuplicate(int stuNo);

	List<TuitionHisDto> getTuitionPayHistoryList(Map<String, Object> map);

}
