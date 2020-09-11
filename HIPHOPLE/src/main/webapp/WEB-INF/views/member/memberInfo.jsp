<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 페이지</title>
<script type="text/javascript" src="../resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="../resources/js/memberInfo.js"></script>
<link rel="stylesheet" type="text/css" href="../resources/css/memberInfo.css"/>
<link rel="stylesheet" type="text/css" href="../resources/css/reset.css"/>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

</head>
<body>
	
	<h1>${member.username}님 회원정보</h1>
	<a href="/hiphople/">메인</a>
	<a href="/hiphople/member/logout">로그아웃</a>
	<hr>
	
	
	<form role="form" action="/hiphople/member/updateMember" method="post">
		
		<table>
		<tr>
			<td><label class="">아이디</label></td>
			<td><input type="text" name="userid" id="userid" value="${member.userid}" readonly="readonly"></td>
		</tr>
		
		<tr>
			<td><label class="">비밀번호</label></td>
			<td><input type="password" name="userpw" id="userpw" value="${member.userpw}"></td>
		</tr>
			
		<tr>	
			<td><label>이름</label></td>
			<td><input type="text" name="username" id="username" value="${member.username}"></td>
		</tr>
		
		<tr>
			<td><label>이메일</label></td>
			<td><input type="text" name="email" id="email" value="${member.email}"></td>
		</tr>
		
		<tr>
			<td colspan="2" class="updateBtn" >
				<!-- null값 있을 경우 정보를 빠짐없이 기입해주세요 msg 출력 -->
				<p style="color: red; font-size: 12px;">${msg}</p>
				<button class="update" type="submit" id="submit">회원정보수정</button>&emsp;
				<button class="cancel" type="reset">취소</button>
			</td>
		</tr>
		</table>
	
	</form>
	
</body>
</html>