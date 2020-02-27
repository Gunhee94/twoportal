package kr.ac.twoportal.web.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.twoportal.dto.LectureListDto;
import kr.ac.twoportal.dto.LectureReviewDto;
import kr.ac.twoportal.dto.LoginInfo;
import kr.ac.twoportal.form.LectureAddForm;
import kr.ac.twoportal.service.DepartmentService;
import kr.ac.twoportal.service.LectureService;
import kr.ac.twoportal.service.LectureTimeService;
import kr.ac.twoportal.service.LectureAddService;
import kr.ac.twoportal.service.LectureReviewService;
import kr.ac.twoportal.utils.DateUtils;
import kr.ac.twoportal.vo.Board;
import kr.ac.twoportal.vo.Criteria;
import kr.ac.twoportal.vo.Department;
import kr.ac.twoportal.vo.LectureReview;
import kr.ac.twoportal.vo.LectureTime;
import kr.ac.twoportal.vo.PageMaker;

@Controller
@RequestMapping("/professor/lecture")
public class LectureController {

	@Autowired
	private LectureService lectureService;
	@Autowired
	private LectureTimeService lectureTimeService;
	@Autowired
	private LectureAddService lectureAddService;
	@Autowired
	private DepartmentService departmentService;
	@Autowired
	private LectureReviewService lectureReviewService;
	
	/////////////////강의평가///////교수시점///////////////
	@GetMapping("/proreview.hta")  
	public String proreview() {
		return "professor/lecture/proreview"; 
	}  
	
	@GetMapping("/reviewOk.hta")
	@ResponseBody
	public List<LectureReviewDto> reviewOks(@RequestParam(value="lectNo", required = false) int lectNo) {
		
		return lectureReviewService.getLectureReviewGroupStuByLectNo(lectNo); 
	}  
	
	
	@GetMapping("/reviewcheckcri.hta")
	@ResponseBody
	public List<LectureReviewDto> lectureChecks(@RequestParam(value="year", required = false) String year,
										@RequestParam(value="semester", required = false, defaultValue = "0") int semester,
										HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		Date date = new Date();
		if (year == null) {
			year = DateUtils.getYear(date);
		}
		
		LoginInfo pro = (LoginInfo) session.getAttribute("loginInfo");
				
		map.put("year", year);
		map.put("semester", semester);
		map.put("proNo", pro.getProfessor().getNo());
		
		List<LectureReviewDto> lectures = lectureReviewService.getSubjectandLectureBymap(map);
	
		return lectures;  
	}  
	
	
	/////////////////강의평가///////학생시점///////////////
	@GetMapping("/reviewinsert.hta")
	@ResponseBody
	public Map<String, Object> reviewinsert(@RequestParam(value="lectListNo") int lectListNo,
							   @RequestParam(value="total") int total) {
	
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("listNo", lectListNo);
		map.put("totalScore", total);
		
		lectureReviewService.insertReview(map);
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("message", "평가가 성공적으로 제출되었습니다.");
		
		return result;  
	} 
	
	@GetMapping("/review.hta")  
	public String review() {
		return "professor/lecture/review"; 
	}  
	
	@GetMapping("/reviewcri.hta")
	@ResponseBody
	public List<LectureReviewDto> reviewcri(@RequestParam(value="year", required = false) String year,
										@RequestParam(value="semester", required = false, defaultValue = "0") int semester,
										HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		Date date = new Date();
		if (year == null) {
			year = DateUtils.getYear(date);
		}
		
		LoginInfo stu = (LoginInfo) session.getAttribute("loginInfo");
				
		map.put("year", year);
		map.put("semester", semester);
		map.put("stuNo", stu.getStudent().getNo());
		
		List<LectureReviewDto> reviews = lectureReviewService.getLectureIsReviewBymap(map);

		return reviews;  
	}  
	
	
	/////////////////////////개설신청/조회//////////////////////////
	@GetMapping("/applycancel.hta")
	@ResponseBody
	public Map<String, Object> applycancel(@RequestParam(value="lectNo") int lectNo) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		lectureService.deleteLectureByNo(lectNo);
		
		
		map.put("message", "삭제가 정상적으로 완료되었습니다.");
		
