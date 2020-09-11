<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%-- <%@ page session="false" %> --%>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>

<script type="text/javascript" src="../resources/js/jquery-3.5.1.js"></script></head>
<script type="text/javascript" src="../resources/js/home.js"></script></head>
<link rel="stylesheet" type="text/css" href="resources/css/home.css"/>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

</head>

<body>

	<h1>메인페이지</h1>
	<ul>
		<li><a href="/hiphople/member/login">로그인</a>&emsp;</li>
		<li><a href="/hiphople/member/signup">회원가입</a>&emsp;</li>
		<li><a href="/hiphople/board/list">게시판</a></li>
	</ul>
<%-- 	<c:if test=${login == null}><a href="/memeber/logout">로그인</a></c:if>
	<c:if test=${login != null}><a href="/memeber/logout">로그아웃</a></c:if> --%>
	
	<hr><br><br>
	<form action="/hiphople/member/memberInfo" name="HomeForm" method="get">
		<input type="hidden" name="userid" value="${login.userid}">
		<c:if test="${login != null}">		
			<div>
				<p>${login.username}님 안녕하세요!</p><br>
				<input type="submit" value="정보수정">
				<%-- <a href="/hiphople/member/memberInfo?"${userid}" class="updateMember">정보수정</a> --%>&emsp;
				<a href="/hiphople/member/logout" class="">로그아웃</a>				
			</div>
		</c:if>
		
		
		
<%-- 		<c:if test="${msg != false}">
			<p style="color: red;">로그인 실패! 아이디와 비밀번호를 확인해주세요</p>	
		</c:if> --%>
		
	</form>
	
	<%-- <h1>
	Hello world!  </h1>

	<P>  The time on the server is ${serverTime}. </P> --%>
	
</body>
</html>
	