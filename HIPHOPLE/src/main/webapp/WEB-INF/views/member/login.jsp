<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="../resources/js/jquery-3.5.1.js"></script></head>
<link rel="stylesheet" type="text/css" href="../resources/css/login.css"/>
<link rel="stylesheet" type="text/css" href="../resources/css/reset.css"/>
<script type="text/javascript" src="../resources/js/login.js"></script></head>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

</head>
<body>
	
	<h1>로그인</h1>
	<form action="/hiphople/member/loginPost" method="post">
	<table>

	<tr>
		<th>ID</th>
		<td><input type="text" name="userid" placeholder="아이디"></td>
	</tr>
	<tr>
		<th>PASSWORD</th>
		<td><input type="password" name="userpw" placeholder="비밀번호"></td>
	</tr>
	
	<tr>
		<td colspan="2">
		<input type="checkbox" name="useCookie">&nbsp;Remember me<!-- 로그인 유지 --></td>
	</tr>
	
	<tr>
		<td colspan="2"><input  type="submit" value="로그인" id="joinBtn"></td>
	</tr>
	
	<tr>
		<td colspan="2">
		<a href="#">lost your password?</a> <!-- 비밀번호 찾기 -->
	</tr>

	</table>
	</form>
	
	
</body>
</html>