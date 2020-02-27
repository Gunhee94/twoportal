package kr.ac.twoportal.service;

import java.awt.List;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.twoportal.dao.UrlsDao;
import kr.ac.twoportal.dto.NavLeftDto;
import kr.ac.twoportal.vo.MainCategory;
import kr.ac.twoportal.vo.Urls;

@Service
public class UrlServiceImpl implements UrlService{

	@Autowired
	private UrlsDao urlsDao; 
	
	@Override
	public Urls getUrlByUrl(String url) {
		return	urlsDao.getUrlByUrl(url);
	}

	


}
