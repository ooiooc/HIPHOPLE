<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@include file="include/header.jsp"%>

		<section>
	    	
	    	
	    	<!-- 메인 이미지 슬라이더 -->
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
 		 	
 		 	<!-- Swiper JS -->
  			<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	   		<!-- 	<script type="text/javascript"> 
	    	$(document).ready(function () {

	    	var mySwiper = new Swiper ('.swiper-container', { 
	    		direction: 'horizontal', loop: true 
	    		});
	    	</script> -->
	    	
	   	<h1 style="text-align: center; letter-spacing: -1px;">Latest</h1>
		<div class="popupVideo" style="position: relative; height:0; padding-bottom: 20%; margin: 40px 0px;">
		<iframe width="560" height="315" src="https://www.youtube.com/embed/qxUkDghgE9Q?controls=0&autoplay=1&loop=1&mute=1" frameborder="0" allow="loop; accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
<!-- <iframe width="560" height="315" src="https://www.youtube.com/embed/qxUkDghgE9Q?controls=0&autoplay=1&loop=1&mute=1&playlist=qxUkDghgE9Q" frameborder="0" allow="loop; accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> -->
		
		</div> 
		<!-- modal -->

	      	<script>
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
			    });
  			</script> 
  			
  			<h1>Most popular</h1>
  			<h1>Notice</h1>
  			<div class="main_notice" style="border:1px solid 000;"> 
  				<!-- 공지사항 게시글 5개까지 출력 -->
	  			<c:forEach items="${list}" var="notice" begin="0" end="4">
	  				<ul class="mnoticelist">
	  					 <li><a href="/hiphople/notice/view?bno=${notice.bno}"><span>${notice.title}</span></a></li>
	  				</ul>
	  			</c:forEach>
  			</div>
    	
    	</section>
	
	<%@include file="include/footer.jsp"%>
