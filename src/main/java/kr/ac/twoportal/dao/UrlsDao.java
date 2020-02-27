package kr.ac.twoportal.dao;

import java.util.List;

import kr.ac.twoportal.dto.NavLeftDto;
import kr.ac.twoportal.vo.Urls;

public interface UrlsDao {

	List<Urls> getUrlsByMainNo(int mainNo);

	Urls getUrlByUrl(String url);


}
