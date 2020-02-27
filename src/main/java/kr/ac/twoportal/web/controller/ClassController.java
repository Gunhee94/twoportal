package kr.ac.twoportal.web.controller;

import java.util.ArrayList;
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

import kr.ac.twoportal.dto.CartDayAndTime;
import kr.ac.twoportal.dto.LoginInfo;
import kr.ac.twoportal.dto.RegisterCartDto;
import kr.ac.twoportal.dto.RegisterListDto;
import kr.ac.twoportal.dto.RegisteredCountDto;
import kr.ac.twoportal.dto.SubNoAndLectTimeNo;
import kr.ac.twoportal.service.DepartmentService;
import kr.ac.twoportal.service.LectureListService;
import kr.ac.twoportal.vo.Department;
import kr.ac.twoportal.vo.LectureList;

@Controller
@RequestMapping("/student/class")
public class ClassController {
	
	@Autowired
	private LectureListService lectureListService;
	@Autowired
	private DepartmentService departmentService;
	
	// --------------- 수강신청 검색 기능 관련 ---------------
	// 수강신청 화면 연결
	@GetMapping("/register.hta")
	public String register(Model model, HttpSession session) {
		
		LoginInfo student = (LoginInfo) session.getAttribute("loginInfo");
		int stuNo = student.getStudent().getNo();
		
		List<RegisterListDto> registeredList = lectureListService.getLectureListByStuNo(stuNo);
		List<Department> departments = departmentService.getAllDepartment();
		RegisteredCountDto subCntAndCreditCnt = lectureListService.getSubCountAndCreditCountByStuNo(stuNo);
		
		model.addAttribute("departments", departments);
		model.addAttribute("registeredList", registeredList);
		model.addAttribute("subCntAndCreditCnt", subCntAndCreditCnt);
		
		//System.out.println("불러온 수강리스트는 : " + registeredList);
		System.out.println("불러온 카운트객체는 : " + subCntAndCreditCnt);
		
		return "student/class/register";
	}
	
	// 검색버튼 클릭시 데이터 응답
	@GetMapping("/registerList.hta")
	@ResponseBody
	public List<RegisterListDto> registerList(@RequestParam(value="dept", required = false) String dept,
											@RequestParam(value="year", required = false) String year,
											@RequestParam(value="ismajor", required =false) String ismajor,
											HttpSession session) {
		Map<String, Object> criteria = new HashMap<String, Object>();
		
		LoginInfo student = (LoginInfo) session.getAttribute("loginInfo");
		int stuNo = student.getStudent().getNo();
		
		// System.out.println("ClassController에서 받은 학과 : " + dept);
		// System.out.println("ClassController에서 받은 학년 : " + year);
		// System.out.println("ClassController에서 받은 전공여부 : " + ismajor);

		int changedYear = Integer.parseInt(year);
		int changedDept = Integer.parseInt(dept);
		
		criteria.put("dept", changedDept);
		criteria.put("year", changedYear);
		criteria.put("ismajor", ismajor);
		criteria.put("stuNo", stuNo);
		
		List<RegisterListDto> classes = lectureListService.getLectureListByMajorAndDeptNoAndYear(criteria);
		System.out.println("classes는 : " + classes.toString());
		
		return classes;
	}
	
	// --------------- 수강신청 검색 기능 관련 ---------------
	// 수강신청 DB에 저장(1개)
	@RequestMapping("/registerOneLecture.hta")
	@ResponseBody
	public Map<String, Object> registerOneLecture(@RequestParam(value="lectNo", required = false) int lectNo, HttpSession session) {
		Map<String, Object> criteria = new HashMap<String, Object>();
		
		LoginInfo student = (LoginInfo) session.getAttribute("loginInfo");
		int stuNo = student.getStudent().getNo();
		
		try {
			LectureList oneLecture = new LectureList();
			oneLecture.setLectNo(lectNo);
			oneLecture.setStuNo(stuNo);
			
			RegisteredCountDto countsInRegister = lectureListService.getSubCountAndCreditCountByStuNo(stuNo);
			
			lectureListService.insertOneLecture(oneLecture);
			
			criteria.put("status", "success");
			criteria.put("countsInRegister", countsInRegister);
			System.out.println("성공적으로 수강저장완료");
			
		} catch (Exception e) {
			criteria.put("status", "fail");
			System.out.println("수강저장실패");
		}
		
		return criteria;
	}
	
	// 수강신청 내역 삭제
	@RequestMapping("/deleteOneLecture.hta")
	@ResponseBody
	public Map<String, Object> deleteOneLecture(@RequestParam(value="lectNo", required = false) int lectNo, HttpSession session) {
		
		// DB에 넣을 맵(stuNo, lectNo 담은맵), 반환할 맵 따로(status, 성공실패값)
		
		// 반환값을 담은 Map
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		LoginInfo student = (LoginInfo) session.getAttribute("loginInfo");
		int stuNo = student.getStudent().getNo();
		
		RegisteredCountDto countsInDelete = lectureListService.getSubCountAndCreditCountByStuNo(stuNo);
		List<RegisterListDto> registeredList = lectureListService.getLectureListByStuNo(stuNo);
		
		try {
			// 로직에 사용될 Map
			Map<String, Object> criteria = new HashMap<String, Object>();

			criteria.put("lectNo", lectNo);
			criteria.put("stuNo", stuNo);
			
			lectureListService.deleteOneLecture(criteria);
			
			resultMap.put("deleteStatus", "success");
			resultMap.put("countsInDelete", countsInDelete);
			resultMap.put("registeredList", registeredList);
			System.out.println("수강삭제완료");
			
		} catch (Exception e) {
			resultMap.put("deleteStatus", "fail");
			System.out.println("수강삭제실패");
		}
		return resultMap;
	}
	
