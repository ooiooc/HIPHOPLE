package com.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.domain.Criteria;
import com.project.domain.MailUtils;
import com.project.domain.MemberVO;
import com.project.domain.TempKey;
import com.project.mapper.MemberMapper;
import com.sun.xml.internal.ws.config.management.policy.ManagementPrefixMapper;


@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	MemberMapper memapper;
	
	@Autowired
	JavaMailSender mailSender;
	
	@Autowired 
	EmailService emailservice;
	
	//로그인
	@Override
	public MemberVO login(String userid) {
		
		return memapper.login(userid);
		
	}
	
	//회원가입
	//@Transactional
	@Override
	public void join(MemberVO vo) throws Exception{
		memapper.join(vo);
		
		//임의의 authKey 생성, DB 저장, 이메일 발송
		//String authkey = new TempKey().getKey(50, false); // 인증키 생성
		//vo.setAuthkey(authkey); // DB에 authkey 저장
		//memapper.updateAuth(vo); 
		
		
		//String authkey = emailservice.sendAuth(vo.getEmail());
		//vo.setAuthkey(authkey);
		
		/*
		String authkey = new TempKey().getKey(50, false); 
		vo.setAuthkey(authkey);
        
		
        //authkey 메일 발송
		MailUtils sendMail = new MailUtils(mailSender);
		sendMail.setSubject("[HiphopLE] 회원가입 이메일 인증"); // 메일제목
		sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>") // 메일내용
				.append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
				.append("<a href='http://localhost:8050/hiphople/member/signupConfirm?email=") // 사용자가 인증메일 확인했을 때 클릭할 링크
				.append(vo.getEmail())
				.append("&authKey=")
				.append(authkey)
				.append("' target='_blenk'>이메일 인증 확인</a>")
			    .toString());
		sendMail.setFrom("shinvely90@gmail.com", "HiphopLE"); // 보낸이
		sendMail.setTo(vo.getEmail()); // 받는이
		sendMail.send();
		*/
	}

	//아이디 중복체크
	@Override
	public int idChk(String userid) {
		return memapper.idChk(userid);
	}

	//회원목록 리스트
	@Override
	public List<MemberVO> memberList(Criteria cri) {
		return memapper.memberList(cri);
	}
	
	//전체 회원 수
	@Override
	public int memberTotal() {
		return memapper.memberTotal();
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

	//로그인 패스워드 암호화
	@Override
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

	//패스워드 체크
	@Override
	public int passCheck(MemberVO vo) {
		return memapper.passCheck(vo);
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
	
	//회원가입 인증 완료하기 위해 authstatus 변경
	@Override
	public void updateAuth(MemberVO vo) {
		memapper.updateAuth(vo);
	}
	
	//인증키 확인(메일로 발송된 인증키와 DB의 인증키 일치하는지)
	@Override
	public MemberVO checkAuth(MemberVO vo) {
		return memapper.checkAuth(vo);
	}
	
	//이메일 중복체크
	@Override
	public int checkEmail(String email) {
		return memapper.checkEmail(email);
	}

	//로그인 Authstatus 조회
	@Override
	public String loginAuth(String userid) {
		return memapper.loginAuth(userid);
	}
	
	//회원관리 페이지 카운팅
	@Override
	public int meminfoCount(Criteria cri) {
		return memapper.meminfoCount(cri);
	}

}
