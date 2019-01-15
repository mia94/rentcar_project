<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/css/common.css" rel="stylesheet"  type="text/css">
<style>
	#chart_wrap{
		width:1000px;
		margin: 50px auto; 
		height: 600px;
		position: relative;
	}
	#chart{
		width:600px;
		height: 400px;
		margin: 0 auto;
	}
	#info{
		position: absolute;
		bottom: 20px;
		left: 500px;
	}
</style>
</head>
<body>
	<div id="container">
		<header>
			<jsp:include page="../header.jsp"></jsp:include>
		</header>
		
		<section>
		<jsp:include page="chartmenu.jsp"></jsp:include>
			<div id="chart_wrap">
				<div id="chart"></div>
				<span id="info">월별 렌트 수</span>
			</div>
		</section>
	</div>
	
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
</body>
</html>