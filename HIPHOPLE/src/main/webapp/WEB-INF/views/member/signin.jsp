<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- security taglib 사용 선언 -->
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<script type="text/javascript" src="../resources/js/jquery-3.5.1.js"></script>
<link rel="stylesheet" type="text/css" href="../resources/css/login.css"/>
<link rel="stylesheet" type="text/css" href="../resources/css/reset.css"/>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<%@include file="../include/header2.jsp"%>
<script>

	let msg = '${msg}';
	
	if(msg != ""){
		alert(msg);
	}
	
</script>
<!-- google -->
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id" content="464833568748-k6hh6jd23hrbml8ai9g52fkl8trocou4.apps.googleusercontent.com">

</head>
<body>
	
	<h2 class="category_login">로그인</h2>
	<!-- form action은 security의 login-processing-url과 동일하게 설정 -->
	<form action="/hiphople/login" method="post">
	<table class="loginform">

	<tr>
		<td class="login_label">ID</td>
		<!-- input name은 security의 user-name-parameter로 설정 -->
		<td><input class="loginbtn" type="text" name="userid" placeholder="아이디"></td>
	</tr>
	<tr>
		<td class="login_label">Password</td>
		<td><input class="loginbtn" type="password" name="userpw" placeholder="비밀번호"></td>
	</tr>
	
	<tr>
		<td class="login_btn" colspan="2">
		<input class="login_submit" type="submit" value="로그인" id="joinBtn">
		</td>
	</tr>
	<tr>
		<td class="login_sbtn" colspan="2">
		<!-- 로그인 유지 remember-me 사용유무 -->
		<input type="checkbox" id="rememberMe" name="remember-me" value="true">&nbsp;Remember me&emsp;&emsp;&emsp;&emsp;&emsp;
		<!-- 아이디 비밀번호 찾기 -->
		<span><a href="/hiphople/member/searchID">아이디 찾기</a>/<a href="/hiphople/member/searchPassview">비밀번호 찾기</a></span>
		</td>
	</tr>

	</table>
	
	<div style="text-align: center" class="g-signin2" data-onsuccess="onSignIn"></div>
	
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
	</form>
	
	<!-- 구글 로그인 -->
	<script type="text/javascript">
	
    //구글 로그아웃
    function signOut() {
        var auth2 = gapi.auth2.getAuthInstance();
        auth2.signOut().then(function(){
      console.log('User signed out.'); 
            });
        auth2.disconnect();
      }

	//구글 로그인
	function onSignIn(googleUser) {
    // Useful data for your client-side scripts:
    var profile = googleUser.getBasicProfile();
    console.log("ID: " + profile.getId()); // Don't send this directly to your server!
    console.log('Full Name: ' + profile.getName());
    console.log('Given Name: ' + profile.getGivenName());
    console.log('Family Name: ' + profile.getFamilyName());
    console.log("Image URL: " + profile.getImageUrl());
    console.log("Email: " + profile.getEmail());
    
    var name = profile.getEmail();
    
    // The ID token you need to pass to your backend:
    var id_token = googleUser.getAuthResponse().id_token;
    console.log("ID Token: " + id_token);
		if (name !== null){
		    window.location.replace("http://" + window.location.hostname + ( (location.port==""||location.port==undefined)?"":":" + location.port) + "/hansub_project/home?name="+name);
		} else if (name == null){
		    
		    window.location.replace("http://" + window.location.hostname + ( (location.port==""||location.port==undefined)?"":":" + location.port) + "/hansub_project/home);
		}
		
	}
	</script>
	
	
</body>
</html>