package kr.ac.twoportal.service;


import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;


import kr.ac.twoportal.vo.Student;

@Service
public class MailServiceImpl implements MailService{

	@Autowired
	 JavaMailSender mailsender;

	@Override
	public void sendEmail(Student student) {
		final MimeMessagePreparator preparator = new MimeMessagePreparator() {
			
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				final MimeMessageHelper helper =new MimeMessageHelper(mimeMessage, true, "UTF-8");
				
				
				helper.setFrom("hong78436@gmail.com"); // recipient
                helper.setTo(student.getEmail()); //sender
                helper.setSubject("임시 비밀번호입니다"); // mail title
                helper.setText("아이디는 "+student.getId()+"    임시비밀번호는"+student.getPwd()+"입니다", true); // mail content 여기에 true는 html을 사용한다.

			}
		};
		
		mailsender.send(preparator);
		
	}
	

}
