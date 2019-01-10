<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="${pageContext.request.contextPath }/css/common.css" rel="stylesheet"  type="text/css">
<link href="${pageContext.request.contextPath }/css/reservation.css?ab" rel="stylesheet"  type="text/css">
</head>
<body>
	<div id="container">
		<!-- header -->
	    <header>
			<jsp:include page="../header.jsp"></jsp:include>
		</header>
		
		<!-- section -->
		<section>
			대여일 : ${start }<br>
			대여시간 : ${startH }<br>
			대여 분 : ${startM }<br>
			반납일 : ${end }<br>
			반납시간 : ${endH }<br>
			반납 분 : ${endM } <br>
			총 대여일 : ${rentDate }<br>
			차량 유형 : ${carType }<br>
		</section>
		
	</div>
	
	<!-- footer -->
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>

	<!-- 스크립트 부분(위에 스크립트 있으면 datepicker 실행이 안됨) -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="${pageContext.request.contextPath }/js/reservation.js?ca"></script>
</body>
</html>