<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello myPage!</title>

<!-- JS -->
<script type="text/javascript" src="../resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="../resources/js/script.js"></script></head>

<!-- swiper 메인 슬라이드 플러그인 사용-->
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">

<!-- CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/reset.css"/>
<link rel="stylesheet" type="text/css" href="../resources/css/reset.css"/>
<link rel="stylesheet" type="text/css" href="resources/css/footer.css"/>
<link rel="stylesheet" type="text/css" href="../resources/css/footer.css"/>


</head>
<body>
	
	<div class="container">
	<header class="page-header wrapper">
    
    		 <ul class="side-nav">
				<c:if test="${login != null}">		
					<li class="">${login.username}님 안녕하세요!</li>
					<!-- <input type="submit" value="정보수정"> -->
					<li><a href="/hiphople/member/memberInfo?userid=${login.userid}" class="updateMember">정보수정</a></li>
					<li><a href="/hiphople/member/logout">LOGOUT</a></li>				
				</c:if>
		
				<c:if test="${login == null}">		
                    <li><a href="/hiphople/member/login">LOGIN</a>&emsp;</li>
					<li><a href="/hiphople/member/signup">JOIN</a>&emsp;</li>
					<li><a href="#">MENU</a>&emsp;</li>
						<!-- 드롭다운 메뉴 
						<ul class="side-sub"> 
							<li><a href="/hiphople/member/login">LOGIN</a></li>
							<li><a href="/hiphople/member/signup">JOIN</a>&emsp;</li>
						</ul> -->
              	</c:if>  
                
            </ul>
            <!-- h1 내부에 상단로고 배치 -->
            
           	<div class="mainLogo">
            <h1><a href="#">
                <img class="logo" src="http://real5781.cdn2.cafe24.com/logo/logo_black_450px.png" alt="메인로고">
            </a></h1>
            </div>
            
            <!-- 내비게이션 메뉴 -->
			<form action="/hiphople/member/memberInfo" name="HomeForm" method="get">     
            <nav>
                <input type="hidden" name="userid" value="${login.userid}">
           
                <ul class="main-nav">
                  	<li><a class="u_line" href="/hiphople">MAIN</a></li>
                	<li><a class="u_line" href="#">ABOUT</a></li>
                	<li><a class="u_line" href="#">MUSIC</a></li>
                	<li><a class="u_line" href="#">NEWS</a></li>
                	<li><a class="u_line" href="#">COMMUNITY</a></li>
                    <li><a class="u_line" href="/hiphople/notice/list">NOTICE</a></li>
                </ul>
            </nav>
            </form>
  
            <!-- <div class="big-bg"><img src="/Images/main-bg.jpg" alt="메인이미지"></div> -->
            
        </header>
        <!-- End of Header -->