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
<link href="${pageContext.request.contextPath }/css/rentStepTwo.css?cdas" rel="stylesheet"  type="text/css">
</head>
<body>

	<div id="container">
		<!-- header -->
	    <header>
			<jsp:include page="../header.jsp"></jsp:include>
		</header>
		
		<!-- section -->
		<section>
			<div id="rentStepTwo_container">
				<div id="leftWrap">
					<div id="dateInfo">
						<span id="rentDate">${sDate } ${sHour } ${sMin }</span>
						<span id="returnDate">${eDate } ${eHour } ${eMin }</span>
					</div>
					<div id="carInfo">
						<h3>${carName }</h3>
						<div id="carImg">
							<img src="${pageContext.request.contextPath }/upload/${carCode }.png">	
						</div>
						<p class="notice">
							실제 대여하는 차량과 외관, 색상, 옵션 등에서 차이가 있을 수 있습니다.
						</p>
					</div>
					<div id="priceInfo">
						<ul>
							<li>
								<span class='tit'>대여금액</span>
								<span class='price'>
									${basicPrice * rDate }
									<span class='won'>원</span>
								</span>
							</li>
							<li>
								<span class='tit'>할인금액</span>
								<span class='price'>
									
									<span class='won'>원</span>
								</span>
							</li>
							<li>
								<span class='tit'>보험 및 차량 옵션</span>
								<span class='price'>
									
									<span class='won'>원</span>
								</span>
							</li>
							<li class="total">
								<span class='tit'>금액</span>
								<span class='price'>
									
									<span class='won'>원</span>
								</span>
							</li>
						</ul>
					</div>
				</div>
				
				<div id="rightWrap">
					<div id="event">
						<h3>이벤트/할인</h3>
						<ul>
							<li>
								<input type="radio" name="discount" value="회원 할인">
								<label class='titList'>회원 할인</label>
							</li>
							<li>
								<input type="radio" name="discount" value="이벤트">
								<label class='discountList'>이벤트</label>
								<span id='selected'>
									<select id='selEvt' name='selEvt'>
										<option value="선택">선택</option>
										<option value="evt1">첫 가입</option>
										<option value="evt2">생일 축하</option>
									</select>
								</span>
							</li>
						</ul>
					</div>
					
					<div id="insurance">
						<h3>자차손해 면책 제도(CDW)</h3>
						<ul>
							<li>
								<input type="radio" name="rdIns">
								<label class='titList'>보험 미적용 (0원)</label>
							</li>
							<li>
								<input type="radio" name="rdIns">
								<label class='titList'>완전자차</label>
							</li>
						</ul>
					</div>
					
					<div id="option">
						<h3>차량 옵션</h3>
						<ul class='optChk'>
							<li>
								<input type="checkbox">
								<label class='titList'>카시트(Car Seat)</label>
							</li>
							<li>
								<input type="checkbox">
								<label class='titList'>블랙박스(Black Box)</label>
							</li>
							<li>
								<input type="checkbox">
								<label class='titList'>선루프(Sun Roof)</label>
							</li>
						</ul>
					</div>
				</div>
				
				<div id="btnWrap">
					<a href="#">이전</a>
					<a href="#">다음</a>
				</div>
				
				테스트
				<hr>
				
				고객코드 : ${list[0].code } <br>
				아이디 : ${list[0].id } <br>
				고객이름 : ${list[0].name } <br>
				우편번호 : ${list[0].zipCode } <br>
				주소 : ${list[0].address } <br>
				연락처 : ${list[0].phone } <br>
				이메일 : ${list[0].email } <br>
				등급코드 : ${list[0].gradeCode.code } <br>
				등급이름 : ${list[0].gradeCode.name } <br>
				등급할인율 : ${list[0].gradeCode.rate }% <br>
				운전면허 : ${list[0].license } <br>
				<c:forEach var="customer" items="${list }">
					이벤트 : <p>${customer }</p>
				</c:forEach>
				
			</div>
		</section>
		
				
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