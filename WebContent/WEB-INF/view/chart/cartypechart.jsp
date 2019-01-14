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
	#chart{
		width:500px;
		height: 400px;
		margin: 50px auto;
	}
</style>
</head>
<body>
<div id="container">
		<header>
			<jsp:include page="../header.jsp"></jsp:include>
		</header>
		
		<section>
			<h1>차트</h1>
			<span id="info">차종별 보유 수</span>
			<div id="chart"></div>

		</section>
	</div>
	
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
<script class="include" type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.jqplot.min.js"></script>
<script class="include" language="javascript" type="text/javascript" src="${pageContext.request.contextPath }/js/jqplot.barRenderer.min.js"></script>
<script class="include" language="javascript" type="text/javascript" src="${pageContext.request.contextPath }/js/jqplot.categoryAxisRenderer.min.js"></script>
<script class="include" language="javascript" type="text/javascript" src="${pageContext.request.contextPath }/js/jqplot.pointLabels.min.js"></script>
<script>
	$(function(){
	  
	})
</script>
</body>
</html>