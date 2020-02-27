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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.twoportal.dto.GradeLectureDto;
import kr.ac.twoportal.dto.LectureAndGradeDto;
import kr.ac.twoportal.dto.LoginInfo;
import kr.ac.twoportal.service.DepartmentService;
import kr.ac.twoportal.service.GradeService;
import kr.ac.twoportal.service.SubjectService;
import kr.ac.twoportal.utils.DateUtils;
import kr.ac.twoportal.vo.Criteria;
import kr.ac.twoportal.vo.Department;
import kr.ac.twoportal.vo.PageMaker;
import kr.ac.twoportal.vo.Subject;
import kr.ac.twoportal.web.view.GradeXlsView;

@Controller
@RequestMapping("/professor/grade")
public class GradeController {

	@Autowired
	private GradeService gradeService;
	@Autowired
	private DepartmentService departmentService;
	@Autowired
	private SubjectService subjectService;
	
	@GetMapping("/gradelist.hta")
	public String gradelist() {
		return "professor/grade/gradelist";
	}
	
	@GetMapping("/excel.hta")
	public String excel(@RequestParam(value="year", required = false) String year,
			@RequestParam(value="semester", required = false, defaultValue = "0") int semester,
			@RequestParam(value="dept", required = false, defaultValue = "0") int deptNo,
			@RequestParam(value ="subject", required = false, defaultValue = "0") int subjectNo, 
			@RequestParam(value ="order", required = false) String order, 
			HttpSession session, Model model) throws Exception {
		
		System.out.println("정렬 : " + order);
		
		LoginInfo pro = (LoginInfo) session.getAttribute("loginInfo");
		
		Date date = new Date();
		if (year == null) {
			year = DateUtils.getYear(date);
		}
		
		Map<String, Object> criteria = new HashMap<String, Object>();
		criteria.put("year", year);
		criteria.put("semester", semester);
		criteria.put("deptNo", deptNo);
		criteria.put("subjectNo", subjectNo);
		criteria.put("proNo", pro.getProfessor().getNo());
		criteria.put("order", order);
		List<GradeLectureDto> gradeLectures = gradeService.getGradeResultBycri(criteria);
		
		model.addAttribute("gradeLectures", gradeLectures);
		
		// BeanNameViewResolver 를 사용하면 
				// 뷰이름과 일치하는 빈이름을 가진 객체가 View 로 반환되게 한다.
		return "gradeXlsView";
	}   
	
	@GetMapping("/listcri.hta")
	@ResponseBody
	public Map<String, Object> listcri(@RequestParam(value="year", required = false) String year,
										@RequestParam(value="semester", required = false, defaultValue = "0") int semester,
										@RequestParam(value="dept", required = false, defaultValue = "0") int deptNo,
										@RequestParam(value ="subject", required = false, defaultValue = "0") int subjectNo, 
										@RequestParam(value ="order", required = false) String order, 
										@RequestParam(value="page", required = false, defaultValue = "1")int page,
										HttpSession session) {
		
		System.out.println("정렬 : " + order);
		System.out.println("페이지번호 : " + page);
		
		
		Map<String, Object> map = new HashMap<String, Object>();
				
		LoginInfo pro = (LoginInfo) session.getAttribute("loginInfo");
		
		List<LectureAndGradeDto> isLectures = gradeService.getAllIsLectureGradeByProNo(pro.getProfessor().getNo());
		List<Department> departments = departmentService.getDepartmentByProNo(pro.getProfessor().getNo());
		List<Subject> subjects = subjectService.getSubjectBydeptNo(deptNo);
		
		Date date = new Date();
		if (year == null) {
			year = DateUtils.getYear(date);
		}
		
		Criteria criteriaPage = new Criteria();
		criteriaPage.setPage(page);
		
		Map<String, Object> criteria = new HashMap<String, Object>();
		criteria.put("year", year);
		criteria.put("semester", semester);
		criteria.put("deptNo", deptNo);
		criteria.put("subjectNo", subjectNo);
		criteria.put("proNo", pro.getProfessor().getNo());
		criteria.put("order", order);
		criteria.put("pageStart",(page-1)*5);
		criteria.put("perPageNum",criteriaPage.getPerPageNum());
		
		List<GradeLectureDto> gradeLectures = gradeService.getGradeResultBycri(criteria);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(criteriaPage);
		pageMaker.setTotalCount(gradeService.getCountGradeResultBycri(criteria));
		
		map.put("isLectures", isLectures);
		map.put("departments", departments);
		map.put("subjects", subjects);
		map.put("gradeLectures", gradeLectures);
		map.put("pageInfo", pageMaker);
		map.put("count", gradeService.getCountGradeResultBycri(criteria));
		
		return map;  
	}   
	
	@GetMapping("/insertgrade.hta")
	@ResponseBody
	public Map<String, Object> insertgrade(@RequestParam(value="lectNo") int lectNo) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		gradeService.insertGrade(lectNo);
		
		map.put("message", "성공적으로 성적 산출이 되었습니다.");
		
		return map;  
	}   
	

	
}
