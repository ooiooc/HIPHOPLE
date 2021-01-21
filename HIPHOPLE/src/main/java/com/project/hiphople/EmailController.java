package com.project.hiphople;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.domain.MemberVO;
import com.project.domain.Email;
import com.project.service.EmailService;
import com.project.service.MemberService;

@Controller
public class EmailController {
	
	@Autowired
	MemberService meservice;
	
	@Autowired
	EmailService emailService;
	
	@Autowired 
	Email email;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	//임시 비밀번호 메일 전송 (DTO에 사용자가 원하는 내용과 제목을 저장)
	@RequestMapping(value="/member/sendPass.do", method = RequestMethod.POST)
	public String send(@RequestParam Map<String, Object> paramMap, @ModelAttribute Email email, Model model, String userid, HttpServletRequest request, MemberVO member) {
		
		//이메일 주소 받아오기
		//String tomail = (String)paramMap.get("receiveMail")
		//String memberid = request.getParameter("userid");
		String tomail = request.getParameter("receiveMail");
		//String str = emailService.getTempPassword();
		
		//일치하는 이메일이 존재하는 지 여부
		//String result = meservice.memberInfo(userid);
		
		//가입된 이메일 정보가 있을 경우 메일 전송
		if(tomail == null) {
			
		}
		
		try {
			
			email.setContent("임시 비밀번호는" + str);
			email.setReceiveMail(tomail);
			
			//비밀번호 변경
			member.setUserpw(str);
			
			emailService.sendMail(email); // email(메일관련 정보)를 sendMail에 저장함
			model.addAttribute("message", "이메일이 발송되었습니다."); // 이메일이 발송되었다는 메시지를 출력시킨다.
			
			return "member/signin";
			


		 } catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("message", "이메일 발송 실패"); // 이메일 발송이 실패되었다는 메시지를 출력
		 }
		 	return "redirect:/member/searchPassview"; // 실패했으므로 다시 write jsp 페이지로 이동함
		}	
	
}//end
