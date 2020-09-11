package com.project.mapper;

import java.util.List;

import com.project.domain.MemberVO;

public interface MemberMapper {
	
	//회원가입
	public void join(MemberVO vo);
	
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

}