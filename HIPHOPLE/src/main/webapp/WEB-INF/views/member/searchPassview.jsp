<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find your password – HIPHOPLE</title>
<script type="text/javascript" src="../resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="../resources/js/email.js"></script>
</head>
<body>
	<%@include file="../include/header2.jsp"%>
		<!-- commandName, modelAttribute 은 폼에 있는 요소들의 값을 채우기 위해 사용될 객체를 request로부터 찾을때 사용할 이름을 지정 -->
		<form class="searchPass" role="form" action="/hiphople/member/findpass" method="post" >
		<div class="passwrap">
		<h2 class="passtitle">비밀번호 찾기</h2>
				<div class="findpwForm">
		        <p class="passtext">임시 비밀번호 발급을 위해 회원가입 시 등록하신 이메일 주소를 입력해 주세요.<br>
		        	<!-- 가입 이메일 입력란 -->
		        	<div class="passinfo">
		                <input class="findpass" type="text" id="receiveMail" name="receiveMail" placeholder="email@domain.com">
		               	<button type="submit" id="checkEmail">임시 비밀번호 발급</button>
		                <!-- <button onclick="javascript:sendEMail();">AJAX 전송</button><br/> -->
		                <!-- msg창 -->
		                <span style="color:red;">${msg}</span>
		            </div>
	            </div><!-- findpwForm -->
        </div><!-- wrap -->
	  	</form>
        <div class="checkMsg" id="checkMsg" style="color: red"></div>
    	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
    <%@include file="../include/footer.jsp"%>	
</body>
</html>