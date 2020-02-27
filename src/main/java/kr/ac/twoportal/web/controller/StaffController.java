package kr.ac.twoportal.web.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.RandomStringUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.sun.org.apache.xpath.internal.operations.Mod;

import kr.ac.twoportal.dao.SalaryDao;
import kr.ac.twoportal.dto.DeptProfessorDto;
import kr.ac.twoportal.dto.DeptStudentDto;
import kr.ac.twoportal.dto.DetailProfessorDto;
import kr.ac.twoportal.dto.LectureListDto;
import kr.ac.twoportal.dto.SalaryInfoDto;
import kr.ac.twoportal.form.LectureAllowListForm;
import kr.ac.twoportal.form.MultipartImageStudentForm;
import kr.ac.twoportal.form.StudentForm;
import kr.ac.twoportal.service.BoardService;
import kr.ac.twoportal.service.DepartmentService;
import kr.ac.twoportal.service.LectureService;
import kr.ac.twoportal.service.MailService;
import kr.ac.twoportal.service.ProfessorService;
import kr.ac.twoportal.service.SalaryService;
import kr.ac.twoportal.service.SalaryServiceImpl;
import kr.ac.twoportal.service.StudentService;
import kr.ac.twoportal.utils.DateUtils;
import kr.ac.twoportal.vo.Board;
import kr.ac.twoportal.vo.Criteria;
import kr.ac.twoportal.vo.Department;
import kr.ac.twoportal.vo.Lecture;
import kr.ac.twoportal.vo.PageMaker;
import kr.ac.twoportal.vo.Professor;
import kr.ac.twoportal.vo.Student;

@Controller
public class StaffController {
	
	@Autowired
	private BoardService boardService;
	@Autowired
	private StudentService studentService;
	@Autowired
	private MailService	mailService;
	@Autowired
	private DepartmentService departmentService;
	@Autowired
	private ProfessorService professorService;
	@Autowired
	private LectureService lectureService;
	@Autowired
	private SalaryService salaryService;
	
	@Value("${student.photo.save}")
	private String photoSaveDirectory;
	
	@Value("${professor.photo.save}")
	private String photoSaveProfessorDirectory;
	
	@GetMapping("/staff/home.hta")
	public ModelAndView staffHome() throws Exception {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/staff/home");
		List<Board> list = boardService.selectBoardListNotParameter();
		mav.addObject("homeList",list);
		
		return mav;
	}

	
	//교직원에 학생 정보 추가 
	@GetMapping("/staff/studentAddInfo.hta")
	public String staffAddStudent(Model model) {
		
		return "staff/students/studentAddInfo";
	}
	
