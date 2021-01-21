<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- security taglib 사용 선언 -->
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login – HIPHOPLE</title>
<script type="text/javascript" src="../resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="../resources/js/login.js"></script>
<link rel="stylesheet" type="text/css" href="../resources/css/member.css"/>
<link rel="stylesheet" type="text/css" href="../resources/css/reset.css"/>

<script>
	/*
	let msg = '${msg}';
	
	if(msg != ""){
		alert(msg);
	}
	*/
</script>

<!-- google -->
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id" content="464833568748-k6hh6jd23hrbml8ai9g52fkl8trocou4.apps.googleusercontent.com">
</head>
<body>
	<%@include file="../include/header2.jsp"%>
	<div class="loginwrap">
	<h2 class="category_login">LOGIN</h2>
	<!-- form action은 security의 login-processing-url과 동일하게 설정 -->
	<form name="login" action="/hiphople/login" method="post" onsubmit="return checklogin()" >
	<!-- <form name="login" method="post" > -->
	<table class="loginform">
		<tr>
			<td class="login_label" id="idlb"><label class="loginlb">아이디</label>
			<!-- input name은 security의 user-name-parameter로 설정 -->
		</tr>
		<tr>
			<td class="login_label" id="loginip"><input class="loginbtn" id="userid" type="text" name="userid"></td>
		</tr>
		<tr>
			<td id="idpwlb"></td>
		</tr>
		<tr>
			<td class="login_label" id="pwlb"><label class="loginlb" id="pwlb">비밀번호</label>
		</tr>
		<tr>
			<td class="login_label" id="loginip"><input class="loginbtn" id="userpw" type="password" name="userpw"></td>
		</tr>	
		<tr>
			<td class="login_sbtn" colspan="2">
			<span class="rmme"><input type="checkbox" id="rememberMe" name="remember-me" value="true">&nbsp;로그인 유지</span>&emsp;&emsp;&emsp;&emsp;&emsp;
			<span class="findidpw"><a href="/hiphople/member/searchPassview">비밀번호 찾기</a></span>
			<!-- <span class="findidpw"><a href="/hiphople/member/searchID">아이디 찾기/</a></span> -->
			</td>
		</tr>	
		<tr>
			<td class="login_btn" colspan="2">
			<input class="login_submit" id="loginsub" type="submit" value="로그인" id="joinBtn" onclick="return checklogin()">
			<input class="login_submit" id="signupbtn" type="button" value="회원가입" onclick="location.href='/hiphople/member/signup'"/>
			</td>
		</tr>
		<!-- login with google -->
		<tr>
			<td class="google" colspan="2">
			<input class="googleLogin" id="googleLogin" type="submit" value="Google로 계속하기" id="googleLogin">
			</td>
		</tr>
		<!-- <tr>
			<td class="g-signin2" data-onsuccess="onSignIn"></td>
		</tr> -->
	</table>
	
	<!-- <div style="text-align: center" class="g-signin2" data-onsuccess="onSignIn"></div> -->
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>	
	</form>
	
	</div><!-- end wrap -->
	
	<%@include file="../include/footer.jsp"%>
		
</body>
</html>