package com.project.service;

import java.util.List;

import com.project.domain.Criteria;
import com.project.domain.MemberVO;

public interface MemberService {

	//회원가입 
	public void join(MemberVO vo) throws Exception;
	
	//권한 설정
	public void insertAuth(MemberVO vo);
		
	//로그인 정보 조회
	public MemberVO login(String userid);
	
	//아이디 중복체크
	public int idChk(String userid);
	
	//이메일 중복체크
	public int checkEmail(String email);
	
	//회원 목록 조회
	public List<MemberVO> memberList(Criteria cri);
	
	//전체 회원 수
	public int memberTotal();
	
	//회원관리 페이지 카운팅
	public int meminfoCount(Criteria cri);
	
	//회원 정보 수정
	public void updateMember(MemberVO member);
	
	//회원 정보 조회
	public MemberVO memberInfo(MemberVO vo);
	
	//로그인 패스워드 암호화
	public MemberVO loginBcrypt(String userid);
	
	//패스워드 체크
	public int passCheck(MemberVO vo);
	
	//회원 탈퇴
	public void deleteMember(MemberVO vo);
	
	//임시비밀번호 생성 변경
	public void newPassword(MemberVO vo);
	
	//임시 비밀번호 생성
	public String getTempPassword();
		
	//이메일 계정조회
	public int findPass(String email);
	
	//이메일 인증여부 authstatus 업데이트(인증된 계정 활성화)
	public void updateAuth(MemberVO vo);
	
	//이메일 인증여부 조회
	public MemberVO checkAuth(MemberVO vo);
		
	//로그인 authstatus 조회 (비활성화 계정일 경우 로그인 제한)
	public String loginAuth(String userid); 
	 
}
