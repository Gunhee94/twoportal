package kr.ac.twoportal.web.advice;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import kr.ac.twoportal.exception.PwdException;

@ControllerAdvice
public class MypageControllerAdvice {

	@ExceptionHandler(PwdException.class)
	public String pwdNotMatch() {
		return "redirect:/student/navHeader/myPage.hta?result=pwdNotMatch";
	}
}
