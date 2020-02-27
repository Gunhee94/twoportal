package kr.ac.twoportal.web.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.twoportal.dto.DeptProfessorDto;
import kr.ac.twoportal.dto.LectureListDto;
import kr.ac.twoportal.dto.LectureandCancelDto;
import kr.ac.twoportal.dto.LoginInfo;
import kr.ac.twoportal.dto.SalaryProfessorDto;
import kr.ac.twoportal.service.LectureCancelService;
import kr.ac.twoportal.service.LectureService;
import kr.ac.twoportal.service.ProfessorService;
import kr.ac.twoportal.service.SalaryService;
import kr.ac.twoportal.utils.DateUtils;
import kr.ac.twoportal.vo.LectureCancel;
import kr.ac.twoportal.vo.Professor;
import kr.ac.twoportal.vo.Salary;

@Controller
@RequestMapping("/professor/board")
public class ProfessorController {
	
	@Autowired
	private LectureCancelService lectureCancelService;
	@Autowired
	private ProfessorService professorService;
	@Autowired
	private SalaryService salaryService;
	@Autowired
	private LectureService lectureService;
	
	@Value("${professor.photo.save}")
	private String photoSaveProfessorDirectory;
	
	/////////////////////////시간표 ////////////////////////////////////////////////////
	@GetMapping("/calendar.hta")
	public String calendar() {
		return "professor/board/calendar";
	}  
	
	@GetMapping("/timetable.hta")
	@ResponseBody
	public Map<String, Object> timetable(@RequestParam(value = "lectDay", required = false) String lectDay,
										HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		LoginInfo pro = (LoginInfo) session.getAttribute("loginInfo");
			
		Map<String, Object> criteria = new HashMap<String, Object>();
		criteria.put("lectDay", lectDay);
		criteria.put("proNo", pro.getProfessor().getNo());
		
		List<LectureListDto> monlect = lectureService.getLectureTimeByProNo(criteria);
		map.put("monlect", monlect);
	
		return map;  
	} 
	
	/////////////////////////////급여///////////////
	@GetMapping("/salary.hta")
	public String salary() {
		return "professor/board/salary";
	}  
	
	@GetMapping("/salarylist.hta")
	@ResponseBody
	public Map<String, Object> salarylist(HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		LoginInfo pro = (LoginInfo) session.getAttribute("loginInfo");
		
		List<SalaryProfessorDto> salaries = salaryService.getSalaryByProNo(pro.getProfessor().getNo());
		
		ArrayList<Integer> salary = new ArrayList<Integer>();
		SalaryProfessorDto first = salaryService.getAvgSalaryByProNo(pro.getProfessor().getNo());
		salary.add(first.getAvg());
		for (SalaryProfessorDto sal : salaries) {
			salary.add(sal.getSalary());
		}
		
		map.put("salaries", salaries);
		map.put("salary", salary);
		map.put("proName", first.getProName());
		
		return map;  
	} 
	
	@GetMapping("/salarycri.hta")
	@ResponseBody
	public Map<String, Object> salarycri(@RequestParam(value="year", required = false) String year,
										HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		Date date = new Date();
		if (year == null) {
			year = DateUtils.getYear(date);
		}
		
		LoginInfo pro = (LoginInfo) session.getAttribute("loginInfo");
				
		map.put("year", year);
		map.put("proNo", pro.getProfessor().getNo());
		
		 List<Salary> salaries = salaryService.getSalaryByMap(map);
		 map.put("salaries", salaries);
		 
		return map;  
	}  
	
	
	// 프로필/////////////////////////////////////////////
	@GetMapping("/profile.hta")
	public String profile() {
		return "professor/board/profile";
	}  
	@GetMapping("/profilelist.hta")
	@ResponseBody
	public Map<String, Object> profilelist(HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		LoginInfo pro = (LoginInfo) session.getAttribute("loginInfo");
		
		DeptProfessorDto profiles = professorService.getProfessorByProNo(pro.getProfessor().getNo());
		map.put("profiles", profiles);
		
		return map;  
	} 
	
