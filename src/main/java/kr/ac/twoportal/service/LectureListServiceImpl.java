package kr.ac.twoportal.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.twoportal.dao.LectureListDao;
import kr.ac.twoportal.dto.CartDayAndTime;
import kr.ac.twoportal.dto.RegisterListDto;
import kr.ac.twoportal.dto.RegisteredCountDto;
import kr.ac.twoportal.dto.SubNoAndLectTimeNo;
import kr.ac.twoportal.vo.LectureList;

@Service
public class LectureListServiceImpl implements LectureListService {

	@Autowired
	private LectureListDao lectureListDao;

	// ----------수강신청
	// JH : 수강신청화면에 뿌릴 자료 불러오기
	@Override
	public List<RegisterListDto> getLectureListByMajorAndDeptNoAndYear(Map<String, Object> criteria) {
		List<RegisterListDto> resultList = new ArrayList<RegisterListDto>();
		List<RegisterListDto> list = lectureListDao.getLectureListByMajorAndDeptNoAndYear(criteria);
		
		int prevLectNo = 0;
		RegisterListDto vo = null;
		for (RegisterListDto dto : list) {
			if (dto.getLectNo() != prevLectNo) {
				if (vo != null) {
					resultList.add(vo);
				}
				vo = new RegisterListDto();
				prevLectNo = dto.getLectNo();
				
				BeanUtils.copyProperties(dto, vo);
				CartDayAndTime timeTable = new CartDayAndTime(dto.getLectDay(), dto.getFirstPeriod(), dto.getSecondPeriod(), dto.getThirdPeriod());
				
				vo.addTimeTables(timeTable);
			} else {
				CartDayAndTime timeTable = new CartDayAndTime(dto.getLectDay(), dto.getFirstPeriod(), dto.getSecondPeriod(), dto.getThirdPeriod());
				vo.addTimeTables(timeTable);
			}			
			
		}
		if (vo != null) {
			resultList.add(vo);
		}
		
		return resultList;
	}
	
	// JH : 수강신청테이블에 강의1개 저장
	@Override
	public void insertOneLecture(LectureList lectureList) {
		lectureListDao.insertOneLecture(lectureList);
	}
	
	// JH : 학생번호로 수강신청List불러오기
	@Override
	public List<RegisterListDto> getLectureListByStuNo(int stuNo) {
		return lectureListDao.getLectureListByStuNo(stuNo);
	}

	// JH : 학생번호로 총신청과목,신청학점 불러오기
	@Override
	public RegisteredCountDto getSubCountAndCreditCountByStuNo(int stuNo) {
		return lectureListDao.getSubCountAndCreditCountByStuNo(stuNo);
	}

	// JH : 학생번호와 강의번호로 수강리스트에 있는 과목 한개 삭제하기
	@Override
	public void deleteOneLecture(Map<String, Object> criteria) {
		lectureListDao.deleteOneLecture(criteria);
	}

	// ----------장바구니
	@Override // JH : 선택강의 1개를 장바구니테이블에 담기
	public void insertOneCart(kr.ac.twoportal.dto.RegisterCartDto registerCartDto) {
		lectureListDao.insertOneCart(registerCartDto);
	}

	@Override // JH : 강의하나선택하여 요일,시간표 불러오기
	public List<kr.ac.twoportal.dto.CartDayAndTime> getLectureInfoByLectNo(int lectNo) {
		return lectureListDao.getLectureInfoByLectNo(lectNo);
	}

	/*
	 * @Override // JH : 학생번호로 장바구니목록 불러오기 public List<RegisterListDto>
	 * getCartListByStuNo(int stuNo) { return
	 * lectureListDao.getCartListByStuNo(stuNo); }
	 */
	
	@Override // JH : 학생번호로 장바구니목록 불러오기
	public List<RegisterListDto> getCartListByStuNo(int stuNo) {
		List<RegisterListDto> resultList = new ArrayList<RegisterListDto>();
		List<RegisterListDto> list = lectureListDao.getCartListByStuNo(stuNo);
		
		int prevLectNo = 0;
		RegisterListDto vo = null;
		for (RegisterListDto dto : list) {
			if (dto.getLectNo() != prevLectNo) {
				if (vo != null) {
					resultList.add(vo);
				}
				vo = new RegisterListDto();
				prevLectNo = dto.getLectNo();
				
				BeanUtils.copyProperties(dto, vo);
				CartDayAndTime timeTable = new CartDayAndTime(dto.getLectDay(), dto.getFirstPeriod(), dto.getSecondPeriod(), dto.getThirdPeriod());
				
				vo.addTimeTables(timeTable);
			} else {
				CartDayAndTime timeTable = new CartDayAndTime(dto.getLectDay(), dto.getFirstPeriod(), dto.getSecondPeriod(), dto.getThirdPeriod());
				vo.addTimeTables(timeTable);
			}			
			
		}
		if (vo != null) {
			resultList.add(vo);
		}
		return resultList;
	}
	
	@Override // JH : 학생번호,강의번호로 장바구니에 있는 강의1개 삭제
	public void deleteOneCart(Map<String, Object> criteria) {
		lectureListDao.deleteOneCart(criteria);
	}

	@Override // JH : 강의번호로 과목번호,강의시간번호 불러오기
	public List<SubNoAndLectTimeNo> getSubNoAndLectTimeNoByLectNo(int lectNo) {
		return lectureListDao.getSubNoAndLectTimeNoByLectNo(lectNo);
	}
}
