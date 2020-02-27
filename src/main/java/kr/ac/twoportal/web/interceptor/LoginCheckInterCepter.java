package kr.ac.twoportal.web.interceptor;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.ac.twoportal.dto.LoginInfo;
import kr.ac.twoportal.dto.NavLeftDto;
import kr.ac.twoportal.service.AccessService;
import kr.ac.twoportal.service.LoginService;
import kr.ac.twoportal.service.NavService;
import kr.ac.twoportal.service.UrlService;
import kr.ac.twoportal.vo.UrlAccess;
import kr.ac.twoportal.vo.Urls;

public class LoginCheckInterCepter extends HandlerInterceptorAdapter{
	
	@Autowired
	private NavService navService;
	@Autowired
	private UrlService urlService;
	@Autowired
	private AccessService accessService;
	@Autowired
	private LoginService loginService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		//System.out.println("sang-인터셉터 진입");
		LoginInfo loginInfo = (LoginInfo) request.getSession().getAttribute("loginInfo");
			
		  	if(null == loginInfo) { 
		  		System.out.println("sang-인터셉터-로그인 세션확인 실패 (null)");
		  		response.sendRedirect("/login.hta?error=noSession");
		  		return false; 
		  	} 
		 System.out.println("sang-인터셉터-로그인 세션확인  성공");
		 /*
		 * Map<String, Object> checkAccessMap = new HashMap<String, Object>(); String
		 * url = request.getRequestURI(); Urls urlInfo = urlService.getUrlByUrl(url);
		 * checkAccessMap.put("urlNo", urlInfo.getNo()); checkAccessMap.put("job",
		 * loginInfo.getJob()); List<UrlAccess> checkAccessList =
		 * accessService.getAccessByUrlNoAccess(checkAccessMap);
		 * System.out.println("체크된리스트"+checkAccessList);
		 * 
		 * if(checkAccessList.isEmpty()) { System.out.println("허용된 권한의 페이지가 아닙니다");
		 * return false; }
		 */
		  
		List<NavLeftDto> navLefts = navService.getNavLeftsByJob(loginInfo.getJob());
		String homePath = "/"+loginInfo.getJob()+"/home.hta";

		//나중에 false처리 하는곳에 리다이렉트로 로그인폼 보내기 추가예정
		request.setAttribute("navLefts",navLefts);
		request.setAttribute("homePath", homePath);
		
		//System.out.println("sang-인터셉터 탈출");
		return true;
	
	}
}
