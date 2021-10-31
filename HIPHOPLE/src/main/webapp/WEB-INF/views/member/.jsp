<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<form action="searchPw.do" method="get">
            <h2>비밀번호 찾기</h2>
            <p>아래 이메일주소를 입력하시면,<br> 입력하신 이메일로 임시 비밀번호를 받으실 수 있습니다<br>
                <br>
            <div>
                <input type="text" name="username" placeholder="이름">
            </div>
            <div>
                <input type="text" name="email" placeholder="이메일주소">
                <p>'@'포함한 이메일주소를 정확하게 입력해 주세요.</p>
            </div>
 
            <div>
                <button type="submit">비밀번호 찾기</button>
            </div>
        </form>
    </div>
</body>
</html>