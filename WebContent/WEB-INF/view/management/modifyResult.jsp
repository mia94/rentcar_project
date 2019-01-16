<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/css/common.css?aaa" rel="stylesheet"  type="text/css">
<link href="${pageContext.request.contextPath }/css/common_orig.css" rel="stylesheet"  type="text/css">
</head>

<body>
<div id="container">
		<header>
			<jsp:include page="../guest.jsp"></jsp:include>
		</header>
		
		<section>
	회원님의 정보가 수정 되었습니다.
	<a href="home.do">홈화면으로</a>
	</section>
	</div>
	
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
	
</html>