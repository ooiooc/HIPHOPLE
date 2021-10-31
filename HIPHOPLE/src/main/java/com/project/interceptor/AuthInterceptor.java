package com.project.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import com.project.interceptor.AuthInterceptor;

public class AuthInterceptor extends HandlerInterceptorAdapter{
	
	//AuthInterceptor
	//특정 경로에 사용자가 접근하는 경우 현재 사용자가 로그인한 상태인지 체크하는 처리
	public static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		
		//session 사용 선언
		HttpSession session = request.getSession();
		//session에 로그인 정보가 없으면 (=로그인을 하지 않았으면)
		if(session.getAttribute("login") == null) {
			
			logger.info("user not logined");
			
			//로그인 안한 사용자는 글쓰기 권한이 없으므로 로그인 페이지로 이동
			response.sendRedirect("/hiphople/member/login");
			return false; //글쓰기하지 못하도록 false 값
		}
		
		//로그인한 사용자일 경우 Controller 호출
		return true;
	}
	
}
