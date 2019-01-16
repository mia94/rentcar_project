<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/css/common.css?a" rel="stylesheet"  type="text/css">
<link href="${pageContext.request.contextPath }/css/common_orig.css" rel="stylesheet"  type="text/css">
<style>
	#wrap{
		width:550px;
		height:600px;
		margin: 50px auto;
	}
	#wrap h1{
		padding-bottom: 80px;
	}
	#wrap a{
		width:550px;
		height: 90px;
		float: left;
		margin-bottom: 5px;
		text-decoration: none;
		color:white;
		position: relative;
		overflow: hidden;
	}
	#wrap a img{
		width:550px;
		height: 90px;
		transform-origin:center;
		transition:all 1s;
	}
	#wrap a img:hover{
		transform:scale(1.1);
	}
	#wrap a h3{
		position: absolute;
		right:30px;
		top:30px;
	}
</style>
</head>
<body>
<div id="container">
		<header>
			<jsp:include page="../admin.jsp"></jsp:include>
		</header>
		
		<section>
			<div id="wrap">
			<h1>CAR CHART</h1>
				<a href="carchart.do" class="menu">
					<img src="${pageContext.request.contextPath }/upload/bar.png" alt="bar">
					<h3>차량별 렌트 수</h3>
				</a>
				<a href="cartypechart.do" class="menu">
					<img src="${pageContext.request.contextPath }/upload/pie.png" alt="pie">
					<h3>치종별 보유 수</h3>
				</a>
				<a href="brandchart.do" class="menu">
					<img src="${pageContext.request.contextPath }/upload/pie2.png" alt="pie2">
					<h3>브랜드별 보유 수</h3>
				</a>
				<a href="monthbrandchart.do" class="menu">
					<img src="${pageContext.request.contextPath }/upload/line.png" alt="line">
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