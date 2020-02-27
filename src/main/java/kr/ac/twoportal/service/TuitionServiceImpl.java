package kr.ac.twoportal.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.twoportal.dao.DepartmentDao;
import kr.ac.twoportal.dao.TuitionDao;
import kr.ac.twoportal.dao.TuitionHistoryDao;
import kr.ac.twoportal.dto.TuitionHisDto;
import kr.ac.twoportal.form.TutionAddForm;
import kr.ac.twoportal.utils.DateUtils;
import kr.ac.twoportal.vo.Department;
import kr.ac.twoportal.vo.Tuition;
import kr.ac.twoportal.vo.TuitionHistory;

@Service
public class TuitionServiceImpl implements TuitionService {

	@Autowired
	private TuitionDao tuitionDao;
	@Autowired
	private TuitionHistoryDao tuitionHistoryDao;
	
	@Autowired
	private DepartmentDao departmentDao;
	@Override
	public boolean insertTuition(Tuition tuition) {
		Tuition isTuitionDuplicate = tuitionDao.getTutionDuplicateCheck(tuition);
		if(isTuitionDuplicate != null) {
			return false;
		}
		tuitionDao.insertTuition(tuition);
		return true;
	}

	@Override
	public List<TuitionHisDto> getTutionHistoriesListByJsonParam(Tuition tuition) {
		return	tuitionDao.getTutionHisDtoByJsonParam(tuition);
	}
	
	@Override
	public TutionAddForm getTuitionPayForm(int no) {
		return tuitionDao.getTuitionPayByStuNo(no);
	}
	
	@Override
	public TutionAddForm getTuitionForm(int deptNo,String quarter) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("deptNo", deptNo);
		map.put("quarter", quarter);
		
		Tuition NotClosedTuition = tuitionDao.getNotClosedTuitionBydeptNo(map);
		
		//에러 던지기
		if(NotClosedTuition==null) {
			return null;
		}
		
		Department department = departmentDao.getDepartmentByNo(NotClosedTuition.getDeptNo());
		
		TutionAddForm form = new TutionAddForm();
		form.setTuitionNo(NotClosedTuition.getNo());
		form.setDeptNo(NotClosedTuition.getDeptNo());
		form.setDeptName(department.getName());
		form.setPayprice(NotClosedTuition.getPrice());
		form.setQuarter(NotClosedTuition.getQuarter());
		form.setStartdatemodify(DateUtils.getYYYYMMDD(NotClosedTuition.getPayStartDate()));
		form.setEnddatemodify(DateUtils.getYYYYMMDD(NotClosedTuition.getPayEndDate()));
		System.out.println(form);
		
		return form;
	}
	
	@Override
	public boolean tuitionModify(Tuition tuition) {
		
		Tuition isTuitionDuplicate = tuitionDao.getTutionDuplicateCheck(tuition);
		if(isTuitionDuplicate !=null && isTuitionDuplicate.getNo() != tuition.getNo()) {
			return false; 
		}
		tuitionDao.TuitionUpdate(tuition);
		return true;
	}

	@Override
	public void tutionDelete(int tuitionNo) {
		tuitionDao.deleteTution(tuitionNo);
	}

	@Override
	public String tuitionPayFakeCheck(Map<String, Object> map) {
		Tuition isSelected = tuitionDao.getIsTuitionPayFake(map);
		if(isSelected != null ) {
			return "Safe";
		}
		return "Fake";
	}

	@Override
	public void InsertTuitionHistory(TuitionHistory tuitionHistory) {
		tuitionHistoryDao.InsertTuitionHistory(tuitionHistory);
	}

	@Override
	public String isTuitionPayDuplicate(int stuNo) {
		TuitionHistory isSelected = tuitionHistoryDao.isPayHisDuplicate(stuNo);
		if(isSelected == null) {
			return "Notduplicated";
		}
		return "duplicated";
	}

	@Override
	public List<TuitionHisDto> getTuitionPayHistoryList(Map<String, Object> map) {
		return tuitionHistoryDao.getTuitionPayHistoryList(map);
	}
	
	

	

}
