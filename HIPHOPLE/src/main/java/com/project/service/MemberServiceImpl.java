package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.domain.MemberVO;
import com.project.mapper.MemberMapper;
import com.sun.xml.internal.ws.config.management.policy.ManagementPrefixMapper;


@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	MemberMapper memapper;
	
	//로그인
	@Override
	public MemberVO login(MemberVO member) {
		
		return memapper.login(member);
		
	}
	
	//회원가입
	@Transactional
	@Override
	public void join(MemberVO vo) {
		memapper.join(vo);
		
		
	}
	
	//아이디 중복체크
	@Override
	public int idChk(String userid) {
		return memapper.idChk(userid);
	}

	//회원목록 리스트
	@Override
	public List<MemberVO> memberList() {
		return memapper.memberList();
	}

	//회원정보 조회
	@Override
	public MemberVO memberInfo(MemberVO vo) {
		return memapper.memberInfo(vo);
	}
	
	//회원정보 수정
	@Override
	public void updateMember(MemberVO member) {
		memapper.updateMember(member);
	}

	//@Override
	public MemberVO loginBcrypt(String userid) {
		return memapper.loginBcrypt(userid);
	}
	
	//회원가입 권한 추가
	@Override
	public void insertAuth(MemberVO vo) {
		memapper.insertAuth(vo);
		
	}
	//회원탈퇴
	@Override
	public void deleteMember(MemberVO vo) {
		memapper.deleteMember(vo);
		
	}
	
	//임시비밀번호 변경
	@Override
	public void newPassword(MemberVO vo) {
		memapper.newPassword(vo);
		
	}
	//임시 비밀번호 생성
	@Override
	public String getTempPassword() {
			char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
		            'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };
		
		    String str = "";
		
			    int idx = 0;
			    for (int i = 0; i < 10; i++) {
			        idx = (int) (charSet.length * Math.random());
			        str += charSet[idx];
			    }
			    return str; //생성된 임시비밀번호
		}
	
	
	//이메일 계정 카운트
	@Override
	public int findPass(String email) {
		return memapper.findPass(email);
	}

}
