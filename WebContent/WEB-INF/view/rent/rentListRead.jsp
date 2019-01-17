<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="${pageContext.request.contextPath }/css/common.css?ab" rel="stylesheet"  type="text/css">
</head>
<body>
<div id="container">
		<!-- header -->
	    <header>
			<jsp:include page="../admin.jsp"></jsp:include>
		</header>
		
		<!-- section -->
		<section>
			<div id="rentListRead_container">
				<p>${map.rentInfo.code }</p>
				<p>${map.rentInfo.start_date }</p>
				<p>${map.rentInfo.start_time }</p>
				<p>${map.rentInfo.end_date }</p>
				<p>${map.rentInfo.end_time }</p>
				<p>${map.rentInfo.is_return }</p>
				<p>${map.rentInfo.basic_price }</p>
				<p>${map.rentInfo.e_code }</p>
				<p>${map.rentInfo.opt_price }</p>
				<p>${map.rentInfo.customer_code.code }</p>
				<p>${map.rentInfo.customer_code.name }</p>
				</div>
					
				<!-- 리스트로 이동하기 -->
				<div id="btnWrap">
					<div id="backHome"><a href="${pageContext.request.contextPath }/home.do">홈으로</a></div>
					<div id="backList"><a href="${pageContext.request.contextPath }/rentList.do">대여내역 보기</a></div>
				</div>		
			</div>
		</section>

	</div>
	
	<!-- footer -->
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
	
	<!-- 스크립트 부분(위에 스크립트 있으면 datepicker 실행이 안됨) -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</body>
</html>