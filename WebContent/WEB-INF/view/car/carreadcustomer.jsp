<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/css/carread.css" rel="stylesheet"  type="text/css">
<style>
	#next_wrap{ 
		clear: both;
		position:absolute;
		left:330px;
		bottom:30px;
		text-align: center;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(function(){
		var color = $("#color").text().trim();
		switch(color){
			case 'wh': $("#color").html('WHITE');
			break;
			case 'bk': $("#color").html('BLACK');
			break;
			case 'bl': $("#color").html('BLUE');
			break;
			case 'gr': $("#color").html('GRAY');
			break;
			case 'mt': $("#color").html('MINT');
			break;
			case 're': $("#color").html('RED');
			break;
		}
	})
</script>
</head>
<body>
	<div id="container">
		<header>
			<jsp:include page="../header.jsp"></jsp:include>
		</header>
		
		<section>
			<h1>차량 종합 정보</h1>
			<div id="read_wrap">
				<h1> ${carmodel.name} </h1>
				<img src="${pageContext.request.contextPath }/upload/${carmodel.carCode  }.png">
				<div id="info_wrap">
					<table>
						<tr>
							<td colspan="4" id="title">차량 정보</td>
						</tr>
						<tr>
							<td>차종</td>
							<td>${carmodel.carType.type }</td>
							<td>브랜드</td>
							<td>${carmodel.brand.name }</td>
						</tr>
						<tr>
							<td>색상</td>
							<td id="color"> ${carmodel.color }</td>
							<td>변속기</td>
							<td>${carmodel.gear }</td>
						</tr>
						<tr>
							<td colspan="4" id="title_charge">요금표</td>
						</tr>
						<tr>
							<td colspan="3">기본요금</td>
							<td class="charge">${carmodel.basicCharge }</td>
						</tr>
						<tr>
							<td colspan="3">6시간 이하 연체요금</td>
							<td class="charge">${carmodel.hour6 }</td>
						</tr>
						<tr>
							<td colspan="3">10시간 이하 연체요금</td>
							<td class="charge">${carmodel.hour10 }</td>
						</tr>
						<tr>
							<td colspan="3">12시간 이하 연체요금</td>
							<td class="charge">${carmodel.hour12 }</td>
						</tr>
						<tr>
							<td colspan="3">12시간 초과 연체요금</td>
							<td class="charge">${carmodel.hourElse }</td>
						</tr>
					</table>
				</div>
				<div id="next_wrap">
					<a href="carbefore.do?carCode=${carmodel.carCode }">BACK</a><!-- 이전차량 보이기 -->
					<a href="carafter.do?carCode=${carmodel.carCode }">NEXT</a><!-- 이후차량 보이기 -->
				</div>
			</div>
		</section>
	</div>
	
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
</html>