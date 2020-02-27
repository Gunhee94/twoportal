package kr.ac.twoportal.service;

import java.util.List;
import java.util.Map;

import kr.ac.twoportal.vo.UrlAccess;

public interface AccessService {

	List<UrlAccess> getAccessByUrlNoAccess(Map<String, Object> checkAccessMap);

}
