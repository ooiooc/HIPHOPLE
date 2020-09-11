<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../resources/js/jquery-3.5.1.js"></script></head>
<link rel="stylesheet" type="text/css" href="../resources/css/reset.css"/>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<style type="text/css">

/* .content_wrap{
	display: grid;
  	width: 800px;
  	height: fit-content;
  	grid-template-columns: repeat(2, 1fr);
  	grid-column-gap: 5px;
  	grid-row-gap: 5px;
  	text-align: center;
  	border: 1px solid #000;
} */

.wrapper{
  	display: grid;
  	width: 800px;
  	height: fit-content;
  	grid-template-columns: repeat(3, 1fr);
  	grid-column-gap: 5px;
  	gap:20px;
  	margin: 0 auto; /* 가운데정렬 */
  	/* grid-auto-rows: minmax(100px, auto); */
}

.content{
	background: #f9f9f9;
	width: 300px;
	height: 300px;
	position: relative;
}

.article{
	width: 100%;
	height: 100px;
	bottom: 0;
	position: absolute;
	text-align: center;
	background: #e2b9b3
}

h1{
	letter-spacing: -1px;
}

p{
	font-size: 14px;
}


.article_box{
	width: 900px;
	margin: 0 auto;
	border: 1px solid #000;
}

.article_title{
	border-bottom: 2px solid #000;
	width: 100%;
	margin: 40px auto;
}

.article_text{
	background: #f9f9f9;
	width: 100%;
	height:600px;
	margin: 100px auto;
}

/* about writer */
.article_writer{
	width: 100%;
	height: 100px;
	text-align: center;
}

/* button area */
.buttonList{
	width: 900px;
	height: auto;
	margin: 20px auto;
	border: 1px solid #000;
	display: flex;
	padding: 10px;
}

.article_btn{
	border-radius: 8px 8px;
	width: 100px;
	height: 36px;
	font-size: 16px;
	border: 1px solid #000;
}

/* reply box */
.replyList{
	width: 900px;
	border: 1px solid #000;
	margin: 20px auto;
	background: #f9f9f9;
	
}

.replybox{
	display: flex;
	width: 100%;
	height: 30px;
}
.replyList p{
	height: auto;

}

.replySumbit{
	width: 40px;
	border: 1px solid #000;
	align-items: flex-end;
}

</style>
</head>
<body>
	
	<div class="wrap">
		<div class="article_box">
			<div class="article_title">
				<h1>category: interview</h1><!-- category -->
				
			</div>
			<div class="article_text">
				<p style="font: bold;">
				</p>
			</div>
			<div class="article_writer">
			writer | 사람과 공간, 그리고 그들에 깃든 이야기를 보고 들어 글을 쓴다. 언젠가 충분히 아름다운 것을 만들고 싶다.
			</div>
			
		</div><!-- article box -->
		<div class="buttonList">
				<button type="button" class="article_btn">목록</button>&emsp;
				<button type="button" class="article_btn">수정</button>
			</div>
		
			
		<div class="replyList">
			<p>댓글</p>
			<div class="replybox">
				<div class="replybox_tit">로그인 후 등록하실 수 있어요!</div>
				
				<div class="replySumbit"><button type="submit">등록</button></div>
			</div>
		</div>
	</div><!-- wrap -->

</body>
</html>