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
<link href="${pageContext.request.contextPath }/css/rentSearchDateList.css?c" rel="stylesheet"  type="text/css">
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
					<!-- search -->
					<form id="searchForm" method="post" action="${pageContext.request.contextPath }/rentSearchDate.do">
			        <table class="searchBox">
			            <tbody>
			                <tr>
			                    <th>조회기간</th>
			                    <td>
			                        <ul class="searchDate">
			                            <li>
			                                <span class="chkbox2">
			                                    <input type="radio" name="dateType" id="dateType1" onclick="setSearchDate('0d')"/>
			                                    <label for="dateType1">오늘</label>
			                                </span>
			                            </li>
			                            <li>
			                                <span class="chkbox2">
			                                    <input type="radio" name="dateType" id="dateType2" onclick="setSearchDate('3d')"/>
			                                    <label for="dateType2">3일</label>
			                                </span>
			                            </li>
			                            <li>
			                                <span class="chkbox2">
			                                    <input type="radio" name="dateType" id="dateType3" onclick="setSearchDate('1w')"/>
			                                    <label for="dateType3">1주</label>
			                                </span>
			                            </li>
			                            <li>
			                                <span class="chkbox2">
			                                    <input type="radio" name="dateType" id="dateType4" onclick="setSearchDate('2w')"/>
			                                    <label for="dateType4">2주</label>
			                                </span>
			                            </li>
			                            <li>
			                                <span class="chkbox2">
			                                    <input type="radio" name="dateType" id="dateType5" onclick="setSearchDate('1m')"/>
			                                    <label for="dateType5">1개월</label>
			                                </span>
			                            </li>
			                            <li>
			                                <span class="chkbox2">
			                                    <input type="radio" name="dateType" id="dateType6" onclick="setSearchDate('3m')"/>
			                                    <label for="dateType6">3개월</label>
			                                </span>
			                            </li>
			                            <li>
			                                <span class="chkbox2">
			                                    <input type="radio" name="dateType" id="dateType7" onclick="setSearchDate('6m')"/>
			                                    <label for="dateType7">6개월</label>
			                                </span>
			                            </li>
			                        </ul>
			                        
			                        <div class="clearfix">
			                            <!-- 시작일 -->
			                            <span class="dset">
			                                <input type="text" class="datepicker inpType" name="searchStartDate" id="searchStartDate" >
			                                <a href="#none" class="btncalendar dateclick">달력</a>
			                            </span>
			                            <span class="demi">~</span>
			                            <!-- 종료일 -->
			                            <span class="dset">
			                                <input type="text" class="datepicker inpType" name="searchEndDate" id="searchEndDate" >
			                                <a href="#none" class="btncalendar dateclick">달력</a>
			                            </span>
			                            <div id="btnSearchWrap">
			                            	<button id="btnSearch">조회</button>
			                            </div>
			                        </div>    
			                    </td>
			                </tr>
			            <tbody>
			        </table>
			        </form>
				</div>
				<!-- 끝 -->
				
					<!-- 리스트 -->
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
	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
	<script src="${pageContext.request.contextPath }/js/rentSearchDateList.js?a"></script>

</body>
</html>