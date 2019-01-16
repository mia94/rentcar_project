<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/css/common.css?aaaaa" rel="stylesheet"  type="text/css">
<link href="${pageContext.request.contextPath }/css/result.css?aaaaaa" rel="stylesheet"  type="text/css">
<link href="${pageContext.request.contextPath }/css/common_orig.css" rel="stylesheet"  type="text/css">
<style type="text/css">

</style>
</head>
<body>
<div id="container">
		<header>
			<jsp:include page="../header.jsp"></jsp:include>
		</header>
		
		<section>
		<div id="result">
	<h3>고객님의 정보와 일치하는 아이디 목록입니다.</h3>
 	<h3>당신의 아이디는 <span>${id }</span> 입니다.</h3>
 	<p>
 	<a href="login.do">로그인 하기</a>
 	<a href="searchPw.do">비밀번호 찾기</a>
 	</p>
 	</div>
 		</section>
	</div>
	
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
</html>