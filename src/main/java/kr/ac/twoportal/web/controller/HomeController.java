package kr.ac.twoportal.web.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.twoportal.dto.LectureListDto;
import kr.ac.twoportal.dto.LectureReviewDto;
import kr.ac.twoportal.dto.LoginInfo;
import kr.ac.twoportal.service.BoardService;
import kr.ac.twoportal.service.SubjectService;
import kr.ac.twoportal.utils.DateUtils;
import kr.ac.twoportal.vo.Board;
import kr.ac.twoportal.vo.Subject;

@Controller
public class HomeController {

	@Autowired
	private SubjectService subjectService;
	@Autowired
	private BoardService boardService;
	
	@GetMapping("/home.hta")
	public String home() {
		return "home";
	}
	
	// 학생으로 로그인했을 때 첫 화면
	@GetMapping("/student/home.hta")
	public String studentHome() {
		return "student/home";
	}
	
	///////////////교수/////////////////////////////
	// 교수로 로그인했을 때 첫 화면
	@GetMapping("/professor/home.hta")
	public String professorHome() {
		return "professor/home";
	}
	
	@ResponseBody
	@GetMapping("professor/homelecture.hta")
	public Map<String, Object> homelecture(HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		LoginInfo pro = (LoginInfo) session.getAttribute("loginInfo");
		
		List<LectureListDto> lectures = subjectService.getFiveLectureByProNo(pro.getProfessor().getNo());
		map.put("lectures", lectures);
		map.put("proName", pro.getProfessor().getName());
		return map;
	}
	
	@ResponseBody
	@GetMapping("professor/homeboard.hta")
	public Map<String, Object> homeboard(HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		LoginInfo pro = (LoginInfo) session.getAttribute("loginInfo");
	
		List<Board> boards = boardService.getFiveBoardByProNo(pro.getProfessor().getNo());
		map.put("boards", boards);
		
		return map;
	}
	
	@GetMapping("/professor/homedate.hta")
	@ResponseBody
	public Map<String, Object> homedate(HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		LoginInfo pro = (LoginInfo) session.getAttribute("loginInfo");
		
		Map<String, Object> criteria1 = new HashMap<String, Object>();
		criteria1.put("proNo", pro.getProfessor().getNo());
		criteria1.put("lectDay", "월");
		List<Subject> subjects1 = subjectService.getSubjectNameBymap(criteria1);
		System.out.println(subjects1.toString());
		Map<String, Object> criteria2 = new HashMap<String, Object>();
		criteria2.put("proNo", pro.getProfessor().getNo());
		criteria2.put("lectDay", "화");
		List<Subject> subjects2 = subjectService.getSubjectNameBymap(criteria2);
		
		Map<String, Object> criteria3 = new HashMap<String, Object>();
		criteria3.put("proNo", pro.getProfessor().getNo());
		criteria3.put("lectDay", "수");
		List<Subject> subjects3 = subjectService.getSubjectNameBymap(criteria3);
		
		Map<String, Object> criteria4 = new HashMap<String, Object>();
		criteria4.put("proNo", pro.getProfessor().getNo());
		criteria4.put("lectDay", "목");
		List<Subject> subjects4 = subjectService.getSubjectNameBymap(criteria4);
		
		Map<String, Object> criteria5 = new HashMap<String, Object>();
		criteria5.put("proNo", pro.getProfessor().getNo());
		criteria5.put("lectDay", "금");
		List<Subject> subjects5 = subjectService.getSubjectNameBymap(criteria5);
	
		map.put("subject1", subjects1);
		map.put("subject2", subjects2);
		map.put("subject3", subjects3);
		map.put("subject4", subjects4);
		map.put("subject5", subjects5);
		
		return map;  
	}  
	
	

	
	
	
}