	@PostMapping("/staff/addStudent.hta")
	public String addOneStudent (StudentForm studentForm)throws Exception {
		String pwd = RandomStringUtils.randomAlphanumeric(6);
		studentForm.setPwd(pwd);
		String address = studentForm.getAddr1()+studentForm.getAddr2()+studentForm.getAddr3();

		
		Student student = new Student();
		BeanUtils.copyProperties(studentForm, student);
		student.setAddress(address);
		
		MultipartFile imgfile = studentForm.getImageName();
		if(!imgfile.isEmpty()) {
			String filename = imgfile.getOriginalFilename();
			FileCopyUtils.copy(imgfile.getBytes(), new File(photoSaveDirectory, filename));
			
			student.setImageName(filename);
		}
			
		mailService.sendEmail(student);
		studentService.addOneStudent(student);
		return "redirect:/staff/studentAddInfo.hta"; 
	}
	
	
	@PostMapping("/staff/studentXlsAddInfo.hta")
	public String addXls(@RequestParam("xlsfile") MultipartFile xlsfile) throws Exception{
		
		if(!xlsfile.isEmpty()) {
			Workbook workbook = new HSSFWorkbook(xlsfile.getInputStream());
			
			Sheet sheet = workbook.getSheetAt(0);
			
			int rowCount = sheet.getLastRowNum();
			System.out.println(rowCount);
			List<Student> students = new ArrayList<Student>();
			for(int i=1; i<=rowCount; i++) {
				Row row = sheet.getRow(i);
				
				//int no = (int) row.getCell(0).getNumericCellValue();
				String name = row.getCell(1).getStringCellValue();
				int id = (int) row.getCell(2).getNumericCellValue();
				//String pwd = row.getCell(3).getStringCellValue();
				Date age = row.getCell(4).getDateCellValue();
				//String status = row.getCell(5).getStringCellValue();
				int grade = (int)row.getCell(6).getNumericCellValue();
				//Date admission = row.getCell(7).getDateCellValue();
				//Date graduated = row.getCell(8).getDateCellValue();
				//String checkedPwd = row.getCell(9).getStringCellValue();
				String address = row.getCell(10).getStringCellValue();
				String email = row.getCell(11).getStringCellValue();
				String phone = row.getCell(12).getStringCellValue();
				String bankName = row.getCell(13).getStringCellValue();
				String accountNumber = row.getCell(14).getStringCellValue();
				int deptNo = (int) row.getCell(15).getNumericCellValue();
				//String stuAccess = row.getCell(16).getStringCellValue();
				String imageName = row.getCell(17).getStringCellValue();
				
				
				String idtoString = Integer.toString(id);
				String pwd = RandomStringUtils.randomAlphanumeric(6);
				
				Student student = new Student();
				//student.setNo(no);
				student.setName(name);
				student.setId(idtoString);
				student.setPwd(pwd);
				student.setAge(age);
				//student.setStatus(status);
				student.setGrade(grade);
				//student.setAdmission(admission);
				//student.setGraduated(graduated);
				//student.setCheckedPwd(checkedPwd);
				student.setAddress(address);
				student.setEmail(email);
				student.setPhone(phone);
				student.setBankName(bankName);
				student.setAccountNumber(accountNumber);
				student.setDeptNo(deptNo);
				//student.setStuAccess(stuAccess);
				student.setImageName(imageName);
				
				students.add(student);
			}
			workbook.close();
			/*
			for(Student s : students) {	
			mailService.sendEmail(s);
			}
			*/
			
	
			studentService.addStudents(students);
			return "redirect:/staff/studentAddInfo.hta";
		}else {
			
		return "redirect:/staff/studentAddInfo.hta";
		}
	}
	
