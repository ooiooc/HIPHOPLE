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
		      	<div class="swiper-slide" style="background-image: url(http://hiphople.com/files/attach/images/6005854/408/301/018/3c1c6a53dd631aa48ac0d095b14ce651.jpg); border:0;">
			   	</div>
				<div class="swtitle-wrap"><span class="swtitle" style="color: #fff;"></span></div>
			   	<!-- Slide 2 -->
			   	<div class="swiper-slide" style="background-image: url(http://hiphople.com/files/attach/images/11972418/618/286/018/02c275472022979a13ad37c8a3825c0f.jpg)">
			   	</div>
			    <!-- Slide 3 -->
			    <div class="swiper-slide" style="background-image: url(http://hiphople.com/files/attach/images/6005854/907/290/018/1ca7e2af1c3af1b53a1ebd6c82a591ed.jpg)">
			    </div>
			    <!-- Slide 4 -->
			    <div class="swiper-slide" style="background-image: url(http://hiphople.com/files/attach/images/115990/810/293/018/da251bc8ed7c154f920ba62d9c998a84.jpg)">
			    </div>
			   	<!-- Slide 5 -->
			    <div class="swiper-slide" style="background-image: url(http://hiphople.com/files/attach/images/6005854/526/311/018/3fbee9d9c7d69b3e99265c73ceed8232.jpg)">
			    </div>
			    <!-- Slide 6 -->
				<div class="swiper-slide" style="background-image: url(http://hiphople.com/files/attach/images/562/980/292/018/3a4961ede28d32772652fc0f076157a6.jpg)">
				</div>
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
							<p class="ptitle"><a href="/hiphople/community/view?bno=${article.bno}">${article.title}</a></p>
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
  
  		<!-- 	
	   	<h1 style="text-align: center; letter-spacing: -1px;">LATEST</h1>
		<div class="popupVideo" style="position: relative; height:0; padding-bottom: 20%; margin: 40px 0px;">
		<iframe width="560" height="315" src="https://www.youtube.com/embed/qxUkDghgE9Q?controls=0&autoplay=1&loop=1&mute=1" frameborder="0" allow="loop; accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		</div> --> 
  		
		<script type="text/javascript">
			var swiper = new Swiper('.swiper-container', {
			slidesPerView: 1,
			spaceBetween: 30,
			loop: true,
			pagination: {
			el: '.swiper-pagination',
			clickable: true,
			},
			navigation: {
			nextEl: '.swiper-button-next',
			prevEl: '.swiper-button-prev',
			},
		}); //슬라이더 끝
			    
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
</body>
</html>