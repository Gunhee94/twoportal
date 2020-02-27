package kr.ac.twoportal.web.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kr.ac.twoportal.dto.LoginInfo;
import kr.ac.twoportal.dto.StudentMypageDto;
import kr.ac.twoportal.form.MultipartImageStudentForm;
import kr.ac.twoportal.service.MyPageService;
import kr.ac.twoportal.vo.Student;

@Controller
public class MyPageController {

	
	@Autowired
	private MyPageService myPageService; 
	
	@GetMapping("/student/navHeader/myPage.hta")
	public String studentMyPage(HttpSession session, Model model) {
		
		LoginInfo loginInfo = (LoginInfo) session.getAttribute("loginInfo");
		StudentMypageDto myPageInfo = myPageService.getMyPageDto(loginInfo.getStudent().getNo());
		model.addAttribute("myPageInfo",myPageInfo);
		
		return "student/navHeader/myPage";
	}

	@GetMapping("/student/navHeader/myPageModify.hta")
	public String studentMyPageModify(HttpSession session, Model model) {
	
		LoginInfo loginInfo = (LoginInfo) session.getAttribute("loginInfo");
		StudentMypageDto myPageInfo = myPageService.getMyPageDto(loginInfo.getStudent().getNo());
		model.addAttribute("myPageInfo",myPageInfo);
		return "student/navHeader/myPageModify";
	}
	
	@PostMapping("/student/navHeader/myPageModify.hta")
	public String studentMyPageModify(MultipartImageStudentForm form) throws IOException {

		myPageService.PwdMatchCheck(form.getPwd(),form.getPwdSecond());
		
		Student student = new Student();
		String isUploaded = myPageService.regCheckAndUploadImg(form.getImgFile());
		if("uploaded".equals(isUploaded)) {
			student.setImageName(form.getImgFile().getOriginalFilename());
			myPageService.ImageUploadToDirectory(form.getImgFile());
		}
		
		BeanUtils.copyProperties(form, student);
		student.setPwd(DigestUtils.sha1Hex(student.getPwd()));
		
		myPageService.stuMyPageUpdate(student);
		
		return "redirect:/student/navHeader/myPage.hta?result=success";
	}
}
