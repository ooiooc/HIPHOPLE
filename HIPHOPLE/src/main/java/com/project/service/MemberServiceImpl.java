package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.project.domain.MemberVO;
import com.project.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	MemberMapper memapper;

	@Override
	public MemberVO login(MemberVO member) {
		return memapper.login(member);
	}

	@Override
	public void join(MemberVO vo) {
		memapper.join(vo);
		
	}

	@Override
	public int idChk(String userid) {
		return memapper.idChk(userid);
	}

	@Override
	public List<MemberVO> memberList() {
		return memapper.memberList();
	}

	@Override
	public MemberVO memberInfo(MemberVO vo) {
		return memapper.memberInfo(vo);
	}

	@Override
	public void updateMember(MemberVO member) {
		memapper.updateMember(member);
	}

}
