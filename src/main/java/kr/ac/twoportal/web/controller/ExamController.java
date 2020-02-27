package kr.ac.twoportal.web.controller;

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

import kr.ac.twoportal.dto.LoginInfo;
import kr.ac.twoportal.dto.RegisterListDto;
import kr.ac.twoportal.dto.RegisteredCountDto;
import kr.ac.twoportal.service.ExamService;
import kr.ac.twoportal.service.LectureListService;
import kr.ac.twoportal.vo.LectureList;
import kr.ac.twoportal.vo.TestQuestion;
import kr.ac.twoportal.vo.TestStudentCheck;

@Controller
@RequestMapping("/student/exam")
public class ExamController {

	@Autowired
	private ExamService examService;
	
	@Autowired
	private LectureListService lectureListService;
	
	@GetMapping("/examMain.hta")
	public String examMain(@RequestParam(value = "examStatus", required = false, defaultValue = "") String examStatus, Model model, HttpSession session) {
		
		System.out.println("examStatus는" + examStatus);
		
		LoginInfo student = (LoginInfo) session.getAttribute("loginInfo");
		int stuNo = student.getStudent().getNo();
		
		List<RegisterListDto> registerList = lectureListService.getLectureListByStuNo(stuNo);
		model.addAttribute("registerList", registerList);
		System.out.println("registerList는 : " + registerList);
		
		if (examStatus == null) {
			return "student/exam/examMain";
		} else if (examStatus.equals("complete")) {
			model.addAttribute("examStatus", "complete");
		} else if (examStatus.equals("failure")) {
			model.addAttribute("examStatus", "failure");
		}
		return "student/exam/examMain";
	}
	
	@GetMapping("/checkExamTerm.hta")
	public String checkExamTerm() {
		return "student/exam/checkExamTerm";
	}
	
	@RequestMapping("/getTestQuestions.hta")
	@ResponseBody
	public List<TestQuestion> getTestQuestions(@RequestParam(value="testInfoNo", required = false) int testInfoNo) {
		return examService.getTestQuestionsByTestInfoNo(testInfoNo);
	}
	
	@RequestMapping("/finishExam.hta")
	@ResponseBody
	public Map<String, Object> finishExam(@RequestParam(value="testInfoNo", required = false) int testInfoNo,
										@RequestParam(value="answerArray[]", required = false) int[] answerArray,
										HttpSession session) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		LoginInfo student = (LoginInfo) session.getAttribute("loginInfo");
		int stuNo = student.getStudent().getNo();
		
		try {
			for (int i=0; i<20; i++) {
				TestStudentCheck item = new TestStudentCheck();  
				item.setStuNo(stuNo);
				item.setTestInfoNo(testInfoNo);
				item.setTestNo(i+1);
				item.setQuestionStudentCheck(answerArray[i]);
				examService.insertStudentCheck(item);
				
				System.out.println("학생이 체크한 번호 for문내에서 하나씩 : " + answerArray[i]);
			}
			resultMap.put("testStatus", "success");
			
			// 시험점수 계산해서 결과테이블에 넣기
			// 테이블 업데이트 : 정답이면 Y로바뀐다.
			// result 테이블에 최종저장하기.
			TestStudentCheck stuNoAndTestInfoNo = new TestStudentCheck();
			stuNoAndTestInfoNo.setStuNo(stuNo);
			stuNoAndTestInfoNo.setTestInfoNo(testInfoNo);
			
			examService.checkAllAnswers();
			int testScore = examService.getTestScoreByStudentCheck(stuNoAndTestInfoNo);
			
			Map<String, Object> insertScoreMap = new HashMap<String, Object>();
			insertScoreMap.put("stuNo", stuNo);
			insertScoreMap.put("testInfoNo", testInfoNo);
			insertScoreMap.put("testScore", testScore);
			
			examService.insertStudentScoreByTestStudentCheck(insertScoreMap);
			System.out.println("성공적으로 시험응시완료/점수계산하여 테이블에 저장완료");
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("testStatus", "fail");
			System.out.println("저장에 실패하였다.");
		}
		
		// 정답여부 불러와서 점수 계산
		// 시험결과 테이블에 점수 저장
		// 응시여부 Y로 변경
		
		// 필요 param : 학생번호, 시험번호(testInfoNo)
		return resultMap;
	}
	
}
