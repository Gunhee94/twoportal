package kr.ac.twoportal.service;


import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

import kr.ac.twoportal.dto.StudentMypageDto;
import kr.ac.twoportal.vo.Student;


public interface MyPageService {
	
	StudentMypageDto getMyPageDto(int stuNo);

	void PwdMatchCheck(String pwd, String pwdSecond);

	void ImageUploadToDirectory(MultipartFile imgFile) throws IOException;

	void stuMyPageUpdate(Student student);

	String regCheckAndUploadImg(MultipartFile imgFile) throws IOException;
}
