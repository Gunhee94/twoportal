package kr.ac.twoportal.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/share")
public class ShareController {

	@GetMapping("/location.hta")
	public String location() {
		return "share/location";
	}
	
}