	// ------------- 수강신청 장바구니관련 -------------
	@GetMapping("/registerCart.hta")
	public String registerCart(Model model, HttpSession session) {
		
		LoginInfo student = (LoginInfo) session.getAttribute("loginInfo");
		int stuNo = student.getStudent().getNo();
		
		List<Department> departments = departmentService.getAllDepartment();
		List<RegisterListDto> cartList = lectureListService.getCartListByStuNo(stuNo);
		
		model.addAttribute("departments", departments);
		model.addAttribute("cartList", cartList);
		System.out.println("카트리스트는 "+cartList);
		return "student/class/registerCart";
	}
	
	// 시간표 표시를 위한 onload -- 학생번호를 가지고 CartList를 응답한다.
	@RequestMapping("/onloadCartList.hta")
	@ResponseBody
	public List<RegisterListDto> onloadCartList(HttpSession session) {
		LoginInfo student = (LoginInfo) session.getAttribute("loginInfo");
		int stuNo = student.getStudent().getNo();
		
		List<RegisterListDto> returnList = lectureListService.getCartListByStuNo(stuNo);
		//System.out.println("onload시의 학생 카트 리스트는 : " + returnList);
		
		return returnList;
	}
	
	// 검색버튼클릭
	@GetMapping("/registerCartList.hta")
	@ResponseBody
	public List<RegisterListDto> registerCartList(@RequestParam(value="dept", required = false) String dept,
											@RequestParam(value="year", required = false) String year,
											@RequestParam(value="ismajor", required =false) String ismajor,
											HttpSession session) {
		Map<String, Object> criteria = new HashMap<String, Object>();
		List<RegisterListDto> resultList = new ArrayList<RegisterListDto>();
		
		LoginInfo student = (LoginInfo) session.getAttribute("loginInfo");
		int stuNo = student.getStudent().getNo();
		
		int changedYear = Integer.parseInt(year);
		int changedDept = Integer.parseInt(dept);
		
		criteria.put("dept", changedDept);
		criteria.put("year", changedYear);
		criteria.put("ismajor", ismajor);
		criteria.put("stuNo", stuNo);
		
		resultList = lectureListService.getLectureListByMajorAndDeptNoAndYear(criteria);
		System.out.println("resultList는 : " + resultList.toString());
		return resultList;
	}
	
	// 장바구니 DB에 저장(1개)
	@RequestMapping("/insertOneLectureToCart.hta")
	@ResponseBody
	public Map<String, Object> insertOneLectureToCart(@RequestParam(value="lectNo", required = false) int lectNo, HttpSession session) {
		//System.out.println("컨트롤러까지는 진입하였다.");
		
		Map<String, Object> criteria = new HashMap<String, Object>();
		
		LoginInfo student = (LoginInfo) session.getAttribute("loginInfo");
		int stuNo = student.getStudent().getNo();
		try {
			List<SubNoAndLectTimeNo> subNoAndLectTimeNo = lectureListService.getSubNoAndLectTimeNoByLectNo(lectNo);
			
			for (SubNoAndLectTimeNo eachItem : subNoAndLectTimeNo) {
				RegisterCartDto cartItem = new RegisterCartDto();
				int subNo = eachItem.getSubNo();
				int lectTimeNo = eachItem.getLectTimeNo();
				cartItem.setStuNo(stuNo);
				cartItem.setLectNo(lectNo);
				cartItem.setSubNo(subNo);
				cartItem.setLectTimeNo(lectTimeNo);
				System.out.println("RegisterCartDto객체는 : " + cartItem);
				
				lectureListService.insertOneCart(cartItem);
			}
			criteria.put("status", "success");
			System.out.println("장바구니 담기 성공!");
		} catch (Exception e) {
			criteria.put("status", "fail");
			System.out.println("장바구니 담기 실패!");
		}
		return criteria;
	}
	
	// 수강신청 내역 삭제
	@RequestMapping("/deleteOneLectureFromCart.hta")
	@ResponseBody
	public Map<String, Object> deleteOneLectureFromCart(@RequestParam(value="lectNo", required = false) int lectNo, HttpSession session) {
		
		// DB에 넣을 맵(stuNo, lectNo 담은맵), 반환할 맵 따로(status, 성공실패값)
		
		// 반환값을 담은 Map
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		LoginInfo student = (LoginInfo) session.getAttribute("loginInfo");
		int stuNo = student.getStudent().getNo();
		
		try {
			// 로직에 사용될 Map
			Map<String, Object> criteria = new HashMap<String, Object>();

			criteria.put("lectNo", lectNo);
			criteria.put("stuNo", stuNo);
			
			lectureListService.deleteOneCart(criteria);
			
			resultMap.put("deleteCartStatus", "success");
			System.out.println("수강삭제완료");
			
		} catch (Exception e) {
			resultMap.put("deleteCartStatus", "fail");
			System.out.println("수강삭제실패");
		}
		return resultMap;
	}
	
	@GetMapping("/registeredTable.hta")
	public String registeredTable() {
		
		return "student/class/registeredTable";
	}
	
	@GetMapping("/personalTimeTable.hta")
	public String personalTimeTable() {
		
		return "student/class/personalTimeTable";
	}
	
	@GetMapping("/schoolTimeTable.hta")
	public String schoolTimeTable() {
		
		return "student/class/schoolTimeTable";
	}
	
}
