<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="${pageContext.request.contextPath }/css/common.css" rel="stylesheet"  type="text/css">
<link href="${pageContext.request.contextPath }/css/reservation.css?b" rel="stylesheet"  type="text/css">
</head>
<body>
	<div id="container">
		<!-- header -->
	    <header>
			<jsp:include page="../header.jsp"></jsp:include>
		</header>
		
		<!-- section -->
		<section>
			<div id="date_container">
				<h2>기간 선택</h2><hr>
				<button id="calRentDate">대여일 계산</button>
				<!-- 대여일 선택 -->
				<div id="choose_rent_start">
					<input type="text" id="start_date" placeholder="대여일 선택" readonly>
				</div>
				
				<!-- 대여 시간 -->
				<div class="selectWrap">
					<div class="defaultTitle">시간 선택</div>
					<ul class="selectbox">
						<li><a href="#">09시</a></li>
						<li><a href="#">10시</a></li>
						<li><a href="#">11시</a></li>
						<li><a href="#">12시</a></li>
						<li><a href="#">13시</a></li>
						<li><a href="#">14시</a></li>
						<li><a href="#">15시</a></li>
						<li><a href="#">16시</a></li>
						<li><a href="#">17시</a></li>
						<li><a href="#">18시</a></li>
						<li><a href="#">19시</a></li>
						<li><a href="#">20시</a></li>
					</ul>
				</div>
				
				<!-- 대여 분 -->
				<div class="selectWrapMinute">
					<div class="defaultTitleMinute">분 선택</div>
					<ul class="selectboxMinute">
						<li><a href="#">00분</a></li>
						<li><a href="#">30분</a></li>
					</ul>
				</div>
				
				<!-- 반납일 선택 -->
				<div id="choose_rent_end">
					<input type="text" id="end_date" placeholder="반납일 선택" readonly>
				</div>
				
				<!-- 반납 시간 -->
				<div class="selectWrap2">
					<div class="defaultTitle2">시간 선택</div>
					<ul class="selectbox2">
						<li><a href="#">09시</a></li>
						<li><a href="#">10시</a></li>
						<li><a href="#">11시</a></li>
						<li><a href="#">12시</a></li>
						<li><a href="#">13시</a></li>
						<li><a href="#">14시</a></li>
						<li><a href="#">15시</a></li>
						<li><a href="#">16시</a></li>
						<li><a href="#">17시</a></li>
						<li><a href="#">18시</a></li>
						<li><a href="#">19시</a></li>
						<li><a href="#">20시</a></li>
					</ul>
				</div>
				
				<!-- 반납 분 -->
				<div class="selectWrapMinute2">
					<div class="defaultTitleMinute2">분 선택</div>
					<ul class="selectboxMinute2">
						<li><a href="#">00분</a></li>
						<li><a href="#">30분</a></li>
					</ul>
				</div>
				
				<!-- 총 대여시간 표시 -->
				<div class="dateTotalTimeWrap">
					총 대여기간 : <span id="diff">0</span>일
				</div>
				
			</div>
			
			<br><br>     
			
			<!-- 차량 유형 선택 -->
			<div id="cartype_container">
				<h2>차량 유형 선택</h2><hr>
				<nav id="tapMenu">
					<ul>
						<li><a href="#"><img src="${pageContext.request.contextPath }/images/경차b.png" class="carImg"><span class='carType'>경차</span></a></li>
						<li><a href="#"><img src="${pageContext.request.contextPath }/images/소형b.png" class="carImg"><span class='carType'>소형</span></a></li>
						<li><a href="#"><img src="${pageContext.request.contextPath }/images/중형b.png" class="carImg"><span class='carType'>중형</span></a></li>
						<li><a href="#"><img src="${pageContext.request.contextPath }/images/대형b.png" class="carImg"><span class='carType'>대형</span></a></li>
						<li><a href="#"><img src="${pageContext.request.contextPath }/images/승합b.png" class="carImg"><span class='carType'>승합</span></a></li>
						<li><a href="#"><img src="${pageContext.request.contextPath }/images/SUVb.png" class="carImg"><span class='carType'>SUV</span></a></li>
					</ul>
				</nav>
			</div>
			
			<div id="btn_wrap">
				<div id="cancelWrap"><a href="${pageContext.request.contextPath }/reservation.do" id="cancel">취소</a></div>
				<button type="button" id="btnNext">다음</button>
			</div>
			
		</section>
		
		<form id="reserve" action="${pageContext.request.contextPath }/rentStepOne.do" method="post">
			<input type="hidden" name="startDate" id="startDate">
			<input type="hidden" name="startHour" id="startHour">
			<input type="hidden" name="startMin" id="startMin">
			<input type="hidden" name="endDate" id="endDate">
			<input type="hidden" name="endHour" id="endHour">
			<input type="hidden" name="endMin" id="endMin">
			<input type="hidden" name="selectCarType" id="selectCarType">
			<input type="hidden" name="totalRentDate" id="totalRentDate">
		</form>
		
	</div>
	
	<!-- footer -->
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>

	<!-- 스크립트 부분(위에 스크립트 있으면 datepicker 실행이 안됨) -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="${pageContext.request.contextPath }/js/reservation.js?b"></script>
</body>
</html>