<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="${pageContext.request.contextPath }/css/common.css?ab" rel="stylesheet"  type="text/css">
<link href="${pageContext.request.contextPath }/css/rentListRead.css?ab" rel="stylesheet"  type="text/css">
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
				<!-- 왼쪽 : 차량 대여 정보 -->
				<div id="leftWrap">
					<div id="carInfo">
						<div id='rentInfo'>
							<span id='rentInfoTit'>대여코드&nbsp;${map.rentInfo.code }</span>
						</div>
						<div id="carImg">
							<h3>${map.rentInfo.car_code.name }(${map.rentInfo.car_code.carType.type})</h3>
							
							<img src="${pageContext.request.contextPath }/upload/${map.rentInfo.car_code.carCode }.png" class='carImg'>
						</div>
						<div id='priceInfo'>
							<span id='priceTit'>차량 기본 금액</span>
							<span id='priceContent'>${map.rentInfo.basic_price }</span><b>원</b>
						</div>
					</div>
				</div>
				
				<!-- 오른쪽 : 고객 대여 정보-->
				<div id="rightWrap">
					<h3>대여내역 상세정보</h3>
					<table>
						<tr>
							<td><b>고객코드</b></td>
							<td>${map.rentInfo.customer_code.code }</td>
							<td><b>고객명</b></td>
							<td>${map.rentInfo.customer_code.name }</td>
							<td><b>고객등급</b></td>
							<td>${map.rentInfo.customer_code.gradeCode.name }</td>
						</tr>
						<tr>
							<td colspan="3"><b>대여일자</b></td>
							<td colspan="3">${map.rentInfo.start_date }&nbsp;${map.rentInfo.start_time }</td>
						</tr>
						<tr>
							<td colspan="3"><b>반납일자</b></td>
							<td colspan="3">${map.rentInfo.end_date }&nbsp;${map.rentInfo.end_time }</td>
						</tr>
						<tr>
							<td colspan="3" style='background-color: #F6F6F6'><b>반납여부</b></td>
							<c:choose>
								<c:when test="${map.rentInfo.is_return eq false }">
									<td colspan="3" id='false' style='background-color: #FFEAEA'>
										${map.rentInfo.is_return eq false ? "N" : "Y"}
									</td>
								</c:when>
								<c:otherwise>
									<td colspan="3" id="true" style='background-color: #EBF7FF'>
										${map.rentInfo.is_return eq true ? "Y" : "N"}
									</td>
								</c:otherwise>
							</c:choose>
						</tr>
						<tr>
							<td colspan="3"><b>이벤트</b></td>
							<td colspan="3">${map.rentInfo.e_code eq "EVT2" ? "생일 축하(EVT2)" : "첫 가입(EVT1)" }</td>
						</tr>
						<tr>
							<td colspan="3"><b>자차손해 면책 제도(CDW)</b></td>
							<td colspan="3">${map.rentInfo.insurance_code.code eq "I000" ? "보험 미적용" : "완전자차" }</td>
						</tr>
						<tr>
							<td colspan="3"><b>차량 옵션</b></td>
							<c:choose>
								<c:when test="${map.rentInfo.opt_price == 0 }">
									<td colspan="3">없음</td>
								</c:when>
								<c:when test="${map.rentInfo.opt_price == 5000 }">
									<td colspan="3">카시트</td>
								</c:when>
								<c:when test="${map.rentInfo.opt_price == 6000 }">
									<td colspan="3">블랙박스</td>
								</c:when>
								<c:when test="${map.rentInfo.opt_price == 7000 }">
									<td colspan="3">선루프</td>
								</c:when>
								<c:when test="${map.rentInfo.opt_price == 11000 }">
									<td colspan="3">카시트, 블랙박스</td>
								</c:when>
								<c:when test="${map.rentInfo.opt_price == 12000 }">
									<td colspan="3">카시트, 선루프</td>
								</c:when>
								<c:when test="${map.rentInfo.opt_price == 13000 }">
									<td colspan="3">블랙박스, 선루프</td>
								</c:when>
								<c:when test="${map.rentInfo.opt_price == 18000 }">
									<td colspan="3">카시트, 블랙박스, 선루프</td>
								</c:when>
							</c:choose>
						</tr>
						<tr>
							<td colspan="3" style='color: #212121'><b>초과 요금</b></td>
							<td colspan="3" style='color: #212121'><span id='overdue'>0</span>원</td>
						</tr>
					</table>
				</div>
				
				<!-- 리스트로 이동하기 -->
				<div id="btnWrap">
					<div id="btnReturn"><a href="${pageContext.request.contextPath }/home.do">반납</a></div>
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