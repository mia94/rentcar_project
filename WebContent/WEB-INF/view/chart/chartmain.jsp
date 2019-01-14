<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/css/common.css" rel="stylesheet"  type="text/css">
</head>
<body>
<div id="container">
		<header>
			<jsp:include page="../header.jsp"></jsp:include>
		</header>
		
		<section>
			<div id="wrap">
			<h1>CAR CHART</h1>
				<a href="carchart.do" class="menu">
					<img src="" alt="">
					<h3>차량별 렌트 수</h3>
				</a>
				<a href="cartypechart.do" class="menu">
					<img src="" alt="">
					<h3>치종별 보유 수</h3>
				</a>
				<a href="brandchart.do" class="menu">
					<img src="" alt="">
					<h3>브랜드별 보유 수</h3>
				</a>
				<a href="monthbrandchart.do" class="menu">
					<img src="" alt="">
					<h3>브랜드별 월 렌트 수</h3>
				</a>
			</div>
		</section>
	</div>
	
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
</html>