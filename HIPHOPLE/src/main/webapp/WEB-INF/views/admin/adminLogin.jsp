<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>
</head>
<body>

	<h1>관리자 로그인</h1>
	<form action="/hiphople/member/loginPost" method="post">
	<table>

	<tr>
		<th>관리자 ID</th>
		<td><input type="text" name="adminid" placeholder="아이디"></td>
	</tr>
	<tr>
		<th>관리자 PW</th>
		<td><input type="password" name="adminpw" placeholder="패스워드"></td>
	</tr>
	
	<tr>
		<td colspan="2">
		<label><input type="checkbox" name="useCookie">&nbsp;Remember me<!-- 로그인 유지 --></label></td>
	</tr>
	
	<tr>
		<td colspan="2">
		<button type = "submit" name = "submit" id="joinBtn" >로그인</button>
	</tr>
	
	</table>
	</form>
</body>

<!-- 로그인 실패나 성공시 메시지를 받아서 출력하는 자바스크립트 구문 -->
	<script>
	    $(function(){
	        var responseMessage = "<c:out value="${msg}" />";
	        if (responseMessage != ""){
	            alert(responseMessage)
	        }
	    })
	</script>
</html>