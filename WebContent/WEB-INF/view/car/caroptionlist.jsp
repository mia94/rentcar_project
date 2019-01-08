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
	aside{
		width:100px;
		height: 600px;
		background-color: #eeeeee;
		float: left;
		margin: 30px;
		padding: 10px;
	}
	aside ul{
		list-style: none;
		margin: 10px;
	}
	aside ul a{
		color:gray;
		text-decoration: none;
	}
	#wrap_wrap{
		width:1100px;
		margin: 30px auto;
		padding-left: 100px;
	}
	.wrap{
		width:450px;
		height:300px;
		float: left;
		border: 1px solid black;
		padding: 10px;
	}
	.input{
		text-align: center;
	}
	.list_p{
		height: 40px;
		width:400px;
		line-height:40px;
		overflow: hidden;
	}
	.list_p span{
		width:150px;
		float:left;
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
			<p>차종관리</p>
			<ul>
				<li><a href="#">추가</a></li>
				<li><a href="#">수정</a></li>
				<li><a href="#">삭제</a></li>
			</ul>
			<p>브랜드관리</p>
			<ul>
				<li><a href="#">추가</a></li>
				<li><a href="#">수정</a></li>
				<li><a href="#">삭제</a></li>
			</ul>
			<p>연료관리</p>
			<ul>
				<li><a href="#">추가</a></li>
				<li><a href="#">수정</a></li>
				<li><a href="#">삭제</a></li>
			</ul>
			<p>옵션관리</p>
			<ul>
				<li><a href="#">추가</a></li>
				<li><a href="#">수정</a></li>
				<li><a href="#">삭제</a></li>
			</ul>
		</aside>
			<div id="wrap_wrap">
			<div class="wrap">
				<h3>차종 관리</h3>
				<c:forEach var="item" items="${typeList }">
						<p class="list_p">
							<span>${item.code }</span>
							<span>${item.type }</span>
						</p>
				</c:forEach>
				<div class="input">
					<a href="brandupload.do">[추가]</a>
					<a href="#">[수정]</a>
					<a href="#">[삭제]</a>
				</div>
			</div>
			<div class="wrap">
				<h3>브랜드 관리</h3>
				<c:forEach var="item" items="${brandList }">
						<p class="list_p">
							<span>${item.no }</span>
							<span>${item.name }</span>
						</p>
				</c:forEach>
				<div class="input">
					<a href="#">[추가]</a>
					<a href="#">[수정]</a>
					<a href="#">[삭제]</a>
				</div>
			</div>
			<div class="wrap">
			<h3>연료 관리</h3>
				<c:forEach var="item" items="${fuelList }">
						<p class="list_p">
							<span>${item.no }</span>
							<span>${item.code }</span>
						</p>
				</c:forEach>
				<div class="input">
						<a href="#">[추가]</a>
						<a href="#">[수정]</a>
						<a href="#">[삭제]</a>
				</div>
			</div>
			<div class="wrap">
				<h3>옵션 관리</h3>
				<c:forEach var="item" items="${optionList }">
						<p class="list_p">
							<span>${item.no }</span>
							<span>${item.name }</span>
							<span>${item.price }</span>
						</p>	
				</c:forEach>
				<div class="input">
					<a href="#">[추가]</a>
					<a href="#">[수정]</a>
					<a href="#">[삭제]</a>
				</div>
			</div>
			</div>
		</section>
	</div>
	
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
</html>