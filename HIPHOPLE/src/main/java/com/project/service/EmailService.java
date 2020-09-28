package com.project.service;

import com.project.domain.MemberVO;
import com.project.email.Email;

public interface EmailService {
	
	//메일 전송
	public void sendMail(Email email);
	
	//임시비밀번호 생성한 후 비밀번호 변경
	//public void updatePassword(MemberVO vo);
	 
	
	
	
}
