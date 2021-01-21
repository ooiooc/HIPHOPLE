<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HIPHOPLE</title>
<!-- JS -->
<script type="text/javascript" src="../resources/js/jquery-3.5.1.js"></script>
<!-- fontawesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.1/css/all.css" integrity="sha384-xxzQGERXS00kBmZW/6qxqJPyxW3UR0BPsL4c8ILaIWXva5kFi7TxkIIaMiKtqV1Q" crossorigin="anonymous">
<!-- CSS -->
<link rel="stylesheet" type="text/css" href="../resources/css/reset.css"/>
<link rel="stylesheet" type="text/css" href="../resources/css/header.css"/>
<link rel="stylesheet" type="text/css" href="../resources/css/member.css"/>
<!-- summernote -->
<script src="../resources/js/summernote/summernote.js"></script>
<script src="../resources/js/summernote/summernote-lite.js"></script>
<script src="../resources/js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="../resources/css/summernote/summernote-lite.css"/>
</head>
<body>
	<div class="container">
	<header class="header2">
    	<div class="headerwrap">
           	<div class="subLogo">
	            <div><a href="/hiphople"><img class="smallLogo" src="../resources/image/logo_white_150px.png" alt="logo"></a>
	            </div>
            </div>
            <!-- 내비게이션 메뉴 -->
			     
            <nav class="nav_wrap2">
            <form action="/hiphople/member/memberInfo" name="HomeForm" method="get">
            	<ul class="main-nav2">
                  	<li class="main_menu"><a class="u_line" href="/hiphople/contents/list">ARCHIVE</a></li>
                	<li class="main_menu"><a class="u_line" href="/hiphople/video/list">MUSIC</a></li>
                	<li class="main_menu"><a class="u_line" href="/hiphople/notice/list">NOTICE</a></li>
                	<li class="main_menu"><a class="u_line" href="/hiphople/community/list">COMMUNITY</a></li>
                	<li class="main_menu" id="searchdrop"><a href="#">SEARCH</a>
                		<ul class="dropdown">
                			<li><button type="button" ></button><a href="#">검색</a></li>
                		</ul>
                	</li>
                	
                </ul>
            </form>
            </nav>
            
            <nav class="nav_wrap3" style="border: 1px solid #000; padding-right: 10px;">
            <ul class="side-nav2" style="border: 1px solid #000;">
            	<sec:authorize access="hasRole('ROLE_ADMIN')"> 
    				<li>관리자&nbsp;</li>
    			</sec:authorize> 
				<sec:authorize access="hasRole('ROLE_USER')"> 
				<li>회원&nbsp;</li>
				
				<sec:authentication property="principal.username" var="currentUserName"/>
    				<li>${currentUserName}님</li>
    				<li><a href="/hiphople/member/memberInfo" class="updateMember">정보수정</a></li>
				</sec:authorize> 
				
				<sec:authorize access="hasAuthority('ROLE_ADMIN')"> 
    				<li><a href="/hiphople/admin/main">관리자 페이지</a></li>
				</sec:authorize> 
				
				<sec:authorize access="isAuthenticated()">
  				<form id="logout" action="/hiphople/logout" method="POST">	
  					<li><a href="#" onclick="document.getElementById('logout').submit();">로그아웃</a></li>
  				</form>
				</sec:authorize>
		
				<sec:authorize access="! isAuthenticated()">
					<li><a href="/hiphople/member/signin">LOGIN</a></li>
					<li><a href="/hiphople/member/signup">JOIN</a></li>
				</sec:authorize>
					
						<!-- 드롭다운 메뉴 
						<ul class="side-sub"> 
							<li><a href="/hiphople/member/login">LOGIN</a></li>
							<li><a href="/hiphople/member/signup">JOIN</a>&emsp;</li>
						</ul> -->

            </ul>
  			</nav>
            <!-- <div class="big-bg"><img src="/Images/main-bg.jpg" alt="메인이미지"></div> -->
		</div><!-- headerwrap -->
	</header>
    <!-- End of Header -->
</body>
</html>