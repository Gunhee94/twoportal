package kr.ac.twoportal.web.controller;

import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kr.ac.twoportal.dto.LoginInfo;
import kr.ac.twoportal.form.LoginForm;
import kr.ac.twoportal.service.LoginService;


@Controller
public class LoginController {
	
	@Autowired
	private LoginService loginService; 
	
	
	//로그인 페이지
	@GetMapping("/login.hta")
	public String loginPage(HttpSession session) {
		LoginInfo loginInfo = (LoginInfo) session.getAttribute("loginInfo");
		//로그인상태이면 해당 직업의 홈으로 보낸다
		if(null != loginInfo) {
			return "redirect:/"+loginInfo.getJob()+"/home.hta";
		}
		return "share/login";

	}

	@PostMapping("/loginform.hta") 
	public String login(LoginForm loginForm,HttpSession session) {
		
		
		LoginInfo loginInfo = new LoginInfo();
		try {
			loginInfo.setId(loginForm.getUserid());
			loginInfo.setPwd(loginForm.getPwd());
			loginInfo.setJob(loginForm.getJob());
			loginInfo = loginService.getLoginCheck(loginInfo);
		}
		catch (Exception e) {
			return "redirect:/login.hta?error=loginfail";
		}
		
		String shaPwd = DigestUtils.sha1Hex(loginForm.getPwd());
		
		//if(!loginInfo.getPwd().equals(shaPwd)) {
		//	return "redirect:/login.hta?error=loginfail";
		//}
		
		session.setAttribute("loginInfo",loginInfo);
		
		//출석체크할떄 로그인후 이전주소로 이동
		String oldUrl = (String) session.getAttribute("oldUrl");
		if(null != session.getAttribute("oldUrl")) {
			return oldUrl;
		}
		System.out.println("로그인 완료");
		return "redirect:/"+loginInfo.getJob()+"/home.hta";
	}
	
	@GetMapping("/logout.hta")
	public String logout(HttpSession session) {
		session.invalidate();
		return "share/login";
	}
}