	@PostMapping("/staff/multipartimg.hta")
	public String multipartImageUpload(MultipartHttpServletRequest multi)throws Exception{
		String fileName = "";
		
		File dir = new File(photoSaveDirectory);
		if(!dir.isDirectory()) {
			dir.mkdir();
		}
		
		Iterator<String> files = multi.getFileNames();
		MultipartFile mpf = multi.getFile(files.next());
		
		if(mpf == null || mpf.getSize() <=0) {
			System.out.println("파일용량 x");
			return "redirect:/staff/studentAddInfo.hta";
		}
		
		List<MultipartFile> fileList = multi.getFiles("file");
		for(MultipartFile filePart : fileList) {
			fileName = filePart.getOriginalFilename();
			System.out.println("실제 파일 이름" +fileName);
			long fileSize = filePart.getSize();
			
			if(!fileName.equals("")) {
				try {
					FileOutputStream fs = new FileOutputStream(photoSaveDirectory+"/"+fileName);
					fs.write(filePart.getBytes());
					fs.close();
				}catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		
		return "redirect:/staff/studentAddInfo.hta";
	}
	
	//교직원에 학생 정보 보기
	@GetMapping("/staff/studentInfo.hta")
	public String staffselectStudent(Model model) {
		
		List<Department> listDept = departmentService.getAllDepartment();
		
		model.addAttribute("listDept", listDept);
		
		
		return "staff/students/studentInfo";
	}
	
	@GetMapping("/staff/studentInfoCri.hta")
	@ResponseBody
	public Map<String , Object> infoListCri(@RequestParam(value="year", required = false)String year,
										@RequestParam(value="departmentNo", required = false, defaultValue = "0")int departmentNo,
										@RequestParam(value="grade", required = false, defaultValue = "0")int grade,
										@RequestParam(value="studentName", required = false)String studentName, 
										@RequestParam(value="page", required = false, defaultValue = "0")int page){
		Date date = new Date();
		if(year == null || year.isEmpty()) {
			year = DateUtils.getYear(date);
		}
		
		//페이지 개수 조회
		Criteria criteria = new Criteria();
		criteria.setPage(page);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("year",year);
		map.put("department",departmentNo);
		map.put("grade",grade);
		if (studentName != null && !studentName.isEmpty()) {
			map.put("studentName",studentName);
		}
		map.put("pageStart",(page-1)*5);
		map.put("perPageNum",criteria.getPerPageNum());
		
		System.out.println(map);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(criteria);
		pageMaker.setTotalCount(studentService.countStudentPage(map));
		
	
		Map<String, Object> result = new HashMap<String, Object>();
		List<DeptStudentDto> list = studentService.getAllStudentByCri(map);
	
		result.put("list", list);
		result.put("pageInfo", pageMaker);
	
		
		return result;
	}																				
	
	@GetMapping("/staff/studentInfoDetail.hta")
	@ResponseBody
	public DeptStudentDto studentInfoDetail(@RequestParam(value="studentNo", required = false, defaultValue = "0") int studentNo ) {	
		DeptStudentDto stuDetail = studentService.getStudentJoinDeptByNo(studentNo);
		return stuDetail;
	}
	
	@PostMapping("/staff/studentInfoUpdate.hta")
	@ResponseBody
	public DeptStudentDto studentInfoUpdate(MultipartImageStudentForm multipartStudentImage)throws Exception{
		System.out.println(multipartStudentImage);
		Student student = new Student();
		MultipartFile imgfile = multipartStudentImage.getImgFile();
		if(imgfile != null && !imgfile.isEmpty()) {
			String filename = imgfile.getOriginalFilename();
			FileCopyUtils.copy(imgfile.getBytes(), new File(photoSaveDirectory, filename));
			
			student.setImageName(filename);
		}else {
			
			student.setImageName("student0.jpg");
		}
		BeanUtils.copyProperties(multipartStudentImage, student);
		
		studentService.updateStudentInfo(student);
		DeptStudentDto stuDetail = studentService.getStudentJoinDeptByNo(student.getNo());
		return stuDetail;
	}
	
	@PostMapping("/staff/deleteStudent.hta")
	@ResponseBody
	public String deleteStudent(@RequestParam(value="studentNo" ,required = false) List<Integer> studentNoList)throws Exception{
	
	for(Integer studentNo: studentNoList) {
		studentService.deleteStudent(studentNo);
	}
		return "staff/students/studentInfo";
	} 
	
	//교직원에 교수 추가
	@GetMapping("/staff/professorAddInfo.hta")
	public String staffAddProfessor(Model model) {
		List<Department> listDept = departmentService.getAllDepartment();
		
		model.addAttribute("listDept", listDept);
		

		return "staff/professors/professorAddInfo";
	}
	@PostMapping("/staff/addProfessor.hta")
	public String addOneProfessor (DeptProfessorDto deptProfessorDto) throws Exception{
		
		
		String pwd = RandomStringUtils.randomAlphanumeric(6);
		deptProfessorDto.setPwd(pwd);
		
		Professor pro = new Professor();
		BeanUtils.copyProperties(deptProfessorDto, pro);
		
		MultipartFile imgfile = deptProfessorDto.getImageName();
		if(!imgfile.isEmpty()) {
			String filename = imgfile.getOriginalFilename();
			FileCopyUtils.copy(imgfile.getBytes(), new File(photoSaveProfessorDirectory, filename));
			
			pro.setImageName(filename);
		}
		
		professorService.addProfessor(pro);
		
		return "redirect:/staff/professorAddInfo.hta";
	}
	
	
	@GetMapping("/staff/professorInfo.hta")
	public String staffProfessors (Model model) {
		List<Department> listDept = departmentService.getAllDepartment();
		
		model.addAttribute("listDept", listDept);
		return "staff/professors/professorInfo";
	}
	
	
	//교직원에 교수 정보 보기
	@GetMapping("/staff/professorInfoCri.hta")
	@ResponseBody
	public Map<String, Object> staffselectProfessor(
										@RequestParam(value="deptNo", required = false, defaultValue = "0")int deptNo,
										@RequestParam(value="position", required = false)String position,
										@RequestParam(value="proName", required = false)String proName,
										@RequestParam(value="page", required = false, defaultValue = "1")int page) {
		
		Criteria criteria = new Criteria();
		criteria.setPage(page);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("deptNo", deptNo);
		map.put("position", position);
		map.put("proName", proName);
		map.put("pageStart",(page-1)*5);
		map.put("perPageNum",criteria.getPerPageNum());
		
		List<DeptProfessorDto> professor = professorService.getProfessors(map);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(criteria);
		pageMaker.setTotalCount(professorService.totalCountProfessors(map));
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("pageInfo", pageMaker);
		result.put("list", professor);
		return result;
	}
	
	@GetMapping("/staff/professorInfoDetail.hta")
	@ResponseBody
	public DetailProfessorDto getProfessorDetail (@RequestParam(value="proNo", required = false, defaultValue = "0") int proNo) {
		DetailProfessorDto result = professorService.getProfessorDetailInfo(proNo);
		return result;
	}
	
	@PostMapping("/staff/professorInfoUpdate.hta")
	@ResponseBody
	public DetailProfessorDto professorUpdate (DeptProfessorDto deptProfessorDto) throws Exception{
		System.out.println(deptProfessorDto);
		Professor professor = new Professor();
		MultipartFile imgfile = deptProfessorDto.getImageName();
		if(imgfile == null) {
			
		}else {
			String filename = imgfile.getOriginalFilename();
			FileCopyUtils.copy(imgfile.getBytes(), new File(photoSaveProfessorDirectory, filename));
			
			professor.setImageName(filename);
		}
		BeanUtils.copyProperties(deptProfessorDto, professor);
		professorService.updateProfessorInfo(professor);
		
		DetailProfessorDto result = professorService.getProfessorDetailInfo(professor.getNo());
		
		return result;
	}
	@PostMapping("/staff/professorDelete.hta")
	@ResponseBody
	public String deleteProfessor(@RequestParam(value="checkNo" ,required = false) List<Integer> proNoList)throws Exception{
		
		for(Integer proNo: proNoList) {
			System.out.println(proNo);
			professorService.deleteProfessor(proNo);
		}
			return "staff/professors/professorInfo";
		} 
	
	@GetMapping("/staff/salary.hta")
	//교직원에서 교수 월급주기
	public String staffPayaSalary(Model model) {
	
		List<SalaryInfoDto> result = salaryService.salaryInfo();
		model.addAttribute("result",result);
		return "staff/budget/salary";
	}
	
	
	@GetMapping("/staff/scholarship.hta")
	//교직원에서 학생 장학금주기
	public String staffPayaScholarship() {
		return "staff/budget/scholarship";
	}
	
	@GetMapping("/staff/allowLecture.hta")
	public String staffAllowLecture(Model model) {
		List<LectureListDto> result = lectureService.allowLectureList();
		model.addAttribute("result", result);
		
		return "staff/lecture/allowList";
	}
	
	@GetMapping("/staff/lectureAllow.hta")
	@ResponseBody
	public String lectureAllowStaff (@RequestParam(value="lectNo" ,required = false) int lecNo) {
		System.out.println(lecNo);
		Lecture lec = new Lecture();
		lec.setNo(lecNo);
		lec.setStatus("허용");
		lectureService.updateAllowLecture(lec);
		return "staff/lecture/allowList";
	}
	@GetMapping("/staff/refuseLecture.hta")
	@ResponseBody
	public String lecturerefuseStaff (@RequestParam(value="lectNo" ,required = false) int lecNo) {
		System.out.println(lecNo);
		Lecture lec = new Lecture();
		lec.setNo(lecNo);
		lec.setStatus("미허용");
		lectureService.updateAllowLecture(lec);
		return "staff/lecture/allowList";
	}
	
}
