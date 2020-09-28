package com.project.service;

import java.util.List;

import com.project.domain.MemberVO;

public interface MemberService {

	//회원가입 
	public void join(MemberVO vo);
	
	//권한 설정
	public void insertAuth(MemberVO vo);
		
	//로그인 정보 조회
	public MemberVO login(MemberVO member);
	
	//아이디 중복체크
	public int idChk(String userid);
	
	//회원 목록 조회
	public List<MemberVO> memberList();
	
	//회원 정보 수정
	public void updateMember(MemberVO member);
	
	//회원 정보 조회
	public MemberVO memberInfo(MemberVO vo);
	
	//로그인 패스워드 암호화
	public MemberVO loginBcrypt(String userid);
	
	//회원 탈퇴
	public void deleteMember(MemberVO vo);
	
	//임시비밀번호 생성 변경
	public void newPassword(MemberVO vo);
	
	//임시 비밀번호 생성
	public String getTempPassword();
		
	//이메일 계정조회
	public int findPass(String email);
}
