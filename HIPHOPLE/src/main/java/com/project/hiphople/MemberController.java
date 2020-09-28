package com.project.hiphople;

import java.lang.reflect.Member;
import java.security.Principal;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.service.EmailService;
import com.project.service.FindPassService;
import com.project.service.FindPassValidator;
import com.project.service.MemberService;
import com.sun.mail.handlers.message_rfc822;
import com.google.protobuf.Service;
import com.project.domain.MemberVO;
import com.project.email.Email;
import com.project.hiphople.MemberController;
import com.project.mapper.MemberMapper;

@Controller
@RequestMapping("member")
public class MemberController {

	public static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService meservice;
	
	@Autowired
	private EmailService emailService;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	//회원가입 화면 폼 
	@RequestMapping(value = "signup", method = RequestMethod.GET)
	public void memberGet() {
		logger.info("회원가입 폼으로 이동");
	}
	
	//회원가입 처리  
	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String memberPost(MemberVO vo) {
		
		
		BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder();
		
		String encPassword = pwdEncoder.encode(vo.getUserpw());
				
		vo.setUserpw(encPassword);
		
		/* logger.info("회원가입 처리"+vo.getUserid()); */
		logger.info("암호화된 비밀번호 : "+vo.getUserpw());
		meservice.join(vo); //service불러오기
		meservice.insertAuth(vo);
		return "redirect:/";
	}
	
	//회원가입 성공 화면
	/*
	 * @RequestMapping(value = "joinOk", method = RequestMethod.GET) public String
	 * joinGet() { logger.info("회원가입 정보 확인 get"); return "member/joinOk"; }
	 */
	
	//아이디 중복체크  
	@ResponseBody
	@RequestMapping(value = "checkId/{userid}", method = RequestMethod.GET)
		public ResponseEntity<Integer> idChk(@PathVariable("userid") String userid) throws Exception{
			
		//getAjax를 이용하기 위하여 ResponseEntity 필요
		//userid count값을 불러오기 위해서 return타입을 Integer로 불러와야 한다
			
		logger.info("userid = " + userid);
			
		//int result = meservice.idChk(userid);
		//meservice.idChk(userid)
		//return new ResponseEntity<>(result, HttpStatus.OK);
			
		return new ResponseEntity<Integer>(meservice.idChk(userid),HttpStatus.OK);
			
	}
	
	
	//로그인 화면 폼 
	@RequestMapping(value = "signin", method = RequestMethod.GET)
	public void loginGet() throws Exception{
		logger.info("로그인 화면 이동");
	}
	
	
	//로그인 기능 
	/*
	@RequestMapping(value = "loginPost", method = RequestMethod.POST)
	public String loginPost(MemberVO member, HttpSession session, HttpServletRequest request,RedirectAttributes rttr) throws Exception{
		
		
		//session.getAttribute("member");
		//HttpSession session = request.getSession();
		
		MemberVO login = meservice.login(member);
		logger.info("로그인 처리"+ member.getUserpw());
		
		//이용자가 로그인할 때 입력한 비밀번호와 암호화된 비밀번호를 이용하여 비교한다
		Boolean pwdMatch = passwordEncoder.matches(member.getUserpw(), login.getUserpw());
		
		if(login != null && pwdMatch == true) { //로그인이 되었으면
			
			session.setAttribute("member", login); 
			logger.info("세션 값은**** " + session.getAttribute("member")); //"login"값에 로그인 정보 담겨있음
			
			//return "redirect:/";
		
			}else{ 
				logger.info("세션 값 : 아이디 /" + member.getUserid()+ "입력 패스워드 /" + login.getUserpw() +"암호화 패스워드 /" + member.getUserpw());
				session.setAttribute("member", null);
				rttr.addFlashAttribute("msg",false);
				
				//session.removeAttribute("login");
				//return "redirect:/member/login";
				//로그인이 되어있지 않으면, login.jsp로 이동
		}
		return "redirect:/";
	
	}
	*/
	
	//회원정보 화면
	@RequestMapping(value = "memberInfo", method = RequestMethod.GET)
		public void infoGet(@ModelAttribute("userid") MemberVO vo, Model model, HttpSession session) {

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String userid = authentication.getName(); //로그인된 username
		
		logger.info("current username : {}", userid);
		vo.setUserid(userid);
	
		model.addAttribute("member", meservice.memberInfo(vo));
		logger.info("회원정보 조회" + vo);
		
		//model.addAttribute("member", meservice.memberInfo(vo));
		//logger.info("회원정보 조회" + vo);
		//session.getAttribute("userid");
		//model.addAttribute("member", meservice.memberInfo(vo));
		
	}
	
