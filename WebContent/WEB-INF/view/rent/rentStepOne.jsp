<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="${pageContext.request.contextPath }/css/common.css?bds" rel="stylesheet"  type="text/css">
<link href="${pageContext.request.contextPath }/css/rentStepOne.css?cdas" rel="stylesheet"  type="text/css">
</head>
<body>
	<div id="container">
		<!-- header -->
	    <header>
			<jsp:include page="../header.jsp"></jsp:include>
		</header>
		
		<!-- section -->
		<section>
			<div id="rentStepOne_container">
			
				<div id="rentInfoTitle"><h3>대여기간 정보</h3></div>
				<div id="searchCarTitle"><h3>차량 선택</h3></div>
				
				<br>
				<div id="rentInfo">
					<ul>
						<li>
							<span class="tit">대여일</span>
							<span class="res">${start } ${startH } ${startM }</span>
						</li>
						<li>
							<span class="tit">반납일</span>
							<span class="res">${end } ${endH } ${endM }</span>
						</li>
						<li>
							<span class="tit">대여기간</span>
							<span class="res"><strong>${rentDate }</strong>일</span>
						</li>
						<li>
							<span class="tit">차량 유형</span>
							<span class="res">${carType }</span>
						</li>
					</ul>
				</div>
				
				
				<div id="searchCar">
					<ul>
					<c:forEach var="car" items="${list }">
						<li>
							<dl>
								<dd>
									<div class="img">
										<img src="${pageContext.request.contextPath }/upload/${car.carCode }.png" class='carImg'>
									</div>
									<div class="info">
										<span class="title">${car.name }</span>
										<span class="rentPrice">${car.basicCharge }원</span><br>
		
										<div id="temp">
											<img src="${pageContext.request.contextPath }/upload/${car.fuel.code }.png" class='fuel'>
											<img src="${pageContext.request.contextPath }/upload/${car.brand.name }.png" class='carBrand'>
											<button type="button" class="btnRentBook" data-carCode="${car.carCode }" data-basicPrice="${car.basicCharge }" data-carName="${car.name }">예약</button>
										</div>
	
									</div>
					
								</dd>
							</dl>
						</li>
					</c:forEach>
					</ul>
				</div>
				
			</div>
		</section>
		
		<form id="stepOne" action="${pageContext.request.contextPath }/rentStepTwo.do" method="post">
			<input type="hidden" name="sDate" id="sDate" value="${start }">
			<input type="hidden" name="sHour" id="sHour" value="${startH }">
			<input type="hidden" name="sMin" id="sMin" value="${startM }">
			<input type="hidden" name="eDate" id="eDate" value="${end }">
			<input type="hidden" name="eHour" id="eHour" value="${endH }">
			<input type="hidden" name="eMin" id="eMin" value="${endM }">
			<input type="hidden" name="rDate" id="rDate" value="${rentDate }">
			<input type="hidden" name="carName" id="carName">
			<input type="hidden" name="carCode" id="carCode">
			<input type="hidden" name="basicPrice" id="basicPrice">
		</form>
		
	</div>
	
	<!-- footer -->
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>

	<!-- 스크립트 부분(위에 스크립트 있으면 datepicker 실행이 안됨) -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="${pageContext.request.contextPath }/js/rentStep.js?cassdfs"></script>
</body>
</html>