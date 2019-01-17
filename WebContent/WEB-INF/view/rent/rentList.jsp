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
<link href="${pageContext.request.contextPath }/css/rentList.css?bbs" rel="stylesheet"  type="text/css">
</head>
<body>
	<div id="container">
		<!-- header -->
	    <header>
			<jsp:include page="../admin.jsp"></jsp:include>
		</header>
		
		<!-- section -->
		<section>
			<div id="rentList_container">
			
			<div id="search1">
					<!-- search -->
					<form id="searchForm1" method="post" action="${pageContext.request.contextPath }">
			        <table class="searchBox1">
			            <tbody>
			                <tr>
			                    <th>대여내역 조회</th>
			                    <td>
			                        <ul class="searchDate1">
			                            <li>
			                                <span class="chkbox1">
			                                    <input type="radio" name="dateType1" id="dateType01" onclick="setSearchDate('0d')"/>
			                                    <label for="dateType01">당일</label>
			                                </span>
			                            </li>
			                            <li>
			                                <span class="chkbox1">
			                                    <input type="radio" name="dateType1" id="dateType02" onclick="setSearchDate('3d')"/>
			                                    <label for="dateType02">3일</label>
			                                </span>
			                            </li>
			                            <li>
			                                <span class="chkbox1">
			                                    <input type="radio" name="dateType1" id="dateType03" onclick="setSearchDate('1w')"/>
			                                    <label for="dateType03">1주</label>
			                                </span>
			                            </li>
			                            <li>
			                                <span class="chkbox1">
			                                    <input type="radio" name="dateType1" id="dateType04" onclick="setSearchDate('2w')"/>
			                                    <label for="dateType04">2주</label>
			                                </span>
			                            </li>
			                            <li>
			                                <span class="chkbox1">
			                                    <input type="radio" name="dateType1" id="dateType05" onclick="setSearchDate('1m')"/>
			                                    <label for="dateType05">1개월</label>
			                                </span>
			                            </li>
			                            <li>
			                                <span class="chkbox1">
			                                    <input type="radio" name="dateType1" id="dateType06" onclick="setSearchDate('3m')"/>
			                                    <label for="dateType06">3개월</label>
			                                </span>
			                            </li>
			                            <li>
			                                <span class="chkbox1">
			                                    <input type="radio" name="dateType1" id="dateType07" onclick="setSearchDate('6m')"/>
			                                    <label for="dateType07">6개월</label>
			                                </span>
			                            </li>
			                        </ul>
			                        
			                        <div class="clearfix1">
			                            <!-- 시작일 -->
			                            <span class="dset1">
			                                <input type="text" class="datepicker inpType1" name="searchStartDate1" id="searchStartDate1" >
			                                <a href="#none" class="btncalendar dateclick1"><img src='images/btn_calendar.gif' class='imgCal1'></a>
			                            </span>
			                            <span class="demi1">~</span>
			                            <!-- 종료일 -->
			                            <span class="dset1">
			                                <input type="text" class="datepicker inpType1" name="searchEndDate1" id="searchEndDate1" >
			                                <a href="#none" class="btncalendar dateclick1"><img src='images/btn_calendar.gif' class='imgCal1'></a>
			                            </span>
			                            <div id="btnSearchWrap1">
			                            	<button type="button" id="btnSearch1">조회</button>
			                            	<button type="button" id="btnReset1">초기화</button>
			                            </div>
			                        </div>    
			                    </td>
			                </tr>
			            <tbody>
			        </table>
			        </form>
				</div>
			
			<!-- 반납여부 -->
			<div id="isReturnWrap">
				<div id="isReturnYes"><a href="#" class='isReturnATag'>반납된 차량 보기</a></div>
				<div id="isReturnNo"><a href="#" class='isReturnATag'>반납되지 않은 차량 보기</a></div>
			</div>
			
			<!-- 리스트 -->
			<table>
				<tr>
					<td>대여코드</td>
					<td>고객코드</td>
					<td>대여일자</td>
					<td>반납일자</td>
					<td>반납여부</td>
				</tr>
				
				<c:forEach var="rent" items="${list }">
					<tr>
						<td><a href="#">${rent.code }</a></td>
						<td>${rent.customer_code.code }</td>
						<td>${rent.start_date }</td>
						<td>${rent.end_date }</td>
						<c:choose>
							<c:when test="${rent.is_return == false}">
								<td id="false">
									${rent.is_return eq false ? "N" : "Y"}
								</td>
							</c:when>
							<c:otherwise>
								<td id="true">
									${rent.is_return eq true ? "Y" : "N"}
								</td>
							</c:otherwise>
						</c:choose>
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
	<script src="${pageContext.request.contextPath }/js/rentSearchDateList.js?asdsdd"></script>
	<script>
		var pathContext = '${pageContext.request.contextPath }';
	</script>
	<script src="${pageContext.request.contextPath }/js/rentManageSearchDateList.js?a"></script>
</body>
</html>