	//회원정보 수정
	@RequestMapping(value = "updateMember", method = RequestMethod.POST)
		public String updatePost(Model model, MemberVO member, HttpSession session, RedirectAttributes rttr, String oldpw, String newPass) throws Exception{
		
		logger.info("회원정보 "+ member);
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String userid = authentication.getName(); //로그인된 username
		
		MemberVO dbuserinfo = new MemberVO();
		dbuserinfo.setUserid(userid);
		dbuserinfo = meservice.memberInfo(dbuserinfo);
		
		logger.info("데이터 베이스에 있는 로그인된 회원 정보" + dbuserinfo);
		logger.info("변경할 회원 아이디 :" + userid);

		//이용자가 로그인할 때 입력한 비밀번호와 DB에 저장된 비밀번호를 이용하여 비교(일치하면 새로운 패스워드 값 삽입)
		//member.getUserpw(); = DB에 있는 비밀번호
		Boolean pwdMatch = passwordEncoder.matches(oldpw, dbuserinfo.getUserpw());
		
		logger.info("입력한 비밀번호 :" + oldpw + "/ DB 비밀번호 :" + dbuserinfo.getUserpw());
		
		if(pwdMatch == true) {
			logger.info("비밀번호가 일치합니다");
			member.setUserpw(passwordEncoder.encode(newPass));
			logger.info("새 비밀번호" + newPass);
			meservice.updateMember(member); //정보 수정
			rttr.addFlashAttribute("member",member);
			rttr.addFlashAttribute("msg", "회원정보 수정 성공!");
			return "redirect:/member/memberInfo?userid="+ member.getUserid(); 
		}else {
		
		rttr.addFlashAttribute("member",member);
		rttr.addFlashAttribute("msg", "회원정보 수정 실패!");
		return "redirect:/member/memberInfo?userid="+ member.getUserid();
		
		}
	}//회원정보 수정 끝
	
	
 	//비밀번호 찾기 화면
 	@RequestMapping(value="/searchPassview", method = RequestMethod.GET)
 	public void searchPwForm(){
 		logger.info("비밀번호 찾기 화면");
 	}
	
 	
 	//아이디 찾기
 	@RequestMapping(value="/searchID", method = RequestMethod.GET)
 	public void searchIDForm(){
 		logger.info("아이디 찾기 화면");
 	}
 	
	
	
	//회원탈퇴 view
 	@RequestMapping(value="/withdrawal", method = RequestMethod.GET)
 	public void withdawalGet() {
 		logger.info("회원탈퇴 비밀번호 확인 페이지");
 	}

	//회원탈퇴 성공 view
 	@RequestMapping(value="/withdrwresult", method = RequestMethod.GET)
 	public String successGet() {
 		logger.info("회원탈퇴 성공 페이지");
 		return "member/withdrawalSuccess";
 	}
 	
 	//회원탈퇴 action
 	@RequestMapping(value="/withdrawal.do", method = RequestMethod.POST)
    public String withdrawal(MemberVO vo, HttpSession session, @RequestParam(value = "checkpw") String checkpw) {
 		
 		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
 		
 		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String userid = authentication.getName(); //로그인한 아이디 가져오기
		
		MemberVO dbuserinfo = new MemberVO();
		dbuserinfo.setUserid(userid);
		dbuserinfo = meservice.memberInfo(dbuserinfo);
		logger.info("데이터 베이스에 있는 로그인된 회원 정보" + dbuserinfo);
		logger.info("접속 중인 아이디 :" + userid);
		
		
		logger.info("입력한 비밀번호 :" + checkpw);
		
		
		//비밀번호 비교 
		Boolean pwdMatch = passwordEncoder.matches(checkpw, dbuserinfo.getUserpw());
			if(pwdMatch){ // 비밀번호가 맞다면 회원탈퇴 처리
				vo.setUserid(userid);
				meservice.deleteMember(vo);
				logger.info("input pw :" + checkpw + "db pw:" + dbuserinfo.getUserpw());
				session.invalidate(); //탈퇴시 로그아웃 처리
				return "redirect:/member/withdrwresult";
		
			} else { //비밀번호가 일치하지 않으면
				logger.info("비밀번호가 일치하지 않습니다");
	        	return "member/withdrawal";
	        }

		}
 	
	
 	
 	//비밀번호 찾기
 	/*
 	@RequestMapping(value="/newPassword", method = RequestMethod.POST)
 	public String findPass(MemberVO vo, RedirectAttributes redirectattr, Errors errors) {
 	    
 		//비밀번호 암호화 
 		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
 		
 		String result = null;
 		
 		//회원정보 불러오기
 		
 		
 	        
 	    }*/
 	
	//로그아웃
	//@RequestMapping(value = "logout", method = RequestMethod.GET)
	//public String logout(MemberVO member, Model model, HttpSession session) {
		//session.invalidate();		
		//session.setAttribute("loginId",null); 으로 해줘도 된다.
		//return "redirect:/";
	//}
	
 	//비밀번호 변경 update password (메일로 발송된 임시비밀번호로 해당 유저의 패스워드 변경)
	//계정확인 findPass
 	@RequestMapping(value = "findpass", method = RequestMethod.POST)
 	public String updatePw(String receiveMail, Model model, RedirectAttributes rttr) {
 		
 		int result=meservice.findPass(receiveMail);
 				
 		//회원정보가 없을때
 		if(result == 0) {
 			logger.info("회원정보가 없습니다");
 			
 		}else {
 			String newPass = meservice.getTempPassword();
 			String encodePass = passwordEncoder.encode(newPass);
 			logger.info(newPass);
 			logger.info(encodePass);
 			
 			MemberVO vo = new MemberVO();
 			vo.setEmail(receiveMail);
 			vo.setUserpw(encodePass);
 			
 			//DB 임시비밀번호로 변경
 			meservice.newPassword(vo);

 			Email email = new Email();
 			email.setReceiveMail(receiveMail);
 			email.setContent("임시 비밀번호는 " + newPass);
 			
 			emailService.sendMail(email);
 			rttr.addFlashAttribute("msg","임시 비밀번호를 이메일 ("+ receiveMail +")로 보내드렸습니다.");
 			
 		}
 		
 	 	return "redirect:/member/signin";

 	}
	
}//end
