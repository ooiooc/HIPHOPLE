<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% pageContext.setAttribute("replaceChar", "\n"); %>
<!-- security taglib 사용 선언 -->
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HIPHOPLE</title>
<!-- JS -->
<script type="text/javascript" src="resources/js/jquery-3.5.1.js"></script>
<!-- CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/reset.css"/>
<link rel="stylesheet" type="text/css" href="resources/css/header.css"/>
<!-- include summernote css/js-->
<!-- <script src="../resources/js/summernote/summernote.js"></script>
<script src="../re
sources/js/summernote/summernote-lite.js"></script>
<script src="../resources/js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="../resources/css/summernote/summernote-lite.css"/>
 -->
</head>
<body>
	
	<div class="container">
	<header class="page-header wrap">
    
    		 <ul class="side-nav">
					<!-- <input type="submit" value="정보수정"> -->
					<%-- <li><a href="/hiphople/member/memberInfo?userid=${member.userid}" class="updateMember">정보수정</a></li> --%>
				<sec:authorize access="hasAuthority('ROLE_USER')"> 
				
				<sec:authentication property="principal.username" var="currentUserName"/>
    				<li><a href="/hiphople/">${currentUserName}&nbsp;님</a></li>
    				<li><a href="/hiphople/member/memberInfo" class="updateMember">정보수정</a></li>
				</sec:authorize> 
				
				<sec:authorize access="hasAuthority('ROLE_ADMIN')"> 
    				<li><a href="/hiphople/">관리자 메인</a></li>
				</sec:authorize> 
				
				<sec:authorize access="isAuthenticated()">
  				<form id="logout" action="/hiphople/logout" method="POST">	
  					<li><a href="#" onclick="document.getElementById('logout').submit();">로그아웃</a></li>
  				</form>
				</sec:authorize>
				
			<%-- 	<sec:authorize access="isAuthenticated()">
    				<li><a href="/hiphople/member/logout">LOGOUT</a></li>
				 </sec:authorize>	 --%>
					
				<sec:authorize access="! isAuthenticated()">
					<li><a href="/hiphople/member/signin">LOGIN</a></li>
					<li><a href="/hiphople/member/signup">JOIN</a></li>
				</sec:authorize>
					
					<li><a href="#">MENU</a>&emsp;</li>
						<!-- 드롭다운 메뉴 
						<ul class="side-sub"> 
							<li><a href="/hiphople/member/login">LOGIN</a></li>
							<li><a href="/hiphople/member/signup">JOIN</a>&emsp;</li>
						</ul> -->
              	 
                
            </ul>
            
            <!-- h1 내부에 상단로고 배치 -->
           	<div class="mainLogo">
            <h1><a href="/hiphople">
                <img class="logo" src="resources/image/logo_black_450px.png" alt="logo">
            </a></h1>
            </div>
            
            <!-- 내비게이션 메뉴 -->
			<form action="/hiphople/member/memberInfo" name="HomeForm" method="get">     
            <nav class="nav_wrap">
                <input type="hidden" name="userid" value="${login.userid}">
           		
                <ul class="main-nav">
                  	<li class="main_menu"><a class="u_line" href="/hiphople">MAIN</a></li>
                	<li class="main_menu"><a class="u_line" href="#">NEWS</a></li>
                	<li class="main_menu"><a class="u_line" href="#">MUSIC</a></li>
                	<li class="main_menu"><a class="u_line" href="/hiphople/interview/list">INTERVIEW</a></li>
                	<li class="main_menu"><a class="u_line" href="/hiphople/notice/list">NOTICE</a></li>
                	<li class="main_menu"><a class="u_line" href="/hiphople/community/list">COMMUNITY</a></li>
                    
                </ul>
            </nav>
            </form>
  
            <!-- <div class="big-bg"><img src="/Images/main-bg.jpg" alt="메인이미지"></div> -->
            
        </header>
        </div>
        <!-- End of Header -->
        
</body>
</html>