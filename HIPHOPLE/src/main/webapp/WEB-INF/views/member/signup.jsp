

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join – HIPHOPLE</title>
<script type="text/javascript" src="../resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="../resources/js/signup.js"></script>
<link rel="stylesheet" type="text/css" href="../resources/css/member.css"/>
</head>
<body>
	
	<%@include file="../include/header2.jsp"%>
	<div class="joinwrap">
	<h1 class="category_signup">CREATE NEW ACCOUNT</h1>
	<!-- <div class="container"> -->
	
	<!-- <form action="/hiphople/member/join" method="post" onsubmit="return checkmem()"> -->
	<form action="/hiphople/member/join" method="post" onsubmit="return checkmem()">
	<table class="signupform">
		<tr>
			<td class="signup_label"><label class="signup_name">아이디</label><br>
			<input class="signup_input" type="text" name="userid" id="userid" maxlength="12" autofocus>
			<!-- <input class="duid_input" type="button" id="checkId" value="중복확인"><br> -->
			<!-- 유효성 검사 메세지 -->
			<label id="idmsg" class="msg"></label></td>
		</tr>
		
		<tr>
			<td class="signup_label"><label class="signup_name">비밀번호</label><br>
			<input class="signup_input" type="password" name="userpw" id="userpw"><br>
			<!-- 유효성 검사 메세지 -->
			<label id="pwmsg" class="msg"></label></td>
		</tr> 
		
		<tr>
			<td class="signup_label"><label class="signup_name">비밀번호 확인</label><br>
			<input class="signup_input" type="password" id="repw"><br>
			<!-- 유효성 검사 메세지 -->
			<label id="repwmsg" class="msg"></label></td>
		</tr> 
		
		<tr>
			<td class="signup_label"><label class="signup_name">이름</label><br>
			<input class="signup_input" type="text" name="username" id="name"></td>
		</tr>
		
		<tr>
			<td class="signup_label"><label class="signup_name">Email</label><br>
			<input class="signup_input" type="text" name="email" id="email">
			<!-- 유효성 검사 메세지 -->
			<label id="emailmsg" class="msg"></label></td>
		</tr>
		
		<tr>
			<td class="signup_btnbox">
			<!-- <input type="submit" onclick="location.href='/'" value="회원가입"> -->
			<input type="submit" value="회원가입">
			</td>
		</tr>
	</table>
	
	<!-- csrf.token값을 로그인 정보와 같이 넘겨줘야 post가능 -->
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	
	</form>
	</div>
	<%@include file="../include/footer.jsp"%>
	
</body>
</html>