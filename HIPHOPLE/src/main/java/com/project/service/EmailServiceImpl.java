package com.project.service;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.project.domain.MemberVO;
import com.project.email.Email;
import com.project.hiphople.EmailController;

@Service
public class EmailServiceImpl implements EmailService{

	public static final Logger logger = LoggerFactory.getLogger(EmailController.class);
	
	@Autowired
	private JavaMailSender mailSender; // 이메일 전송 객체
	
	@Autowired
	private MemberService meservice;
	
	@Override
	public void sendMail(Email email) {
		
		//보내는 사람
		String setFrom = "hiphople<shinvely90@gmail.com>";
		String setSubject = "[hiphopLE] Please reset your password";
		
		//받는 사람
		
		
		 try {
	            //이메일 객체
	            MimeMessage msg = mailSender.createMimeMessage();
	            MimeMessageHelper helper = new MimeMessageHelper(msg, false, "UTF-8");
	            
	            //받는 사람을 설정 (수신자, 받는사람의 이메일 주소 객체를 생성해서 수신자 이메일주소를 담음)
	            msg.addRecipient(RecipientType.TO, new InternetAddress(email.getReceiveMail()));
	 
	            /*
	             * createMimeMessage() : MimeMessage객체를 생성시킴 (이것을 이용해서 메시지를 구성한 뒤 메일 발송)
	             * addRecipient() : 메시지의 발신자를 설정 InternetAddress() : 이메일 주소 getReceiveMail() :수신자 이메일 주소
	             */
	 
	            // 보내는 사람(이메일주소+이름)
	            // (발신자, 보내는 사람의 이메일 주소와 이름을 담음)
	            // 이메일 발신자
	            //msg.addFrom(new InternetAddress[] { new InternetAddress(email.getSendMail(), email.getSender())});
	           
	            //보내는 사람(이메일주소.이름)
	            helper.setFrom(setFrom);
	            
	            //이메일 제목 (인코딩을 해야 한글이 깨지지 않음)
	            helper.setSubject(setSubject);
	            
	            //이메일 본문 (인코딩을 해야 한글이 깨지지 않음)
	            
	            //String str = getTempPassword();
	            //email.setContent(str);
	            //String content = "임시 비밀번호는"+ str +"<img src=http://real5781.cdn2.cafe24.com/logo/logo_white_150px.png>";
	            
	            helper.setTo(email.getReceiveMail());
	            helper.setText(email.getContent());
	            
	            //helper.setText(vo.getContents(), true); setText의 두번째 인자 값은 html을 사용한다는 뜻
	            //helper.setText("<html><body><img src='http://real5781.cdn2.cafe24.com/logo/logo_white_150px.png'></body></html>", true);
	            
//	            html로 보낼 경우            
//	            MimeMessage message = mailSender.createMimeMessage();
//	            MimeMessageHelper helper 
//	            = new MimeMessageHelper(message, true);
//	            helper.setTo("test@host.com");
//	            helper.setText("<html><body><img src='cid:identifier1234'></body></html>", true);
	            logger.info("sender : " + setFrom);
	            logger.info("subject : " + setSubject);
	            logger.info("receiver : " + email.getReceiveMail());
	            logger.info("text : " + email.getContent());
	            
	            
	         // 첨부 파일 처리
	         /*
	            if (filePath != null) {
		            File file = new File(filePath);
		            if (file.exists()) {
		            helper.addAttachment(file.getName(), new File(filePath));
		            }
	            }
	            */

		
	            // 이메일 보내기
	            mailSender.send(msg);
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }


}//끝
	
	

