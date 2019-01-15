<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="${pageContext.request.contextPath }/css/common.css?abc" rel="stylesheet"  type="text/css">
<link href="${pageContext.request.contextPath }/css/rentStepThree.css?accb" rel="stylesheet"  type="text/css">
</head>
	<div id="container">
		<!-- header -->
	    <header>
			<jsp:include page="../guest.jsp"></jsp:include>
		</header>
		
		<!-- section -->
		<section>
			<div id="rentStepThree_container">
				<div id="leftWrap">
					<!-- 대여/반납일 정보 -->
					<div id="dateInfo">
						<span id="rentDate">${sDate } &nbsp;${sHour } ${sMin }</span>
						<span id="and">&nbsp;▶&nbsp;</span>
						<span id="returnDate">${eDate } &nbsp;${eHour } ${eMin }</span>
					</div>
					
					<!-- 차량 정보 -->
					<div id="carInfo">
						<h3>${cName }</h3>
						<div id="carImg">
							<img src="${pageContext.request.contextPath }/upload/${cCode }.png" class='carImg'>	
						</div>
						<p class="notice">
							※ 실제 대여하는 차량과 외관, 색상, 옵션 등에서 차이가 있을 수 있습니다.
						</p>
					</div>
					
					<!-- 가격 정보 -->
					<div id="priceInfo">
						<ul>
							<li>
								<span class='tit'>·&nbsp;대여금액</span>
								<div class="resPrice">
									<span class='price'>
										<fmt:formatNumber value="${basicPrice }" type="number"></fmt:formatNumber>
									</span>
									<span class='won'>원</span>
								</div>
							</li>
							<li>
								<span class='tit'>·&nbsp;할인금액</span>
								<div class="resPrice">
									<span id='discountPrice'>${dPrice }</span>
									<span class='won'>원</span>
								</div>
							</li>
							<li>
								<span class='tit'>·&nbsp;보험</span>
								<div class="resPrice">
									<span id='insurancePrice'>${iPrice }</span>
									<span class='won'>원</span>
								</div>
							</li>
							<li>
								<span class='tit'>·&nbsp;차량 옵션</span>
								<div class="resPrice">
									<span id='optionPrice'>${carOptPrice }</span>
									<span class='won'>원</span>
								</div>
							</li>
							<li>
								<div id="temp">
									<span id='totalTit'>금액</span>
									<div id="tResult">
										<span id='totalPrice'>${totalRentPrice }</span>
										<span id='totalWon'>원</span>
									</div>
								</div>
							</li>
						</ul>
					</div>
	
				</div>
				
				<div id="rightWrap">
					<div id="customerInfo">
						<h3>개인 정보</h3>
						<ul>
							<li>
								<span class='infoTit'>·&nbsp;고객등급</span>
								<input type="text" readonly="readonly" value="${list[0].gradeCode.name }" disabled="disabled" title="고객등급">
							</li>
							<li>
								<span class='infoTit'>·&nbsp;면허 종류</span>
								<input type="text" value="${list[0].license }" title="운전면허" readonly="readonly" disabled="disabled">
							</li>
							<li>
								<span class='infoTit'>·&nbsp;이름</span>
								<input type="text" readonly="readonly" value="${list[0].name }" disabled="disabled" title="이름">
							</li>
							<li>
								<span class='infoTit'>·&nbsp;연락처</span>
								<input type="text" title="휴대폰 첫번째 자리" maxlength="3" name="phoneFirst" id="phoneFirst" value="${fn:substring(list[0].phone, 0, 3) }">
								<span class='hyphen'>-</span>
								<input type="text" title="휴대폰 두번째 자리" maxlength="4" name="phoneSecond" id="phoneSecond" value="${fn:substring(list[0].phone, 4, 8) }" >
								<span class='hyphen'>-</span>
								<input type="text" title="휴대폰 마지막 자리" maxlength="4" name="phoneThird" id="phoneThird" value="${fn:substring(list[0].phone, 9, 13) }">
							</li>
							<li>
								<span class='infoTit'>·&nbsp;이메일</span>
								<input type="text" value="${list[0].email }" title="이메일" placeholder="이메일을 입력하세요.">
							</li>
						</ul>
					</div>
					
					<!-- 이용 약관 -->
					<div id="tosWrap">
						<h3>이용약관</h3>
						<div id="tosChk">
							<input type="checkbox" value="agree" id="agree">
							<label>이용약관에 동의합니다. (필수)</label>
						</div>
						<div id="tos">
							<b>제1조(개인정보의 처리목적)</b><br> 
							<div id="tosContent1">   
								회사는 다음의 목적을 위하여 개인정보를 처리합니다. 
								처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며, 
								이용 목적이 변경되는 경우에는 개인정보 보호법 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다. 
							</div><br>   
							<b>제2조(개인정보의 처리 및 보유기간)</b><br>
							<div id="tosContent2">
								회사는 법령에 따른 개인정보 보유․이용기간 또는 정보주체로부터 개인정보를 수집시에 동의받은 
								개인정보 보유․이용기간 내에서 개인정보를 처리․보유합니다.
							</div><br>
							<b>제3조(개인정보의 제3자 제공)</b><br>
							<div id="tosContent3">
								회사는 정보주체의 개인정보를 제1조(개인정보의 처리 목적)에서 명시한 범위 내에서만 처리하며, 
								정보주체의 동의, 법률의 특별한 규정 등 개인정보 보호법 제17조에 해당하는 경우에만
								 개인정보를 제3자에게 제공합니다.
							</div>
						</div>
					</div>
				</div>
				
				<!-- 버튼 -->
				<div id="btnWrap">
					<button type="button" id="btnBook">예약</button>
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
	<script src="${pageContext.request.contextPath }/js/rentStep.js?b"></script>
</html>