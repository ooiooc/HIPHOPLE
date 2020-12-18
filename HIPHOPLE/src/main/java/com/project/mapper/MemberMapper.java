package com.project.mapper;

import java.util.List;
import com.project.domain.MemberVO;

public interface MemberMapper {
	
	//회원가입
	public void join(MemberVO vo);

	//권한 설정
	public void insertAuth(MemberVO vo);
	
	//로그인 정보 조회
	public MemberVO login(MemberVO vo);
	
	//회원정보 수정하기 전 데이터 조회
	public MemberVO memberInfo(MemberVO vo);
	
	//전체 회원정보 조회
	public List<MemberVO> memberList();
	
	//회원정보 수정
	public void updateMember(MemberVO vo);
	
	//회원정보 삭제
	public void deleteMember(MemberVO vo);

	//아이디 중복체크
	public int idChk(String userid);
	
	//이메일 중복체크
	public int checkEmail(String email); 
	
	//로그인 패스워드 암호화
	public MemberVO loginBcrypt(String userid);
	
	//비밀번호 찾기
	public void newPassword(MemberVO vo);
	
	//임시 비밀번호 생성
	public String getTempPassword();
		
	//이메일 계정조회
	public int findPass(String email);
	
	//회원가입 인증 (authstatus 1로 변경하여 계정 활성화)
	public void updateAuth(MemberVO vo);
	
	//회원가입 인증여부 조회
	public MemberVO checkAuth(MemberVO vo);
	
	
	

}