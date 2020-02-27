package kr.ac.twoportal.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.twoportal.service.ResultService;

@Controller
@RequestMapping("/student/result")
public class ResultController {

	@Autowired
	private ResultService resultService;
	
	@GetMapping("/myResult.hta")
	public String myResult() {
		return "student/result/myResult";
	}
}
