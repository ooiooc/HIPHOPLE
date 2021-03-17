<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>interview</title>
<style type="text/css">

body { padding: 0px; margin: 0px; }

.covervid-wrapper {
   /*  position: absolute; */
    position: relative; /* 텍스트를 동영상 위에 올릴 수 있도록 position 속성을 설정 */
    top: 0;
    left: 0;
    width: 100%;
    /* height: 50%; */
 	 /*   min-height: 100%;
    min-width: 100%; */
    
    /* z-index: -100; */
   	/* overflow: hidden; */
   	background-video: url('../resources/videos/Tabber - Look At My  Like A Vampire (Official Teaser).mp4 || ../resources/videos/Tabber - Look At My  Like A Vampire (Official Teaser).webm');
    background-size: cover;
    background-position: center center;
}

/* 동영상 꽉 차게 */
video { width: 100%; 
}

/* 텍스트가 동영상 위로 올라가도록 설정 */
.jb-text { position: absolute; top: 50%; width: 100%; }

/* 텍스트가 세로 가운데 나오도록 의 위치를 조정하고 모양 설정 */
.jb-text p { margin-top: -24px; text-align: center; font-size: 48px; color: #ffffff; }


</style>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
</head>
<body>
	
	<div class="covervid-wrapper">
	    <video id="covervid-video" autoplay muted loop playsinline controls poster="../resources/image/tabber.jpg">
	        <source src="../resources/videos/Tabber - Look At My  Like A Vampire (Official Teaser).mp4" type="video/mp4"/>
	    </video>
	    
	    <div class="jb-text">
       		<p>you'llknovv</p>
     	</div>
	</div>
	
	<!-- <script type="text/javascript" src="../resources/js/covervid.min.js"></script> -->
	<script type="text/javascript">
	
	$(document).ready(function(){
	
	/* $('.covervid-video').coverVid(1920, 1080); */
		
	/* 	var width = window.innerWidth;
		var height = (width * 1080) / 1920 */
	
		var video = document.getElementById('covervid-video');
		
		video.muted = true;
		video.autoplay = true;
		video.loop = "true";
		
		//var promise=document.getElementById('covervid-video');
		//promise.play();
		$('covervid-video').trigger("play");
		alert("비디오 스타또")
		//var promise = document.getElementById('covervid-video').play();
	});
	
	</script>
</body>
</html>