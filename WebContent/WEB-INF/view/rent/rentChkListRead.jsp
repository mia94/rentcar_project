<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="${pageContext.request.contextPath }/css/common.css?a" rel="stylesheet"  type="text/css">
<link href="${pageContext.request.contextPath }/css/rentChkListRead.css?dccc" rel="stylesheet"  type="text/css">
</head>
<body>
<div id="container">
		<!-- header -->
	    <header>
			<jsp:include page="../guest.jsp"></jsp:include>
		</header>
		
		<!-- section -->
		<section>
			<div id="rentChkListRead_container">
				<div id="leftWrap">
					<div id="carInfo">
						<h3>${name }</h3>
						<div id="carImg">
							<img src="${pageContext.request.contextPath }/upload/${map.rent.car_code.carCode }.png" class='carImg'>
						</div>
					</div>
				</div>
				
				<div id="rightWrap">
					<h3>대여내역 상세정보</h3>
					<table>
						<tr>
							<td><strong>대여일자</strong></td>
							<td>${map.rent.start_date }&nbsp;${map.rent.start_time }</td>
						</tr>
						<tr>
							<td><b>반납일자</b></td>
							<td>${map.rent.end_date }&nbsp;${map.rent.end_time }</td>
						</tr>
						<tr>
							<td><b>자차손해 면책 제도(CDW)</b></td>
							<c:choose>
								<c:when test="${map.rent.insurance_code.code == 'I000' }">
									<td>보험 미적용</td>
								</c:when>
								<c:otherwise>
									<td>완전자차</td>
								</c:otherwise>
							</c:choose>
						</tr>
						<tr>
							<td><b>차량 옵션</b></td>
							<c:choose>
								<c:when test="${map.rent.opt_price == 0 }">
									<td>없음</td>
								</c:when>
								<c:when test="${map.rent.opt_price == 5000 }">
									<td>카시트</td>
								</c:when>
								<c:when test="${map.rent.opt_price == 6000 }">
									<td>블랙박스</td>
								</c:when>
								<c:when test="${map.rent.opt_price == 7000 }">
									<td>선루프</td>
								</c:when>
								<c:when test="${map.rent.opt_price == 11000 }">
									<td>카시트, 블랙박스</td>
								</c:when>
								<c:when test="${map.rent.opt_price == 12000 }">
									<td>카시트, 선루프</td>
								</c:when>
								<c:when test="${map.rent.opt_price == 13000 }">
									<td>블랙박스, 선루프</td>
								</c:when>
								<c:when test="${map.rent.opt_price == 18000 }">
									<td>카시트, 블랙박스, 선루프</td>
								</c:when>
							</c:choose>
						</tr>
					</table>
				</div>
					
				<!-- 리스트로 이동하기 -->
				<div id="btnWrap">
					<div id="backHome"><a href="${pageContext.request.contextPath }/home.do">홈으로</a></div>
					<div id="backList"><a href="${pageContext.request.contextPath }/rentChkList.do">대여내역 보기</a></div>
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