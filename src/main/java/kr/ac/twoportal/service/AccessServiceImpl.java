package kr.ac.twoportal.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.twoportal.dao.UrlAccessDao;
import kr.ac.twoportal.vo.UrlAccess;

@Service
public class AccessServiceImpl implements AccessService{
	
	@Autowired
	private UrlAccessDao urlAccessDao;
	
	@Override
	public List<UrlAccess> getAccessByUrlNoAccess(Map<String, Object> checkAccessMap) {
		return urlAccessDao.getAccessByMap(checkAccessMap);
	}

}
