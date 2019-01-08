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
	#list_wrap{
		width:1100px;
		margin: 0 auto;
		overflow:hidden;
	}
	ul{
		height: 60px;
		list-style: none;
		margin: 10px; 
	}
	ul li{
		float:left;
		border:1px solid white;	
		text-align: center;
	}
	ul li a{
		text-decoration: none;
		float:left;
		width:175px;
		height: 60px;
		line-height: 60px;
		color:white;
		background-color: gray;
	}
	.btn{
		display: block;
	}
	article{
		width:340px;
		padding:10px;
		height:200px;
		border:1px solid gray;
		float: left;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(function(){
		
			
	})
</script>
</head>
<body>
	<div id="container">
		<header>
			<jsp:include page="../header.jsp"></jsp:include>
		</header>
		
		<section>
		<h1>차량 목록</h1>
		
			<div id="list_wrap">
				<a href="uploadcar.do" class="btn">자동차 추가하기</a>
				<a href="caroptionlist.do" class="btn">차량 옵션 관리창으로 이동</a>
				<ul>
					<li><a href="select.do?cartype=S1">경형</a></li>
					<li><a href="select.do?cartype=S2">소형</a></li>
					<li><a href="select.do?cartype=S3">중형</a></li>
					<li><a href="select.do?cartype=S4">대형</a></li>
					<li><a href="select.do?cartype=S5">승합</a></li>
					<li><a href="select.do?cartype=S6">suv</a></li>
				</ul>
				<c:forEach var="item" items="${list }">
				<a href="carread.do?carCode=${item.carCode }">
					<article data-index='i'>
						<p>${item.carCode }</p>
						<p>${item.name }</p>
						<%-- <p>${item.cartype }</p>
						<p>${item.brand.name }</p>
						<p>${item.color }</p> --%>	
					</article>
				</a>
				</c:forEach>
				
			</div>
		</section>
	</div>
	
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
</html>