<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Withdrawal – HIPHOPLE</title>
</head>
<body>
	<%@include file="../include/header2.jsp"%>
	<form action="/hiphople/member/withdrawal.do" method="post">
	<div class="withdrwlwrap">
		<h1 class="wdrwl_title">회원 탈퇴</h1>
		<div class="withdrwlForm">
			<p class="wdrwl_txt">회원님의 개인정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인합니다.</p>
			<div class="repassform">
			<input class="wdrwlInput" type="password" name="checkpw" placeholder="비밀번호를 입력해 주세요">
			&nbsp;<button type="submit" class="confirmbtn">확인</button>
			</div>
		</div>      
	</div>
	</form> 
	<%@include file="../include/footer.jsp"%>	            
</body>
</html>