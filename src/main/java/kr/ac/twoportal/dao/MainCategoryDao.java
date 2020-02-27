package kr.ac.twoportal.dao;

import java.util.List;

import kr.ac.twoportal.vo.MainCategory;

public interface MainCategoryDao {

	List<Integer> getMainNosByJob(String job);

	MainCategory getMainCateByNo(int mainNo);

}
