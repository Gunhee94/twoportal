package kr.ac.twoportal.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.twoportal.dto.LoginInfo;
import kr.ac.twoportal.dto.TuitionHisDto;
import kr.ac.twoportal.form.TutionAddForm;
import kr.ac.twoportal.service.DepartmentService;
import kr.ac.twoportal.service.TuitionService;
import kr.ac.twoportal.vo.Tuition;
import kr.ac.twoportal.vo.TuitionHistory;

@Controller
public class TutionController {

	@Autowired
	private DepartmentService departmentService;
	
	@Autowired
	private TuitionService tuitionService;
	
	@GetMapping("/staff/tutionAdd.hta")
	public String TutionAdd(Model model) {
		model.addAttribute("deptList", departmentService.getAllDepartment());
		return "staff/budget/tutionAdd";
	}
	
	@PostMapping("/staff/tutionAdd.hta")
	public String TutionAddForm(TutionAddForm form) {
		
		Tuition tuition = new Tuition();
		try {
			tuition.setDeptNo(form.getDeptNo());
			tuition.setPayStartDate(form.getStartdate());
			tuition.setPayEndDate(form.getEnddate());
			tuition.setPrice(form.getPayprice());
			tuition.setQuarter(form.getQuarter());
			
		} catch(NullPointerException e) {
			return "redirect:/staff/tutionAdd.hta?error=null";
		}

		boolean isInsertTuitionSuccess = tuitionService.insertTuition(tuition);
		
		if(!isInsertTuitionSuccess) {
			return "redirect:/staff/tutionAdd.hta?error=duplicate";
		}
		//완료 페이지 
		return "redirect:/staff/tutionAdd.hta?result=success";
	}
	
	@GetMapping("/staff/tutionHistories.hta")
	public String TutionAddHistories() {
		
		return "staff/budget/tutionHistories";
	}
	
	@GetMapping("/student/request/tuitionPay.hta")
	public String tuitionPay(HttpSession session, Model model) {
		
		LoginInfo loginInfo = (LoginInfo) session.getAttribute("loginInfo");
		
		String isTuitionPayDuplicate = tuitionService.isTuitionPayDuplicate(loginInfo.getStudent().getNo());
		if("duplicated".equals(isTuitionPayDuplicate)) {
			return "redirect:/student/request/tuitionPayHistory.hta?result=duplicate";
		}
		
		TutionAddForm tuitionPayFormInfos = tuitionService.getTuitionPayForm(loginInfo.getStudent().getNo());
		
		model.addAttribute("tuitionPayFormInfos",tuitionPayFormInfos);
		
		return "student/request/tuitionPay";
	}
	
	@GetMapping("/student/request/tuitionPayHistory.hta")
	public String tuitionPayHistory() {
		return "student/request/tuitionPayHistory";
	}
	
	@GetMapping("/tutionPayFakeCheck.hta")
	public String tutionPayFakeCheck(@RequestParam("payMethod") String payMethod, 
									 @RequestParam("tuitionNo") int tuitionNo, 
									 @RequestParam("payPrice") int payPrice,
								     HttpSession session) {
		
		System.out.println("결제 파라미터 값"+payMethod+"----------"+tuitionNo+"--"+payPrice);
		
		LoginInfo loginInfo = (LoginInfo) session.getAttribute("loginInfo");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("tuitionNo", tuitionNo);
		map.put("payMethod", payMethod);
		map.put("payPrice", payPrice);
		map.put("stuNo",loginInfo.getStudent().getNo());
		
		String isSafe = tuitionService.tuitionPayFakeCheck(map);
		
		if("Fake".equals(isSafe)) {
			return "redirect:/student/request/tuitionPayHistory.hta?result=fake";
		}
		
		TuitionHistory tuitionHistory = new TuitionHistory();
		tuitionHistory.setTuitionNo(tuitionNo);
		tuitionHistory.setStuNo(loginInfo.getStudent().getNo());
		tuitionHistory.setPayWay(payMethod);
		tuitionService.InsertTuitionHistory(tuitionHistory);
		
		return "redirect:/student/request/tuitionPayHistory.hta?result=success";
	}
	
	
	@GetMapping("/staff/tuitionModify.hta")
	public String tuitionModify(@RequestParam("deptNo") int deptNo, @RequestParam("quarter") String quarter, Model model) {
		
		model.addAttribute("tuitionForm", tuitionService.getTuitionForm(deptNo,quarter));
		model.addAttribute("deptList", departmentService.getAllDepartment());
		
		return "staff/budget/tuitionModify";
	}
	
	
	@GetMapping("/staff/tuitionModifyForm.hta")
	public String tuitionModifyForm(TutionAddForm form,Model model) {
		
		Tuition tuition = new Tuition();
		try {
			tuition.setNo(form.getTuitionNo());
			tuition.setDeptNo(form.getDeptNo());
			tuition.setPayStartDate(form.getStartdate());
			tuition.setPayEndDate(form.getEnddate());
			tuition.setPrice(form.getPayprice());
			tuition.setQuarter(form.getQuarter());
			tuition.setIsClose("진행중");
		} catch(NullPointerException e) {
			return "redirect:/staff/tutionModify.hta?error=null?deptNo="+form.getDeptNo();
		}
		
		boolean isSuccess = tuitionService.tuitionModify(tuition);
		
		if(!isSuccess) {
			return "redirect:/staff/tutionModify.hta?error=duplicateDept&deptNo="+form.getDeptNo();
		}
		
		model.addAttribute("success");
		return "staff/budget/tutionHistories";
	}
	
	@GetMapping("/staff/tuitionDelete.hta")
	public String tuitionDelete(@RequestParam("tuitionNo") int tuitionNo) {
		tuitionService.tutionDelete(tuitionNo);
		return "staff/budget/tutionHistories";
	}
	

	
	@GetMapping("/getJsontutionHistories.hta")
	@ResponseBody
	public List<TuitionHisDto> getJsontutionHistories(@RequestParam("year") String year, @RequestParam("quarter") String quarter) {
		
		Tuition tuition = new Tuition();
		tuition.setYear(year);
		tuition.setQuarter(quarter);
		
		List<TuitionHisDto> resultTuitionHisList = tuitionService.getTutionHistoriesListByJsonParam(tuition);
		System.out.println(resultTuitionHisList);
		return resultTuitionHisList;
	}
	
	@GetMapping("/getJsonTuitionPayHistories.hta")
	@ResponseBody
	public List<TuitionHisDto> getJsonTuitionPayHistories(TuitionHisDto tuitionHisDto, HttpSession session) {
		
		LoginInfo loginInfo = (LoginInfo) session.getAttribute("loginInfo");
		System.out.println(tuitionHisDto.getYear()+tuitionHisDto.getQuarter()+loginInfo.getStudent().getNo());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("year", tuitionHisDto.getYear());
		map.put("quarter", tuitionHisDto.getQuarter());
		map.put("stuNo",loginInfo.getStudent().getNo());
		
		System.out.println(tuitionService.getTuitionPayHistoryList(map));
		return 	tuitionService.getTuitionPayHistoryList(map);
	}
}
