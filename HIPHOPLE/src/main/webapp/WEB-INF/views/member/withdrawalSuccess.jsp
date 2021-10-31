<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="../include/header2.jsp"%>

	<div class="withsuccess_wrap">
		<form action="withdrawal.do" method="post">
			<div class="successform">
				<h2 class="successmsg">탈퇴가 완료되었습니다.</h2>
				<p class="suc_submsg">그동안 힙합엘이를 이용해 주셔서 감사합니다.</p>
			</div>
		</form>
		<div class="mainbtnBox"><button class="gotoMainbtn" onclick="location.href='/hiphople'">힙합엘이 첫 화면</button>
		</div>
	</div>
	<%@include file="../include/footer.jsp"%>
</body>
</html>