<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HIPHOPLE</title>
<!-- css -->
<link rel="stylesheet" type="text/css" href="resources/css/header.css"/>
<link rel="stylesheet" type="text/css" href="resources/css/reset.css"/>
<!-- js -->
<script type="text/javascript" src="resources/js/jquery-3.5.1.js"></script>
<!-- swiper 메인 슬라이드 플러그인 -->
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
</head>
<body>
	<%@include file="include/header.jsp"%>
		
	<!-- 오늘 그만 보기 팝업 -->
	<form name="notice_form">
		<div id="divpop1" class="divpop">    
			<div class="title_area"><h1 class="popuptitle">레이어 팝업</h1></div>
		    	<div class="button_area">
			    	<div class="checkboxarea">
			        	<input type='checkbox' name='chkbox' id='todaycloseyn' value='Y'>
			        	&nbsp;오늘은 그만 보기</div>   
			       	 	<a class="closebtn" href='#' onclick="javascript:closeWin(1);">[닫기]</a>
			   	</div>
		    </div>
	</form>

	<section>
		<!-- 메인 슬라이더 -->
		<div class="swiper-container">
    		<div class="swiper-wrapper">
    			<!-- Slide 1 -->
		      	<div class="swiper-slide" style="background-image: url(resources/image/index/slide1.jpeg);">
		      	<div style="width: 100%; bottom: 60px; font-size: 2.2em; font-weight: 700; letter-spacing:3px; color:#dddddd; position: absolute;">
				오왼, 정규 4집 [소년] 발표</div>	
		      	</div>
			   	<!-- Slide 2 -->
			   	<div class="swiper-slide" style="background-image: url(resources/image/index/slide2.jpg);"></div>
			    <!-- Slide 3 -->
			    <div class="swiper-slide" style="background-image: url(resources/image/index/slide3.jpg);" ></div>
			    <!-- Slide 4 -->
			    <div class="swiper-slide" style="background-image: url(resources/image/index/slide4.jpg);"></div>
    		</div>
			    
			    <!-- Add Pagination -->
			    <div class="swiper-pagination swiper-pagination-white"></div>
			    
			    <!-- Add Arrows -->
			    <div class="swiper-button-next swiper-button-white"></div>
			    <div class="swiper-button-prev swiper-button-white"></div>
		</div><!-- swiper-container -->

  		
  		<!-- main contents -->
  		<div class="maincontents">
  		<h1>CONTENTS & CURATION</h1>
	  		<div id="viewitems">	
			<!-- interview -->
			<c:forEach items="${list}" var="article" begin="0" end="3">
				<div class="griditems">		
						<div id="contents">
							<div id="imgarea"><img src="resources/image/hiphopledefault.jpg" alt=""/></div>	
							<p class="pcategory">${article.category}</p>
							<p class="ptitle"><a href="/hiphople/contents/view?bno=${article.bno}">${article.title}</a></p>
						</div>
						
				</div>
			</c:forEach>
  			</div>
  		</div>
  		
  		<!-- video series -->
  		<div class="maincontents">
  		<h1>VIDEO SERIES</h1>
	  		<div id="viewitems">	
				<div class="griditems">		
					<div id="contents">
						<div id="imgarea"><img src="resources/image/hiphopledefault.jpg" alt=""/></div>	
							<p class="pcategory">CATEGORY</p>
							<p class="ptitle">TITLE</p>
					</div>
				</div>
				<div class="griditems">		
					<div id="contents">
						<div id="imgarea"><img src="resources/image/hiphopledefault.jpg" alt=""/></div>	
							<p class="pcategory">CATEGORY</p>
							<p class="ptitle">TITLE</p>
					</div>
				</div>
				<div class="griditems">		
					<div id="contents">
						<div id="imgarea"><img src="resources/image/hiphopledefault.jpg" alt=""/></div>	
							<p class="pcategory">CATEGORY</p>
							<p class="ptitle">TITLE</p>
					</div>
				</div>
				<div class="griditems">		
					<div id="contents">
						<div id="imgarea"><img src="resources/image/hiphopledefault.jpg" alt=""/></div>	
							<p class="pcategory">CATEGORY</p>
							<p class="ptitle">TITLE</p>
					</div>
				</div>
  			</div><!-- grid item -->
  		</div><!-- end video -->
  	
  		<!-- 커뮤니티 베스트 글 -->
  		<div class="maincontents" style="border: 1px solid #000;">
	  		<div class="viewboard" style="border: 1px solid #000;">
		  		
		  		<!-- grid 1 / community best -->
		  		<div class="griditems" style="border: 1px solid #000; ">
		  		<h2 class="mainsubtitle" style="margin-bottom: 10px; border: 1px solid #000;">POPULAR</h2>
		  			<c:forEach items="${best}" var="best" varStatus="ranking">
		  			<ul class="postlist">
						<li><span class="ranking">${ranking.count}&emsp;</span>${best.title}</li>	  		
		  			</ul>
		  			</c:forEach>
		  		</div>
		  		
		  		<!-- grid 2 / latest notice -->
		  		<div class="griditems" style=" border: 1px solid #000;"> 
		  		<h2 class="mainsubtitle" style="margin-bottom: 10px; border: 1px solid #000;">LATEST</h2>
		  			<ul class="postlist">
						<c:forEach items="${latest}" var="latest" varStatus="ranking">
			  			<ul class="postlist">
							<li><span class="ranking">${ranking.count}&emsp;</span>${latest.title}</li>	  		
			  			</ul>
			  			</c:forEach>  		
		  			</ul>
		  		</div>
	  		</div>
  		</div>
  		
  		<!-- 	
	   	<h1 style="text-align: center; letter-spacing: -1px;">LATEST</h1>
		<div class="popupVideo" style="position: relative; height:0; padding-bottom: 20%; margin: 40px 0px;">
		<iframe width="560" height="315" src="https://www.youtube.com/embed/qxUkDghgE9Q?controls=0&autoplay=1&loop=1&mute=1" frameborder="0" allow="loop; accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		</div> --> 
    	</section>

	<footer>
	<div class="footer_container">
		<div class="footerLogo">
            <h1><a href="/hiphople">
                <img class="logo" src="resources/image/logo_2018_white_400.png" alt="logo">
            </a></h1>
        </div>
		<ul class="footer-menubox">
			<li class="footer-menu"><a href="#">ABOUT HIPHOPLE</a></li>
	        <li class="footer-menu"><a href="#">ADVERTISEMENT</a></li>
	        <li class="footer-menu"><a href="#">RECRUIT</a></li>
	        <li class="footer-menu"><a href="#">PRIVACY</a></li>
		</ul>
	
		<ul class="footer-link">
			<li><strong>힙합엘이</strong></li>
	        <li>서울시 마포구 와우산로10길 37, 2층</li>
	        <li>070-4103-6000</li>
	        <li>등록번호: 서울아04698</li>
	        <li>등록·발행일: 2017.09.07</li>
	        <li>발행·편집인: 최성웅</li>	
	        <li>청소년보호책임자: 최성웅</li>	
		</ul>
		<div class="rights">
	       Copyright&copy;
	       <span class="footer-cp"><a href="/hiphople">HIPHOPLE</a></span>
	       All Rights Reserved.
	    </div>
	</div><!-- footer container -->
	</footer>
	
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	
	<script>
		var swiper = new Swiper('.swiper-container',{
				slidesPerView: 1,
				spaceBetween: 30,
				loop: true,
				autoplay: {
				        delay: 2500,
				        disableOnInteraction: false,
				},
				pagination: {
					el: '.swiper-pagination',
					clickable: true,
				},
				navigation: {
					nextEl: '.swiper-button-next',
					prevEl: '.swiper-button-prev',
				},
			}); //슬라이더 끝
		
	</script>
	<script>
		/* 레이어 팝업 오늘 하루 그만 보기 */	
		//쿠키 설정
		function setCookie(name, value, expiredays){
			var todayDate = new Date();
			todayDate.setDate( todayDate.getDate() + expiredays );
			document.cookie = name + '=' + escape( value ) + '; path=/; expires=' + todayDate.toGMTString() + ';'
		}
			
		//쿠키 불러오기
		function getCookie(name) { 
			var obj = name + "="; 
			var x = 0; 
			
			while ( x <= document.cookie.length){ 
				var y = (x+obj.length); 
			   		if ( document.cookie.substring( x, y ) == obj ){ 
			        	if ((endOfCookie=document.cookie.indexOf( ";", y )) == -1 ) 
			            	endOfCookie = document.cookie.length;
			                return unescape( document.cookie.substring( y, endOfCookie ) ); 
			            } 
			            x = document.cookie.indexOf( " ", x ) + 1; 
			            if ( x == 0 ) 
			                break; 
			        } 
			        return ""; 
			}
			
		//닫기 버튼 클릭시
		function closeWin(key){
			if($("#todaycloseyn").prop("checked")){
				setCookie('divpop'+key, 'Y' , 1 );
				}
					$("#divpop"+key+"").hide();
			    }
			
		$(function(){    
			if(getCookie("divpop1") !="Y"){
			   $("#divpop1").show();
			   }
			});
  		</script><!-- end 레이어 팝업 -->
</body>
</html>