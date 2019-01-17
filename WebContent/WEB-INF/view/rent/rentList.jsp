<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="${pageContext.request.contextPath }/css/common.css?csd" rel="stylesheet"  type="text/css">
<link href="${pageContext.request.contextPath }/css/rentList.css  ?b" rel="stylesheet"  type="text/css">
</head>
<body>
	<div id="container">
		<!-- header -->
	    <header>
			<jsp:include page="../admin.jsp"></jsp:include>
		</header>
		
		<!-- section -->
		<section>
			<div id="rentList_container">
			
			<!-- 리스트 -->
			<table>
				<tr>
					<td>대여코드</td>
					<td>고객코드</td>
					<td>대여일자</td>
					<td>반납일자</td>
					<td>반납여부</td>
				</tr>
				
				<c:forEach var="rent" items="${list }">
					<tr>
						<td><a href="#">${rent.code }</a></td>
						<td>${rent.customer_code.code }</td>
						<td>${rent.start_date }</td>
						<td>${rent.end_date }</td>
						<c:choose>
							<c:when test="${rent.is_return == false}">
								<td id="false">
									${rent.is_return eq false ? "N" : "Y"}
								</td>
							</c:when>
							<c:otherwise>
								<td id="true">
									${rent.is_return eq true ? "Y" : "N"}
								</td>
							</c:otherwise>
						</c:choose>
					</tr>
				</c:forEach>
			</table>
			</div>
				
		</section>

	</div>
	
	<!-- footer -->
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
	
	<!-- 스크립트 부분(위에 스크립트 있으면 datepicker 실행이 안됨) -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="${pageContext.request.contextPath }/js/rentSearchDateList.js?asdsdd"></script>
</body>
</html>