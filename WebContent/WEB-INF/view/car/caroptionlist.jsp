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
	#wrap_wrap{
		width:1100px;
		margin: 30px auto;
		padding-right: 100px;
	}
	.wrap{
		width:800px;
		height:298px; 
		margin-left:100px;
		border:1px solid black;
	}
	.wrap h1{
		width:470px; 
		height: 297px;
		line-height:297px;
		text-align:center;
		float: left;
		background-color: #eeeeee;
	}
	.list_p{
		height: 40px;
		width:280px;
		line-height:40px;
		overflow: hidden;
	}
	.list_p span{
		float: left;
		width:100px;
		text-align: center;
	}
</style>
</head>
<body>
	<div id="container">
		<header>
			<jsp:include page="../header.jsp"></jsp:include>
		</header>
		
		<section>
			<h1>차량옵션 관리</h1>
		<aside>
			<jsp:include page="aside.jsp"></jsp:include>
		</aside>
			<div id="wrap_wrap">
			<div class="wrap">
				<h1>차종</h1>
				<c:forEach var="item" items="${typeList }">
						<p class="list_p">
							<span>${item.code }</span>
							<span>${item.type }</span>
						</p>
				</c:forEach>
			</div>
			<div class="wrap">
				<h1>브랜드</h1>
				<c:forEach var="item" items="${brandList }">
						<p class="list_p">
							<span>${item.no }</span>
							<span>${item.name }</span>
						</p>
				</c:forEach>
			</div>
			<div class="wrap">
			<h1>연료</h1>
				<c:forEach var="item" items="${fuelList }">
						<p class="list_p">
							<span>${item.no }</span>
							<span>${item.code }</span>
						</p>
				</c:forEach>
			</div>
			<div class="wrap">
				<h1>옵션</h1>
				<c:forEach var="item" items="${optionList }">
						<p class="list_p">
							<span>${item.no }</span>
							<span>${item.name }</span>
							<span>${item.price }</span>
						</p>	
				</c:forEach>
			</div>
			</div>
		</section>
	</div>
	
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
</html>