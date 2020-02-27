package kr.ac.twoportal.job;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import kr.ac.twoportal.dao.LectureCancelDao;
import kr.ac.twoportal.dao.LectureDao;
import kr.ac.twoportal.dto.LectureandCancelDto;
import kr.ac.twoportal.vo.Lecture;
import kr.ac.twoportal.vo.LectureCancel;

@Component
public class StatusChangeJob {

	@Autowired
	private LectureDao lectureDao;
	@Autowired
	private LectureCancelDao lectureCancelDao;
	
	
	@Scheduled(cron = "0 0/1 * * * *")
	public void execute() {
		
		// 강의상태가 허용이고, 강의시작날짜가 현재 날짜보다 지났을 때  ---> 진행중으로 바뀜 
		List<Lecture> lectures = lectureDao.getLectureByStatusAndDate();
		if (!lectures.isEmpty()) {
			for (Lecture lect : lectures) {
				lect.setStatus("진행중");
				lectureDao.updateLecture(lect);
				System.out.println("강의번호 : [" + lect.getNo() + "] 허용 --> 진행중");
			}
		}
		
		// 강의상태가 진행중이고, 휴강 시작 날짜가 현재 날짜보다 지났을 때  ---> 휴강중으로 바뀜 
		List<LectureandCancelDto> lectureStartCancels = lectureDao.getLectureAndCancelStartByStatusAndDate();
		if (!lectureStartCancels.isEmpty()) {
			for (LectureandCancelDto lect : lectureStartCancels) {
				
				Lecture lecture = lectureDao.getLectureByNo(lect.getLectNo());
				lecture.setStatus("휴강중");
				lectureDao.updateLecture(lecture);
				
				System.out.println("강의번호 : [" + lect.getLectNo() + "] 진행중 --> 휴강중");
			}
		}
		
		// 강의상태가 휴강중이고, 휴강 종료 날짜가 현재 날짜보다 지났을 때 ---> 진행중으로 바뀜 
		List<LectureandCancelDto> lectureEndCancels = lectureDao.getLectureAndCancelEndByStatusAndDate();
		if (!lectureEndCancels.isEmpty()) {
			for (LectureandCancelDto lect : lectureEndCancels) {
				
				Lecture lecture = lectureDao.getLectureByNo(lect.getLectNo());
				lecture.setStatus("진행중");
				lectureDao.updateLecture(lecture);
				
				// 휴강이 완전히 끝났을 때 
				LectureCancel lectureCancel = lectureCancelDao.getLectureCancelByNo(lect.getCacellNo());
				lectureCancel.setIsCheck("check");
				lectureCancelDao.updateLectureCancel(lectureCancel);
				
				System.out.println("강의번호 : [" + lect.getLectNo() + "] 휴강중 --> 진행중");
			}
		}
		
		// 강의상태가 진행중, 휴강중이고, 시험 종료일자가 지났을 때 --> 종료 로 바뀜
		List<Lecture> lectureTests = lectureDao.getLectureAndTestByStatusAndDate();
		if (!lectureTests.isEmpty()) {
			for (Lecture lect : lectureTests) {
				
				lect.setStatus("종료");
				lectureDao.updateLecture(lect);
				System.out.println("강의번호 : [" + lect.getNo() + "] 진행중, 휴강중 -> 종료");
			}
		}
		
	}
	
}
