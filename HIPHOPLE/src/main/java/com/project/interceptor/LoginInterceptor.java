package com.project.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.project.interceptor.LoginInterceptor;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	//LoginInterceptor
	//로그인한 사용자에 대해 postHandle()을 통해 HttpSession에 보관하는 처리
	public static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	@Override
	public void postHandle(HttpServletRequest request, 
							HttpServletResponse response, Object handler, 
							ModelAndView modelAndView) throws Exception {
		logger.info("Interseptor");
	
	//MemberController에 loginPost 메소드에 얻은 select 결과의 model 정보를 interceptor 해서 
	//session 영역에 저장 (model에 있는 userVO를 가져와서 HttpSession에서 로그인 처리
	//session을 사용하기 위해서 아래와 같이 선언해주기
	HttpSession session = request.getSession();
	
	//MemberController에 loginPost 메소드에 얻은 select 결과의 model(userVO) 정보 불러오기
	Object userVO = modelAndView.getModel().get("userVO");
	
	//세션 유지기간
	session.setMaxInactiveInterval(60*30); //세션을 30분동안 유지
	
	//==============================================================================
	
	//userVO에 정보가 있으면
	if(userVO != null) {
		logger.info("new login success");
		session.setAttribute("login", userVO); //userVO : Select한 결과 가지고 있음(아이디, 패스워드, 이름)
		
		//if(request.getParameter("useCookie") != null) {
			Cookie loginCookie = new Cookie("loginCookie", session.getId()); //쿠키 생성
			loginCookie.setPath("/");
			loginCookie.setMaxAge(60*60*24*7); //초, 분, 초, 일 = 7일동안 쿠키 보관 / 
			response.addCookie(loginCookie);
		//}
		
		response.sendRedirect("/hiphople"); //메인으로 돌아가기
		}
	
	// 세션에 userVO값 저장
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		System.out.println("pre handle......");
		return true;
	}
	
}//end
