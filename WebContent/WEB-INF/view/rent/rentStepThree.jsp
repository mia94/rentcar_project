<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="${pageContext.request.contextPath }/css/common.css" rel="stylesheet"  type="text/css">
<link href="${pageContext.request.contextPath }/css/rentStepThree.css" rel="stylesheet"  type="text/css">
</head>
	<div id="container">
		<!-- header -->
	    <header>
			<jsp:include page="../header.jsp"></jsp:include>
		</header>
		
		<!-- section -->
		<section>
			<div id="rentStepThree_container">
				${sDate } <br>
				${sHour } <br>
				${sMin } <br>
				${eDate } <br>
				${eHour } <br>
				${eMin } <br>
				${cName } <br>
				${cCode } <br>
			</div>
		</section>
	
				
	</div>
	
	<!-- footer -->
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>

	<!-- 스크립트 부분(위에 스크립트 있으면 datepicker 실행이 안됨) -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="${pageContext.request.contextPath }/js/rentStep.js"></script>
</html>