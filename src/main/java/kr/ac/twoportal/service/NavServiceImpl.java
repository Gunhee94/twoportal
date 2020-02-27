package kr.ac.twoportal.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.twoportal.dao.UrlsDao;
import kr.ac.twoportal.dto.NavLeftDto;
import kr.ac.twoportal.vo.MainCategory;

@Service
public class NavServiceImpl implements NavService{
	// 직종에 상관없이 모두 표시되는 기타 카테고리 번호
	private static final int COMMON_ETC_CATEGORY_NO = 100;

	@Autowired
	private UrlsDao urlsDao;
	@Autowired
	private MainCateService mainCateService;
	
	@Override
	public List<NavLeftDto> getNavLeftsByJob(String job) {
		//System.out.println("sang-navservice 진입");
		List<NavLeftDto> navLeftDtos = new ArrayList<NavLeftDto>();
		List<Integer> mainNos = mainCateService.getMainNosByJob(job);
		
		for(int i = 0; i< mainNos.size(); i++) {
			NavLeftDto navleft = new NavLeftDto();
			int mainNo = mainNos.get(i);
			MainCategory mainCate = mainCateService.getMainCateByNo(mainNo);
			navleft.setMainNo(mainNo);
			navleft.setMainTitle(mainCate.getTitle());
			navleft.setUrl(urlsDao.getUrlsByMainNo(mainNo));
			
			navLeftDtos.add(navleft);
		}
		
		NavLeftDto navleft = new NavLeftDto();
		navleft.setMainNo(COMMON_ETC_CATEGORY_NO);
		navleft.setMainTitle("기타");
		navleft.setUrl(urlsDao.getUrlsByMainNo(COMMON_ETC_CATEGORY_NO));
		navLeftDtos.add(navleft);
		
		//System.out.println("sang-navservice 탈출");
		return navLeftDtos;
	}


}
