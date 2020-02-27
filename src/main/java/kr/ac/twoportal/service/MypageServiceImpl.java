package kr.ac.twoportal.service;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.twoportal.dao.StudentDao;
import kr.ac.twoportal.dto.StudentMypageDto;
import kr.ac.twoportal.exception.PwdException;
import kr.ac.twoportal.vo.Student;


@Service
public class MypageServiceImpl implements MyPageService{
	@Autowired
	private StudentDao studentDao;

	@Value("${student.photo.save}")
	private String photoSaveDirectory;
	
	@Override
	public StudentMypageDto getMyPageDto(int stuNo) {
		System.out.println(studentDao.getMyPageForm(stuNo));
		return studentDao.getMyPageForm(stuNo);
	}

	@Override
	public void PwdMatchCheck(String pwd, String pwdSecond) {
		if(!pwd.equals(pwdSecond) || pwd.isEmpty() || pwdSecond.isEmpty()) {
			throw new PwdException("비밀번호 불 일치"); 
		}
	}

	@Override
	public String regCheckAndUploadImg(MultipartFile imgFile) throws IOException {
		String regImg = "^([\\S]+(\\.(?i)(jpg|png|gif|bmp))$)";
		if(imgFile.getOriginalFilename().matches(regImg)) {
			return "uploaded";
		}
		return "notUploaded";
	}
	@Override
	public void ImageUploadToDirectory(MultipartFile imgFile) throws IOException {
		FileCopyUtils.copy(imgFile.getBytes(), new File(photoSaveDirectory, imgFile.getOriginalFilename()));
	}

	@Override
	public void stuMyPageUpdate(Student student) {
		studentDao.updateStudentMypageForm(student);
	}
	
}
