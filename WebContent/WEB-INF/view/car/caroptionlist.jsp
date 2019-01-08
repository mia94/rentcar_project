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
	.wrap{
		width:550px;
		height:300px;
		float: left;
		border: 1px solid black;
		padding: 10px;
	}
	.input{
		width:300px;
		float: right;
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
			<div class="wrap">
				<c:forEach var="item" items="${typeList }">
						<p>${item.type }</p>
						<%-- <p>${item.cartype }</p>
						<p>${item.brand.name }</p>
						<p>${item.color }</p> --%>	
				</c:forEach>
				<div class="input">
					<p>
						<label>차종코드</label>
						<input type="text" name="cartypeCode">
					</p>
					<p>
						<label>차종 이름</label>
						<input type="text" name="cartypeName">
					</p>
					<a href="brandupload.do">[추가]</a>
					<a href="#">[수정]</a>
					<a href="#">[삭제]</a>
				</div>
			</div>
			<div class="wrap">
				<c:forEach var="item" items="${brandList }">
						<p>${item.name }</p>
						<%-- <p>${item.cartype }</p>
						<p>${item.brand.name }</p>
						<p>${item.color }</p> --%>	
				</c:forEach>
				<div class="input">
						<p>
							<label>브랜드코드</label>
							<input type="text" name="brandCode">
						</p>
						<p>
							<label>브랜드 이름</label>
							<input type="text" name="brandname">
						</p>
					<a href="#">[추가]</a>
					<a href="#">[수정]</a>
					<a href="#">[삭제]</a>
				</div>
			</div>
			<div class="wrap">
				<c:forEach var="item" items="${fuelList }">
						<p>${item.code }</p>
						<%-- <p>${item.cartype }</p>
						<p>${item.brand.name }</p>
						<p>${item.color }</p> --%>	
				</c:forEach>
				<div class="input">
						<p>
							<label>연료코드</label>
							<input type="text" name="fuelCode">
						</p>
						<p>
							<label>연료 이름</label>
							<input type="text" name="fuelName">
						</p>
						<a href="#">[추가]</a>
						<a href="#">[수정]</a>
						<a href="#">[삭제]</a>
				</div>
			</div>
			<div class="wrap">
				<c:forEach var="item" items="${optionList }">
						<p>${item.price }</p>
						<%-- <p>${item.cartype }</p>
						<p>${item.brand.name }</p>
						<p>${item.color }</p> --%>	
				</c:forEach>
				<div class="input">
					
						<p>
							<label>옵션 코드</label>
							<input type="text" name="optionCode">
						</p>
						<p>
							<label>옵션 이름</label>
							<input type="text" name="optionName">
						</p>
						<p>
							<label>옵션 가격</label>
							<input type="text" name="optionPrice">
						</p>
						<a href="#">[추가]</a>
						<a href="#">[수정]</a>
						<a href="#">[삭제]</a>
					
				</div>
			</div>
		</section>
	</div>
	
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
</html>