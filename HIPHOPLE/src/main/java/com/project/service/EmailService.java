package com.project.service;

import com.project.domain.MemberVO;
import com.project.domain.Email;

public interface EmailService {
	
	//임시 비밀번호 발급 메일 전송
	public void sendMail(Email email) throws Exception;
	
	//회원가입 인증메일 전송
	public String sendAuth(String email) throws Exception;
	
	//임시비밀번호 생성한 후 비밀번호 변경
	//public void updatePassword(MemberVO vo);

	
}
