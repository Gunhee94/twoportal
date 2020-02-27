package kr.ac.twoportal.dao;

import java.util.List;
import java.util.Map;

import kr.ac.twoportal.vo.UrlAccess;

public interface UrlAccessDao {

	List<UrlAccess> getAccessByMap(Map<String, Object> map);
}
