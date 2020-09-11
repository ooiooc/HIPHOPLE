package com.project.hiphople;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.service.MemberService;
import com.project.domain.MemberVO;
import com.project.hiphople.MemberController;

@Controller
@RequestMapping("member")
public class MemberController {

	public static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService meservice;
	
	//회원가입 화면 폼  ===============================================
	@RequestMapping(value = "signup", method = RequestMethod.GET)
	public void memberGet() {
		logger.info("회원가입 폼으로 이동");
	}
	
	//회원가입 처리  =================================================
	@RequestMapping(value = "join", method = RequestMethod.POST)
	public void memberPost(MemberVO vo) {
		meservice.join(vo); //service불러오기

	}
	
	//회원가입 성공 화면
	@RequestMapping(value = "joinOk", method = RequestMethod.GET)
	public String joinGet() {
		logger.info("회원가입 정보 확인 get");
		return "member/joinOk";
	}
	
	//아이디 중복체크  =================================================
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
			
	}//end 아이디 중복체크	
	
	
	//로그인 화면 폼  =================================================
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public void loginGet() throws Exception{
		logger.info("로그인 화면 이동");
	}
	
	
	//로그인 기능 ====================================================
	@RequestMapping(value = "loginPost", method = RequestMethod.POST)
	public String loginPost(MemberVO member, Model model, HttpServletRequest request) throws Exception{
		
		HttpSession session = request.getSession();
		
		logger.info("로그인 처리");
		
		MemberVO vo = meservice.login(member);
		
		//만약에 interceptor를 사용하지 않고 로그인 처리를 하고자 할 때는 아래처럼 작성할 것
		if(vo != null ) { //로그인이 되었으면
			
			session.setAttribute("login", vo); 
			logger.info("세션 값은 " + session.getAttribute("login")); //"login"값에 로그인 정보 담겨있음
			
			return "redirect:/";
		
			}else{ //로그인이 되어있지 않으면, login.jsp로 이동
				session.removeAttribute("login");
				return "redirect:/member/login";
		}

	}//end 로그인처리
	
	
	/*로그인 처리 후 화면 (로그인 값을 가지고 있는 Session test)
	@RequestMapping(value = "loginOk", method = RequestMethod.GET)
	public String loginOk(MemberVO member, Model model, HttpSession session) throws Exception{
		logger.info("로그인성공성공");
		session.getAttribute("userid");
		return "/member/loginOk";
	}*/
	

	//회원정보 화면
	@RequestMapping(value = "memberInfo", method = RequestMethod.GET)
		public void infoGet(@ModelAttribute("userid") MemberVO vo, Model model, HttpSession session) {
		
		logger.info("회원정보 조회" + vo);
		
		session.getAttribute("userid");
		
		model.addAttribute("member", meservice.memberInfo(vo));
		
	}
	
	//회원정보 수정
	@RequestMapping(value = "updateMember", method = RequestMethod.POST)
		public String updatePost(Model model, MemberVO member, HttpSession session, RedirectAttributes rttr) throws Exception{
		
		logger.info("회원정보 "+ member);
		
		meservice.updateMember(member);
		
		rttr.addFlashAttribute("member",member);
		
		rttr.addFlashAttribute("msg", "회원정보 수정완료!");
			
		return "redirect:/member/memberInfo?userid="+ member.getUserid();
		
	}
	
	//로그아웃
	
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(MemberVO member, Model model, HttpSession session) {
		session.invalidate();		
		//session.setAttribute("loginId",null); 으로 해줘도 된다.
		return "redirect:/";
	}
	/*
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(@ModelAttribute("member") MemberVO member, Model model, HttpServletRequest request) {
		
		request.getSession().removeAttribute("member");
		
		return "redirect:/";
	
	}*/
	
}//end	
