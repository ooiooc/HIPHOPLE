<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body{
	font-family: 'Apple SD Gothic Neo';
}
</style>
<%@include file="../include/header2.jsp"%>
</head>
<body>
	<form name="formID" id="formID" class="searchPass" role="form" action="/hiphople/member/sendPass.do" method="post">
			<div class="passwrap">
				<div class="findpwForm">
		            <h2 class="passtitle">아이디 찾기</h2>
		            <p class="passtext">임시 비밀번호 발급을 위해 회원가입 시 등록하신 이메일 주소를 입력해 주세요<br>
		         
		            <div class="passinfo">
		                <!-- <input class="findpass" type="text" id="sender" name="sender" placeholder="보낸이"><br>
		                <input class="findpass" type="text" id="sendMail" name="sendMail" placeholder="보낸이 메일"><br> -->
		                <!-- 가입 아이디 입력란 -->
		                <input class="findpass" type="text" id="receiveMail" name="receiveMail" placeholder="가입 아이디"><br>
		                <!-- 가입 이메일 입력란 -->
		                <input class="findpass" type="text" id="receiveMail" name="receiveMail" placeholder="이메일"><br>
		                <!-- <input class="findpass" type="text" id="subject" name="subject" placeholder="제목"><br>
		                <textarea class="findpasstx" rows="5" cols="80" id="content" name="content" placeholder="내용"></textarea> -->
		                <p>가입하신 아이디와 이메일 정보를 정확하게 입력해 주세요.</p>
		                
		            </div>
		 
		            <div>
		                <button type="button" id="emailbtn">메일 보내기</button>
		                <button onclick="javascript:sendEMail();">AJAX 전송</button><br/>
		                <p>결과</p> 
		                <div class="emailResult"> </div>
		                <span style="color:red;">${message}</span>
		            </div>
	            </div><!-- findpwForm -->
            </div>
            	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
</body>
</html>