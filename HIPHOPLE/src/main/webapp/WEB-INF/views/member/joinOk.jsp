<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	<%@include file="../include/header.jsp"%>

		<section>
	    	
	    	<h3>회원가입 성공</h3>
			${login.username}님 가입을 환영합니다.
			<a href="/hiphople/member/login">지금 로그인해보세요!</a>
			
    	</section>
	
	<%@include file="../include/footer.jsp"%>
