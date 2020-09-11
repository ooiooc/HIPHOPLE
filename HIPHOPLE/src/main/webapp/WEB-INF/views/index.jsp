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
			      	<div class="swiper-slide" style="background-image: url(http://hiphople.com/files/attach/images/6005854/408/301/018/3c1c6a53dd631aa48ac0d095b14ce651.jpg)">
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
  			
  			<h1>main contents</h1>
    
    	</section>
	
	<%@include file="include/footer.jsp"%>
