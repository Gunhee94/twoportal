package kr.ac.twoportal.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.twoportal.service.PersonalInfoService;

@Controller
@RequestMapping("/student/personalInfo")
public class PersonalInfoController {

	@Autowired
	private PersonalInfoService personalInfoService;
	
	@GetMapping("/myInfo.hta")
	public String myInfo() {
		return "student/personalInfo/myInfo";
	}
	
	@GetMapping("/myInfoModify.hta")
	public String myInfoModify() {
		return "student/personalInfo/myInfoModify";
	}
}