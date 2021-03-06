<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="${pageContext.request.contextPath }/css/common.css?asdfa" rel="stylesheet"  type="text/css">
<link href="${pageContext.request.contextPath }/css/common_orig.css" rel="stylesheet"  type="text/css">
<link href="${pageContext.request.contextPath }/css/rentStepTwo.css?bcd" rel="stylesheet"  type="text/css">
</head>
<body>

	<div id="container">
		<!-- header -->
	    <header>
			<jsp:include page="../guest.jsp"></jsp:include>
		</header>
		
		<!-- section -->
		<section>
			<div id="rentStepTwo_container">
				<div id="leftWrap">
					<div id="dateInfo">
						<span id="rentDate">${sDate } &nbsp;${sHour } ${sMin }</span>
						<span id="and">&nbsp;▶&nbsp;</span>
						<span id="returnDate">${eDate } &nbsp;${eHour } ${eMin }</span>
					</div>
					<div id="carInfo">
						<h3>${carName }</h3>
						<div id="carImg">
							<img src="${pageContext.request.contextPath }/upload/${carCode }.png" class='carImg'>	
						</div>
						<p class="notice">
							※ 실제 대여하는 차량과 외관, 색상, 옵션 등에서 차이가 있을 수 있습니다.
						</p>
					</div>
					<div id="priceInfo">
						<ul>
							<li>
								<span class='tit'>·&nbsp;대여금액</span>
								<div class="resPrice">
									<span class='price'>
										<fmt:formatNumber value="${basicPrice * rDate }" type="number"></fmt:formatNumber>
									</span>
									<span class='won'>원</span>
								</div>
							</li>
							<li>
								<span class='tit'>·&nbsp;할인금액</span>
								<div class="resPrice">
									<span id='discountPrice'>0</span>
									<span class='won'>원</span>
								</div>
							</li>
							<li>
								<span class='tit'>·&nbsp;보험</span>
								<div class="resPrice">
									<span id='insurancePrice'>0</span>
									<span class='won'>원</span>
								</div>
							</li>
							<li>
								<span class='tit'>·&nbsp;차량 옵션</span>
								<div class="resPrice">
									<span id='optionPrice'>0</span>
									<span class='won'>원</span>
								</div>
							</li>
							<li>
								<div id="temp">
									<span id='totalTit'>금액</span>
									<div id="tResult">
										<span id='totalPrice'><fmt:formatNumber value="${basicPrice * rDate }" type="number"></fmt:formatNumber></span>
										<span id='totalWon'>원</span>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
				
				<div id="rightWrap">
					<div id="event">
						<h3>이벤트/할인</h3>
						<ul>
							<li>
								<input type="radio" name="discount" value="${list[0].gradeCode.rate }" >
								<label class='titList'>회원 할인 (${list[0].gradeCode.rate }%)</label>
							</li>
							<li>
								<input type="radio" name="discount" value="이벤트">
								<label class='discountList'>이벤트</label>
								<span id='selected'>
									<select id='selEvt' name='selEvt' disabled="disabled">
										<option value="선택">선택</option>
										<c:forEach var="customer" items="${list }">
											<c:forEach var="events" items="${customer.events }">
												<c:forEach var="event" items="${events.events }">
													<option value="${event.rate }" >${event.name} (${event.rate}% 할인)</option>
												</c:forEach>												
											</c:forEach>
											
										</c:forEach>
									</select>
								</span>
							</li>
							<li id="evtNotice">
								·&nbsp;할인은 회원 할인, 이벤트 할인 중 하나만 적용 가능하며 할인율은 대여요금에서만 적용됩니다.
							</li>
						</ul>
					</div>
					
					<div id="insurance">
						<h3 id="cdw">자차손해 면책 제도(CDW)</h3>
						<ul>
							<li>
								<input type="radio" name="rdIns" value="0">
								<label class='titList'>보험 미적용 (0원)</label>
							</li>
							<li>
								<input type="radio" name="rdIns" value="${i.price }">
								<label class='titList'>완전자차 (<fmt:formatNumber value="${i.price }" type="number"></fmt:formatNumber>원)</label>
							</li>
						</ul>
					</div>
					
					<div id="option">
						<h3 id="opt">차량 옵션</h3>
						<ul class='optChk'>
							<li>
								<input type="checkbox" class="optionChk" value="5000">
								<label class='titList'>카시트(Car Seat)</label>
							</li>
							<li>
								<input type="checkbox" class="optionChk" value="6000">
								<label class='titList'>블랙박스(Black Box)</label>
							</li>
							<li>
								<input type="checkbox" class="optionChk" value="7000">
								<label class='titList'>선루프(Sun Roof)</label>
							</li>
						</ul>
					</div>
				</div>
				
				<div id="btnWrap">
					<button type="button" id="btnNext">다음</button>
				</div>				
				
			</div>
		</section>
		
		<!-- 다음 페이지 -->
		<form id="stepTwo" action="${pageContext.request.contextPath }/rentStepThree.do" method="post">
			<input type="hidden" name="sDate" id="sDate" value="${sDate }">
			<input type="hidden" name="sHour" id="sHour" value="${sHour }">
			<input type="hidden" name="sMin" id="sMin" value="${sMin }">
			<input type="hidden" name="eDate" id="eDate" value="${eDate }">
			<input type="hidden" name="eHour" id="eHour" value="${eHour }">
			<input type="hidden" name="eMin" id="eMin" value="${eMin }">
			<input type="hidden" name="cName" id="cName" value="${carName }">
			<input type="hidden" name="cCode" id="cCode" value="${carCode }">	
			<input type="hidden" name="basicPrice" id="basicPrice">
			<input type="hidden" name="dPrice" id="dPrice">	
			<input type="hidden" name="iPrice" id="iPrice">	
			<input type="hidden" name="carOptPrice" id="carOptPrice">	
			<input type="hidden" name="totalRentPrice" id="totalRentPrice">
			<input type="hidden" name="carBasicPrice" id="carBasicPrice" value="${basicPrice }">
			<input type="hidden" name="insuranceInfo" id="insuranceInfo" value="${i.code }">
			<input type="hidden" name="eCode" id="eCode" >
		</form>
				
	</div>
	
	<!-- footer -->
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>

	<!-- 스크립트 부분(위에 스크립트 있으면 datepicker 실행이 안됨) -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js?a"></script>
	<script src="${pageContext.request.contextPath }/js/rentStep.js?a"></script>
</body>
</html>