<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- security taglib 사용 선언 -->
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin – HIPHOPLE</title>
<!-- js -->
<script type="text/javascript" src="resources/js/jquery-3.5.1.js"></script>
<!-- css -->
<link rel="stylesheet" type="text/css" href="../resources/css/reset.css"/>
<link rel="stylesheet" type="text/css" href="../resources/css/admin.css"/>

</head>
<body>
	<%@include file="../include/header2.jsp"%>
	<main class="site-content">
	
   		<div class="container-adminpage">
	        <div class="page-header">
	            <h3 class="main-title">ADMIN PAGE</h3>
	        </div>

        	<div class="adminmenu">
				<nav class="adminmenu-nav">
					<ul>
						<li class="woocommerce-MyAccount-navigation-link woocommerce-MyAccount-navigation-link--dashboard is-active">
							<a href="/hiphople/admin/main" class="" id="dashboard">대시보드</a>
						</li>
						<li class="woocommerce-MyAccount-navigation-link woocommerce-MyAccount-navigation-link--dashboard is-active">
							<a href="/hiphople/admin/list" class="">회원관리</a>
						</li>
						<li class="woocommerce-MyAccount-navigation-link woocommerce-MyAccount-navigation-link--orders">
							<a href="/hiphople/notice/write" class="">공지사항</a>
						</li>
						<li class="woocommerce-MyAccount-navigation-link woocommerce-MyAccount-navigation-link--orders">
							<a href="/hiphople/contents/write" class="adminnav">기사등록</a>
						</li>
						<li class="woocommerce-MyAccount-navigation-link woocommerce-MyAccount-navigation-link--orders">
							<a href="#" onclick="document.getElementById('logout').submit();" class="adminnav">로그아웃</a>
						</li>
					</ul>
				</nav>
	
	
				<div class="adminpage">
					<div class="adminpage-wrapper">
					<p>안녕하세요.	<strong>관리자</strong>님!
					</div>
				</div>
		
			</div>    
		</div>
	
	</main><!-- .site-content -->
	<%@include file="../include/footer.jsp"%>
</body>
</html>