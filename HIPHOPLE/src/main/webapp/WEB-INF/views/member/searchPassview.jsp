<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../resources/css/reset.css"/>
<script type="text/javascript" src="../resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="../resources/js/email.js"></script>

<%@include file="../include/header2.jsp"%>

<style type="text/css">

.passwrap{
	margin: 0 auto;
	/* border: 1px solid #000; */
	padding: 30px;
}
.passtitle{
	text-align: center;
	padding: 10px;
}
.passtext{
	text-align: center;
}
.findpwForm{
	/* border: 1px solid #000; */
	padding:40px;
	text-align: center;
}
.passinfo{
	margin: 20px;
	/* border: 1px solid #000; */
}
.findpass{
	width: 300px;
	height: 30px;
	font-size:14px;
	text-indent: 20px;
}
#checkEmail{
	width: 160px;
	height: 34px;
	font-size:14px;
	border: 0;
}
</style>
</head>
<body>
	
		<!-- commandName,modelAttribute 은 폼에 있는 요소들의 값을 채우기 위해 사용될 객체를 request로부터 찾을때 사용할 이름을 지정 -->
		<form class="searchPass" role="form" action="/hiphople/member/findpass" method="post" >
			<div class="passwrap">
				<h2 class="passtitle">비밀번호 찾기</h2>
				<div class="findpwForm">
		            
		            <p class="passtext">임시 비밀번호 발급을 위해 회원가입 시 등록하신 이메일 주소를 입력해 주세요.<br>
		         
		            <div class="passinfo">
		               <!-- 가입 이메일 입력란 -->
		               	
		                <input class="findpass" type="text" id="receiveMail" name="receiveMail" placeholder="email@domain.com"><br>
		                <!-- <input class="findpass" type="text" id="subject" name="subject" placeholder="제목"><br>
		                <textarea class="findpasstx" rows="5" cols="80" id="content" name="content" placeholder="내용"></textarea> -->
		               
		                
		            </div>
		 
		            <div>
		                <button type="submit" id="checkEmail">Reset password</button>
		                <!-- <button onclick="javascript:sendEMail();">AJAX 전송</button><br/> -->
		                <span style="color:red;">${msg}</span>
		            </div>
		            <!-- msg창 -->
		           
	            </div><!-- findpwForm -->
            </div>
            	<%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> --%>
        </form>
         <div class="checkMsg" id="checkMsg" style="color: red"></div>
    		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
    	
</body>
</html>