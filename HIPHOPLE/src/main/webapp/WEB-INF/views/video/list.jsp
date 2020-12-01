<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
*{margin:0; padding:0;}
a.button modal-open{
	display:inline-block; 
	padding: 10px 20px; 
	text-decoration:none; 
	/* color:#fff; 
	background:#000;  */
	margin:20px;
}
	
#modal{
  display:none;
  position:fixed; 
  width:100%; height:100%;
  top:0; left:0; 
  background:rgba(0,0,0,0.3);
}
.modal-con{
  display:none;
  position:fixed;
  top:50%; left:50%;
  transform: translate(-50%,-50%);
  max-width: 60%;
  min-height: 30%;
  background:#fff;
}
.modal-con .mo_title{
  font-size:20px; 
  padding: 20px; 
  background : gold;
}
.modal-con .con{
  font-size:15px; line-height:1.3;
  padding: 30px;
}
.modal-con .close{
  display:block;
  position:absolute;
  width:30px; height:30px;
  border-radius:50%; 
  border: 3px solid #000;
  text-align:center; line-height: 30px;
  text-decoration:none;
  color:#000; font-size:20px; font-weight: bold;
  right:10px; top:10px;
}
</style>

<%@include file="../include/header2.jsp"%>

</head>
<body>
	
	<!-- 모달창 -->
	<div>
		<h1><a href="javascript:openModal('modal1');" class="button modal-open">open modal</a></h1>
	</div>
	
	<div id="modal"></div>
	  	<div class="modal-con modal1">
	    <a href="javascript:;" class="close">X</a>
	    <p class="mo_title">제목</p>
	    <div class="con">
	    Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.
	    <iframe width="560" height="315" src="https://www.youtube.com/embed/qxUkDghgE9Q?controls=0&autoplay=1&loop=1&mute=1" frameborder="0" allow="loop; accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>
	    </iframe>
	    </div>
  	</div>
  	<script type="text/javascript">
function openModal(modalname){
	  document.get
	  $("#modal").fadeIn(300);
	  $("."+modalname).fadeIn(300);
	}
	//
	$("#modal, .close").on('click',function(){
	  $("#modal").fadeOut(300);
	  $(".modal-con").fadeOut(300);
	});
</script>
</body>
</html>