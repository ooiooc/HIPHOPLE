package com.project.hiphople;

import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.project.domain.MemberVO;
import com.project.mapper.MemberMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")

public class MemberMapperTest {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private MemberMapper membermapper;
	
	@Test
	public void testMemberInfo() {
		MemberVO member = new MemberVO();
		member.setUserid("salrang");
		
		//String userid로 넣은 경우
		//memberdao.memberRead("Salrang");
		
		MemberVO memvo = membermapper.memberInfo(member);
		logger.info("회원정보 조회(한 건) : " + membermapper.memberInfo(member));
		
	}
	
	//여러 건을 처리할 때 
	@Test
	public void testListMember() {
		List<MemberVO> memvo = membermapper.memberList();
		memvo.forEach(member->logger.info(""+member));
		//화살표 연산자 for each에서만 사용
	}
	
	//회원정보 수정
	
	@Test
	public void testUpdateMember() {
		MemberVO member = new MemberVO();
		
		member.setUserpw("1234");
		member.setUsername("제니");
		member.setUserid("Salrang");
		
		membermapper.updateMember(member);
	}
	
	//회원정보 삭제
	@Test
	public void testDeleteMember() {
		MemberVO member = new MemberVO();
		member.setUserid("Salrang");
		
		membermapper.deleteMember(member);
	}

}
