<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="${pageContext.request.contextPath }/css/common.css" rel="stylesheet"  type="text/css">
<link href="${pageContext.request.contextPath }/css/rentStepOne.css?bcd" rel="stylesheet"  type="text/css">
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
			
				<div id="rentInfoTitle"><h3>대여기간 정보</h3></div><br>
				<div id="rentInfo">
					대여일 : ${start }<br>
					대여시간 : ${startH }<br>
					대여 분 : ${startM }<br>
					반납일 : ${end }<br>
					반납시간 : ${endH }<br>
					반납 분 : ${endM } <br>
					총 대여일 : ${rentDate }<br>
					차량 유형 : ${carType }<br>
				</div>
				
				<div id="searchCarTitle"><h3>차량 선택</h3></div>
				<div id="searchCar">
					<ul>
					<c:forEach var="car" items="${list }">
						<li>
							<dl>
								<dt><span class="title">${car.name }</span></dt>
								<dd>
									<div class="img">
										<img src="${pageContext.request.contextPath }/upload/${car.carCode }.png" class='carImg'>
									</div>
									<div class="info">
										<img src="${pageContext.request.contextPath }/upload/${car.fuel.code }.png">
										<img src="${pageContext.request.contextPath }/upload/${car.brand.name }.png" class='carBrand'>
									</div>
									<span class="rentPrice">${car.basicCharge }</span>
									<button type="button" class="btnRentBook">예약</button>
								</dd>
							</dl>
						</li>
					</c:forEach>
					</ul>
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
	<script src="${pageContext.request.contextPath }/js/rentStepOne.js?ca"></script>
</body>
</html>