<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypage – HIPHOPLE</title>
<script type="text/javascript" src="../resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="../resources/js/memberInfo.js"></script>
<link rel="stylesheet" type="text/css" href="../resources/css/member.css"/>
<link rel="stylesheet" type="text/css" href="../resources/css/reset.css"/>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<%@include file="../include/header2.jsp"%>
</head>
<body>
	
	<div class="meminfowrap">
			
	<h1 class="category_mypg">MY PAGE</h1>
	<form role="form" action="/hiphople/member/updateMember" method="post">
		<sec:authorize access="isRememberMe()">
       	<h2 style="text-align: center;">This user is login by "Remember Me Cookies"</h2>
   		</sec:authorize>
		<!-- 프로필 이미지 -->
		<div class="myimg"></div>
		
		<table class="meminfobox">
		<tr>
			<td class="meminfo" id="mypgimg"><label class="mypglb">프로필 사진 등록</label></td>
		</tr>
		<tr>
			<td class="meminfo"><label class="mypglb">아이디</label><br>
			<input class="meminfoip" type="text" name="userid" id="userid" value="${member.userid}" readonly="readonly"></td>
		</tr>
		
		<tr>	
			<td class="meminfo"><label class="mypglb">이름&nbsp;<span class="required">*</span></label><br>
			<input class="meminfoip"  type="text" name="username" id="username" value="${member.username}"/></td>
		</tr>
		
		<tr>
			<td class="meminfo"><label class="mypglb">이메일&nbsp;<span class="required">*</span></label><br>
			<input class="meminfoip"  type="text" name="email" id="email" value="${member.email}"/></td>
		</tr>
		
		<tr>
			<td class="meminfo"><label class="mypglb">현재 비밀번호</label><br>
			<input class="meminfoip"  type="password" name="oldpw" id="userpw" value=""/></td>
		</tr>
		
		<tr>
			<td class="meminfo"><label class="mypglb">새 비밀번호</label><br>
			<input class="meminfoip"  type="password" name="newPass" id="userpw" value=""/></td>
		</tr>
		
		<!-- <tr>
			<td class="meminfo"><label class="mypglb">새 비밀번호 확인</label><br>
			<input class="meminfoip"  type="password" name="newPass" id="userpw" value=""/></td>
		</tr> -->
		
		</table>
		
		<div class="mypgupdate" >
			<button class="update" type="submit" id="submit">회원정보수정</button>
			<button class="deletemem" type="button" onclick="location.href='/hiphople/member/withdrawal'">회원탈퇴</button>
		</div>
		
		<!-- update msg -->
		<p class="mypgmsg">${msg}</p>
	
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<!-- <script type="application/javascript" th:inline="javascript">
        $(function() {
            var csrfToken = /*[[${_csrf.token}]]*/ null;
            var csrfHeader = /*[[${_csrf.headerName}]]*/ null;
            $(document).ajaxSend(function (e, xhr, options) {
                xhr.setRequestHeader(csrfHeader, csrfToken);
            });
        });
    </script> -->
	</form>
	</div>
					

	<%@include file="../include/footer.jsp"%>
</body>
</html>