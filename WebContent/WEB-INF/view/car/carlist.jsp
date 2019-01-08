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
	#uploadBtn{
		display: block;
	}
	article{
		width:200px;
		height:200px;
		border:1px solid gray;
		float: left;
	}
</style>
</head>
<body>
	<div id="container">
		<header>
			<jsp:include page="../header.jsp"></jsp:include>
		</header>
		
		<section>
			<div id="list_wrap">
				<a href="uploadcar.do" id="uploadBtn">자동차 추가하기</a>
				
				<c:forEach var="item" items="${list }">
				<a href="carread.do">
					<article data-index='i'>
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