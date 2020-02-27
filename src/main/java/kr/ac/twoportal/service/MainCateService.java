package kr.ac.twoportal.service;

import java.util.List;

import kr.ac.twoportal.vo.MainCategory;

public interface MainCateService {
	
	List<Integer> getMainNosByJob(String job);

	MainCategory getMainCateByNo(int mainNo);

}
