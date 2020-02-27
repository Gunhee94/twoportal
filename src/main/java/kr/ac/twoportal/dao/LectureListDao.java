package kr.ac.twoportal.dao;


import java.util.List;
import java.util.Map;

import kr.ac.twoportal.dto.CartDayAndTime;
import kr.ac.twoportal.dto.RegisterCartDto;
import kr.ac.twoportal.dto.RegisterListDto;
import kr.ac.twoportal.dto.RegisteredCountDto;
import kr.ac.twoportal.dto.SubNoAndLectTimeNo;

import java.util.List;


import kr.ac.twoportal.vo.LectureList;

public interface LectureListDao {

	LectureList getLectureListBylectstuNos(LectureList lectureList);

	// ------------- 수강신청
	// JH : 수강신청화면에 뿌릴 자료 불러오기
	List<RegisterListDto> getLectureListByMajorAndDeptNoAndYear(Map<String, Object> criteria);

	// JH : 수강신청테이블에 강의1개 저장
	void insertOneLecture(LectureList lectureList);
	
	// JH : 학생번호로 수강신청List불러오기
	List<RegisterListDto> getLectureListByStuNo(int stuNo);
	
	// JH : 학생번호로 총신청과목,신청학점 불러오기
	RegisteredCountDto getSubCountAndCreditCountByStuNo(int stuNo);
	
	// JH : 학생번호와 강의번호로 수강리스트에 있는 과목 한개 삭제하기
	void deleteOneLecture(Map<String, Object> criteria);
	
	// ----------- 장바구니
	// JH : 선택강의 1개를 장바구니테이블에 담기
	void insertOneCart(RegisterCartDto registerCartDto);
	
	// JH : 강의하나선택하여 요일,시간표 불러오기
	List<CartDayAndTime> getLectureInfoByLectNo(int lectNo);
	
	// JH : 학생번호로 장바구니목록 불러오기
	List<RegisterListDto> getCartListByStuNo(int stuNo);
	
	// JH : 학생번호,강의번호로 장바구니에 있는 강의1개 삭제
	void deleteOneCart(Map<String, Object> criteria);
	
	// JH : 강의번호로 과목번호,강의시간번호 불러오기
	List<SubNoAndLectTimeNo> getSubNoAndLectTimeNoByLectNo(int lectNo);
	
	List<LectureList> getLecturListsByLectNo(int lectNo);

	List<LectureList> getLectureListByLecNo(int lecNo);

	List<LectureList> getLecturListsByListNo(int listNo);

	LectureList getLecturListByListNo(int listNo);


}