		return map; 
	} 
	
	
	@PostMapping("/addlecture.hta")
	public String applylist(LectureAddForm form, HttpSession session) throws Exception {
		
		LoginInfo pro = (LoginInfo) session.getAttribute("loginInfo");
		
		lectureAddService.addLecture(form, pro.getProfessor().getNo());
		
		return "redirect:/professor/lecture/applylist.hta"; 
	}  
	
	@GetMapping("/applylist.hta")
	public String applylist(Model model, HttpSession session, @RequestParam(value="page", required = false, defaultValue = "1")int page) {
		
		LoginInfo pro = (LoginInfo) session.getAttribute("loginInfo");
				
		Criteria criteria = new Criteria();
		criteria.setPage(page);
		criteria.setPerPageNum(5);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("proNo", pro.getProfessor().getNo());
		map.put("perPageNum", criteria.getPerPageNum());
		map.put("pageStart",(page-1)*5);
		  
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(criteria);
		pageMaker.setTotalCount(lectureService.getCountLectureapplyByProNo(pro.getProfessor().getNo()));
	
		List<LectureListDto> lectures = lectureService.getAllLectureapplyByProNo(map);
		List<Department> departments = departmentService.getAllDepartment();
	
		model.addAttribute("lectures",lectures);
		model.addAttribute("departments", departments);
		model.addAttribute("pageMaker", pageMaker);
		
		return "professor/lecture/applylist"; 
	}  
	
	@GetMapping("/apply.hta")
	@ResponseBody
	public List<LectureTime> apply(HttpSession session, @RequestParam(value="place", required = false) String place,
								  			 			@RequestParam(value="room", required = false, defaultValue = "0") int room,
								  			 			@RequestParam(value="day", required = false, defaultValue = "0") String day) {
		
		LoginInfo pro = (LoginInfo) session.getAttribute("loginInfo");
		
		Map<String, Object> criteria = new HashMap<String, Object>();
		
		criteria.put("place", place);
		criteria.put("room", room);
		criteria.put("day", day);
		
		List<LectureTime> lectures = lectureTimeService.getLectureByPlaceandRoom(criteria);
		
		return lectures; 
	}  
	
	 ///////////////강의조회///////////////////////////////////////////////////////////
	@GetMapping("/list.hta")  
	public String list() {
		return "professor/lecture/list"; 
	}  
	
	@GetMapping("/listcri.hta")
	@ResponseBody
	public List<LectureListDto> listcri(@RequestParam(value="year", required = false) String year,
										@RequestParam(value="semester", required = false, defaultValue = "0") int semester,
										HttpSession session) {
		Map<String, Object> criteria = new HashMap<String, Object>();
		
		Date date = new Date();
		if (year == null) {
			year = DateUtils.getYear(date);
		}
		
		LoginInfo pro = (LoginInfo) session.getAttribute("loginInfo");
				
		criteria.put("year", year);
		criteria.put("semester", semester);
		criteria.put("proNo", pro.getProfessor().getNo());
		
		List<LectureListDto> lectures = lectureService.getAllLectureBycri(criteria);
	
		return lectures;  
	}     
	
	@GetMapping("/detail.hta")  
	@ResponseBody  
	public LectureListDto detail(@RequestParam("lectno") int lectNo) {
		LectureListDto lecture = lectureService.getLectureByLectNo(lectNo);
		
		  
		return lecture;  
	}
	
	@GetMapping("/stuLectList.hta")  
	@ResponseBody  
	public List<LectureListDto> stuLectList(@RequestParam("lectno") int lectNo) {
		List<LectureListDto> lectures = lectureService.getStudentLectureListByLectNo(lectNo);
	
		     
		return lectures;
	}

	
}
  