	@PostMapping("/updateProfile.hta")
	@ResponseBody
	public Map<String, Object> updateProfile(DeptProfessorDto deptProfessorDto, HttpSession session) throws Exception{
		System.out.println("사진 : " + deptProfessorDto);
		LoginInfo pro = (LoginInfo) session.getAttribute("loginInfo");
		
		Professor professor = professorService.getProFessorByNo(pro.getProfessor().getNo());
		
		MultipartFile imgfile = deptProfessorDto.getImageName();
		if (imgfile != null) {
			String filename = imgfile.getOriginalFilename();
			professor.setImageName(filename);
			
			FileCopyUtils.copy(imgfile.getBytes(), new File(photoSaveProfessorDirectory, filename));			
		} else {
			
		}

		professor.setPwd(deptProfessorDto.getPwd());
		professor.setEmail(deptProfessorDto.getEmail());
		
		professorService.updateProfessorInfo(professor);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		DeptProfessorDto profiles = professorService.getProfessorByProNo(pro.getProfessor().getNo());
		map.put("profiles", profiles);
		
		return map;  
	} 
	
	///////////////////////////////휴강신청 ///////////////////////////////////////
	@GetMapping("/cancel.hta")
	public String cancel() {
		return "professor/board/cancel";
	}  
	@GetMapping("/cancelOk.hta")
	public String cancelOk() {
		return "professor/board/cancelOk";
	}  
	
	@GetMapping("/cancelOklist.hta")
	@ResponseBody
	public Map<String, Object> cancelOklist(HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<LectureandCancelDto> cancels = lectureCancelService.getLectureCancelwhereRespNull();
		map.put("cancels", cancels);
		
		return map;  
	} 
	@GetMapping("/updatecancel.hta")
	public String updatecancel(@RequestParam(value="cancelNo", required = false) int cancelNo) {
		
		LectureCancel lectCancel = lectureCancelService.getLectureCancelByNo(cancelNo);
		
		lectCancel.setRespDate(new Date());
		
		lectureCancelService.updateLectureCancel(lectCancel);
		
		return "redirect:/professor/board/cancelOklist.hta";  
	} 
	
	@GetMapping("/cancelcancel.hta")
	public String cancelcancel(@RequestParam(value="cancelNo", required = false) int cancelNo,
											HttpSession session) {
		lectureCancelService.deleteLectureCancel(cancelNo);
		
		return "redirect:/professor/board/cancellist.hta";  
	} 
	@GetMapping("/cancelapply.hta")
	public String cancelapply(@RequestParam(value="startdate", required = false) Date startdate,
											@RequestParam(value="enddate", required = false) Date enddate,
											@RequestParam(value="object", required = false) String object,
											@RequestParam(value="lectNo", required = false) String lectNo,
											HttpSession session) {
		
		LoginInfo pro = (LoginInfo) session.getAttribute("loginInfo");
		
		String[] lectNoArr = lectNo.split(",");
		for (int i=0; i<lectNoArr.length; i++) {
			LectureCancel lectureCancel = new LectureCancel();
			lectureCancel.setProNo(pro.getProfessor().getNo());
			lectureCancel.setLectNo(Integer.parseInt(lectNoArr[i]));
			lectureCancel.setReason(object);
			lectureCancel.setStartDate(startdate);
			lectureCancel.setEndDate(enddate);
			
			lectureCancelService.insertLectureCancel(lectureCancel);
		}
  
		return "redirect:/professor/board/cancellist.hta";  
	} 
	
	@GetMapping("/cancellist.hta")
	@ResponseBody
	public Map<String, Object> cancellist(HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		LoginInfo pro = (LoginInfo) session.getAttribute("loginInfo");
		
		List<LectureandCancelDto> cancels = lectureCancelService.getLectureCancelByProNo(pro.getProfessor().getNo());
		map.put("cancels", cancels);
		
		return map;  
	} 
	@GetMapping("/daycheck.hta")
	@ResponseBody
	public Map<String, Object> daycheck(@RequestParam(value="dayArr", required = false) String dayArr,
										HttpSession session) {
		
		Map<String, Object> criteria = new HashMap<String, Object>();
		
		LoginInfo pro = (LoginInfo) session.getAttribute("loginInfo");
		
		String[] dayArrs = dayArr.split("");
		ArrayList<String> saveDay = new ArrayList<String>();
		
		for (String day : dayArrs) {
			saveDay.add(day);
		}
		
		criteria.put("proNo", pro.getProfessor().getNo());
		for (int i=0; i<saveDay.size(); i++) {
			criteria.put("day"+i, saveDay.get(i));			
		}
		
		List<LectureListDto> lectureDay = lectureService.getLectureDayByProNo(criteria);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("lectureDay", lectureDay);

		return map;  
	} 
	
	
	

	
}
