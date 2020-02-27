package kr.ac.twoportal.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.twoportal.dto.LoginInfo;
import kr.ac.twoportal.dto.NavLeftDto;
import kr.ac.twoportal.dto.ProsessorDayCheckDto;
import kr.ac.twoportal.service.DayCheckService;
import kr.ac.twoportal.service.LectureListService;
import kr.ac.twoportal.service.LectureService;
import kr.ac.twoportal.service.LectureTimeService;
import kr.ac.twoportal.service.LoginService;
import kr.ac.twoportal.service.NavService;
import kr.ac.twoportal.utils.LectureTimeUtils;
import kr.ac.twoportal.vo.Lecture;
import kr.ac.twoportal.vo.LectureList;
import kr.ac.twoportal.vo.LectureTime;
import kr.ac.twoportal.vo.Student;

@Controller
public class DayCheckController {

	@Autowired
	private NavService navService;
	@Autowired
	private DayCheckService dayCheckService;
	

	@GetMapping("/professor/navHeader/dayCheck.hta")
	public String DayCheckProfessor(HttpSession session, Model model) {

		LoginInfo loginInfo = (LoginInfo) session.getAttribute("loginInfo");

		// 로그인한 교수의 강좌 가져오기
		int findLecNo = dayCheckService.professorDayChecking(loginInfo.getProfessor().getNo());
		
		if (0 == findLecNo) {
			model.addAttribute("fail");
			return "professor/navHeader/dayCheckFail";
		}

		model.addAttribute("lectureNo", findLecNo);

		// 우측 상단 값 dto 담기
		ProsessorDayCheckDto findDto = dayCheckService.getProDayCheckDto(findLecNo);
		model.addAttribute("dto", findDto);

		return "professor/navHeader/dayCheck";
	}

	@GetMapping("/student/dayCheck.hta")
	public String DayCheckStudent(HttpSession session, HttpServletRequest request, @RequestParam("lecno") int lecNo) {

		LoginInfo loginInfo = (LoginInfo) session.getAttribute("loginInfo");

		// 로그인안되있으면 로그인이동
		if (null == loginInfo) {
			String path = "redirect:" + request.getRequestURI() + "?lecno=" + lecNo;
			System.out.println(path);
			session.setAttribute("oldUrl", path);

			return "redirect:/login.hta";
		}
		// nav바 값 넣기(인터셉터 무시)
		List<NavLeftDto> navLefts = navService.getNavLeftsByJob(loginInfo.getJob());
		String homePath = "redirect:/"+loginInfo.getJob()+"/home.hta";
		request.setAttribute("navLefts", navLefts);
		request.setAttribute("homePath", homePath);

		// 출석체크
		LectureList lectureList = new LectureList();
		lectureList.setLectNo(lecNo);
		lectureList.setStuNo(loginInfo.getStudent().getNo());
		boolean resultPage = dayCheckService.studentDayChecking(lectureList);

		if (!resultPage) {
			// 출석체크 실패 페이지
			request.setAttribute("result", "fail");
			return "student/home";
		}

		// 출석체크 완료 페이지
		request.setAttribute("result", "success");
		return "student/home";
	}

	@RequestMapping(value = { "/getJsonCheckedStudents.hta" })
	@ResponseBody
	public List<Student> getJsonCheckedStudents(@RequestParam("lecno") int lecNo) {
		System.out.println(dayCheckService.getDayCheckedStudents(lecNo));
		return dayCheckService.getDayCheckedStudents(lecNo);

	}

	
	  @RequestMapping(value= {"/getJsonNotCheckedStudents.hta"})
	  @ResponseBody 
	  public List<Student> getJsonNotCheckedStudents(@RequestParam("lecno") int lecNo) {
		  return dayCheckService.getNotDayCheckdStudents(lecNo); 
	  }
	 
}
