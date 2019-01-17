<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/css/common.css?a" rel="stylesheet"  type="text/css">
<link href="${pageContext.request.contextPath }/css/common_orig.css" rel="stylesheet"  type="text/css">
<link href="${pageContext.request.contextPath }/css/rentSuccess.css?sbb" rel="stylesheet"  type="text/css">
</head>
<body>
	<div id="container">
		<!-- header -->
	    <header>
			<jsp:include page="../guest.jsp"></jsp:include>
		</header>
		
		<!-- section -->
		<section>
			<div id="rentSuccess_container">
				<div id="temp">
					<div id="titWrap">
						<span id="tit">차량 예약을 완료했습니다.</span>
					</div>
					
					<div id="btnWrap">
						<div id="backHome"><a href="${pageContext.request.contextPath }/home.do">홈으로</a></div>
						<div id="rentInfo"><a href="${pageContext.request.contextPath }/rentChkList.do">예약내역 확인하기</a></div>
					</div>
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
	<script src="${pageContext.request.contextPath }/js/rentStep.js?"></script>
</body>
</html>