<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome – HIPHOPLE</title>
<script type="text/javascript" src="../resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="../resources/js/signup.js"></script>
<link rel="stylesheet" type="text/css" href="../resources/css/member.css"/>
</head>
<body>
	<%@include file="../include/header.jsp"%>

		<script type="text/javascript">
		
		alert("회원가입 인증 완료되었습니다. 로그인하셔서 서비스를 이용해보세요!")
		window.location.href="http://localhost:8050/hiphople";
		
		/*
		var email = '${email}';
		var key = '${authkey}';

		alert(email + '님의 인증키 : ' + key);

		window.open('', '_self', ''); // 브라우저창 닫기
		window.close(); // 브라우저 창 닫기
		*/
		
	</script>
</body>
</html>