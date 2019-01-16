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
</head>
<body>
<div id="container">
		<header>
			<jsp:include page="../header.jsp"></jsp:include>
		</header>
		
		<section>
		<div id="result">

		<h3>임시 비밀번호를 고객님의 이메일로 발송했습니다.</h3>
		<h3>개인정보관리에서 비밀번호를 재설정 하주세요</h3>

	<a href="login.do">로그인하기</a>
	</div>
	</section>
	</div>

	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
</html>