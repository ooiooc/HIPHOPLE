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
<!-- fontawesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.1/css/all.css" integrity="sha384-xxzQGERXS00kBmZW/6qxqJPyxW3UR0BPsL4c8ILaIWXva5kFi7TxkIIaMiKtqV1Q" crossorigin="anonymous">
<!-- js -->
<script type="text/javascript" src="resources/js/jquery-3.5.1.js"></script>
<!-- css -->
<link rel="stylesheet" type="text/css" href="resources/css/reset.css"/>
<link rel="stylesheet" type="text/css" href="resources/css/header.css"/>
</head>
<body>
	<div class="container">
	<header class="page-header wrap">
    		 <ul class="side-nav">
				<!-- <input type="submit" value="정보수정"> -->
				<%-- <li><a href="/hiphople/member/memberInfo?userid=${member.userid}" class="updateMember">정보수정</a></li> --%>
				<sec:authorize access="hasAuthority('ROLE_ADMIN')"> 
    				<li>관리자&nbsp;</li>
				</sec:authorize> 
				<sec:authorize access="hasAuthority('ROLE_USER')"> 
					<li>회원&nbsp;</li>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
				<sec:authentication property="principal.username" var="currentUserName"/>
    				<%-- <li><a href="/hiphople/">${currentUserName}&nbsp;님</a></li> --%>
    				<li>${currentUserName}&nbsp;님</li>
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
					<!-- <li><a href="#"><img style="width : 30px; height : 30px;" src="resources/image/icon/search.png" alt="search"></a></li>
					<li><a href="#"><img style="width : 30px; height : 30px;" src="resources/image/icon/user.png" alt="user"></a></li> -->
					<!-- <li><a href="#"><img style="width : 30px; height : 30px;" src="resources/image/icon/menum.png" alt="menu"></a> -->
					<!-- 드롭다운 메뉴 
						<ul class="side-sub"> 
							<li><a href="/hiphople/member/login">LOGIN</a></li>
							<li><a href="/hiphople/member/signup">JOIN</a>&emsp;</li>
					</ul> --> 
            </ul>
     
           	<div class="mainLogo">
            <h1><a href="/hiphople"><img class="logo" src="resources/image/logo_black_450px.png" alt="logo"></a></h1>
            </div>
            
            <!-- 내비게이션 메뉴 -->
			<form action="/hiphople/member/memberInfo" name="HomeForm" method="get">     
            <nav class="nav_wrap">
                <%-- <input type="hidden" name="userid" value="${login.userid}"> --%>
           		
                <ul class="main-nav">
                    <li class="main_menu"><a class="u_line" href="/hiphople/contents/list">ARCHIVE</a></li>
                	<li class="main_menu"><a class="u_line" href="/hiphople/video/list">MUSIC</a></li>
                	<li class="main_menu"><a class="u_line" href="/hiphople/notice/list">NOTICE</a></li>
                	<li class="main_menu"><a class="u_line" href="/hiphople/community/list">COMMUNITY</a></li>
                	<li class="main_menu"><a class="u_line" href="#">SEARCH</a></li>
                	<%-- <form action="/hiphople/article/list" method="get">
                	<li class="main_menu" id="search"><a class="u_line" href="/hiphople/community/list" <c:out value="${pageMaker.cri.type eq 'TCW'? 'selected':''}"/>>SEARCH</a></li>
                    </form> --%>
                </ul>
            </nav>
            </form>
  
            <!-- <div class="big-bg"><img src="/Images/main-bg.jpg" alt="메인이미지"></div> -->
            
        </header>
        </div>
        <!-- End of Header -->
        
</body>
</html>