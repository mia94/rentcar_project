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
<link href="${pageContext.request.contextPath }/css/rentChkList.css?absss" rel="stylesheet"  type="text/css">
<link href="${pageContext.request.contextPath }/css/rentSearchDateList.css?bcd" rel="stylesheet"  type="text/css">
</head>
<body>
	<div id="container">
		<!-- header -->
	    <header>
			<jsp:include page="../guest.jsp"></jsp:include>
		</header>
		
		<!-- section -->
		<section>
			<div id="rentChkList_container">
				<div id="tit">
					<span id="cstmName">${AUTH.name }</span>님의 대여내역 입니다.
				</div>
				
				<div id="search">
					날짜 검색하는 곳!
					<form>
						<table class="searchBox">
							<tr>
								<th>조회기간</th>
								<td>
									<ul class="searchDate">
										<li>
											<span class='chkBox'>
												<input type="radio" name="dateType" id="dateType1">
												<label for="dateType1">당일</label>
											</span>
										</li>
										
										<li>
											<span class='chkBox'>
												<input type="radio" name="dateType" id="dateType2">
												<label for="dateType2">3일</label>
											</span>
										</li>
										
										<li>
											<span class='chkBox'>
												<input type="radio" name="dateType" id="dateType3">
												<label for="dateType3">1주</label>
											</span>
										</li>
										
										<li>
											<span class='chkBox'>
												<input type="radio" name="dateType" id="dateType4">
												<label for="dateType4">2주</label>
											</span>
										</li>
										
										<li>
											<span class='chkBox'>
												<input type="radio" name="dateType" id="dateType5">
												<label for="dateType5">1개월</label>
											</span>
										</li>
										
										<li>
											<span class='chkBox'>
												<input type="radio" name="dateType" id="dateType6">
												<label for="dateType6">3개월</label>
											</span>
										</li>
									</ul>
									
									<!-- 날짜 직접 선택하여 검색 -->
									<div class='dateChoose'>
										<!-- 시작일 -->
										<span class="dset">
											<input type="text" class="datePicker" name="searchStartDate" id="searchStartDate">
											<a href="#" class='btncalendar dateclick'>달력</a>
										</span>
										<span class='demi'>~</span>
										<!-- 종료일 -->
										<span class="dset">
											<input type="text" class="datePicker" name="searchEndDate" id="searchEndDate">
											<a href="#" class='btncalendar dateclick'>달력</a>
										</span>
									</div>
								</td>
							</tr>
						</table>
					</form>
				</div>
					<table>
						<tr>
							<td>대여코드</td>
							<td>대여일자</td>
							<td>반납일자</td>
							<td>브랜드</td>
							<td>차종</td>
							<td>차량명</td>
						</tr>
						<c:forEach var="rent" items="${list }">
							<tr>
								<td><a href="rentChkListRead.do?code=${rent.code }&name=${rent.car_code.name }">${rent.code }</a></td>
								<td>${rent.start_date }</td>
								<td>${rent.end_date }</td>
								<td><img src="${pageContext.request.contextPath }/upload/${rent.car_code.brand }.png"></td>
								<td>${rent.car_code.carType.type }</td>
								<td>${rent.car_code.name }</td>
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
</body>
</html>