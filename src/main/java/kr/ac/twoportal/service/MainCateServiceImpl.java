package kr.ac.twoportal.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.twoportal.dao.MainCategoryDao;
import kr.ac.twoportal.vo.MainCategory;

@Service
public class MainCateServiceImpl implements MainCateService{

	@Autowired
	private MainCategoryDao mainCategoryDao;
	
	@Override
	public List<Integer> getMainNosByJob(String job) {
		return mainCategoryDao.getMainNosByJob(job);
	}

	@Override
	public MainCategory getMainCateByNo(int mainNo) {
		return mainCategoryDao.getMainCateByNo(mainNo);
	}

	
}
