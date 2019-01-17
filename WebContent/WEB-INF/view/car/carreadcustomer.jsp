<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/css/common.css?x" rel="stylesheet"  type="text/css">
<link href="${pageContext.request.contextPath }/css/common_min.css?x" rel="stylesheet"  type="text/css">
<link href="${pageContext.request.contextPath }/css/carread.css?x" rel="stylesheet"  type="text/css">
<style>
@media all and (min-width:768px){
	#next_wrap{ 
		clear: both;
		position:absolute;
		left:330px;
		bottom:30px;
		text-align: center;
	}
	#btn_wrap{
		clear: both;
		text-align: center;
		position:absolute;
		left:320px;
		bottom:10px;
	}
	#btn_wrap a{
		border:2px solid #aaaaaa;
		color:gray;
		border-radius:5px;
		padding: 5px;
		text-decoration: none;
		margin: 5px;
	}
	#btn_wrap a:hover{
		color:white;
		background-color: #747474;
	}
}
@media all and (max-width:767px){
	#next_wrap{ 
		clear: both;
		position:absolute;
		left:330px;
		bottom:30px;
		text-align: center;
	}
	#btn_wrap{
		clear: both;
		text-align: center;
		position:absolute;
		left:27%;
		bottom:50px;
	}
	#btn_wrap a{
		border:2px solid #aaaaaa;
		color:gray;
		border-radius:5px;
		padding: 5px;
		text-decoration: none;
		margin: 5px;
	}
	#btn_wrap a:hover{
		color:white;
		background-color: #747474;
	}
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
		
		var gear = $("#gear").text().trim();
		if(gear=='true'){
			$("#gear").html("수동");
		}else{
			$("#gear").html("자동");
		}
	})
</script>
</head>
<body>
	<div id="container">
		<header>
			<jsp:include page="../guest.jsp"></jsp:include>
		</header>
		
		<section>
			<h1>차량 종합 정보</h1>
			<div id="read_wrap">
				<h1> ${carmodel.name} </h1>
				<img src="${pageContext.request.contextPath }/upload/${carmodel.carCode  }.png">
				<div id="info_wrap">
					<table>
						<tr>
							<td colspan="4"><p id="title">차량 정보</p></td>
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
							<td id="gear">${carmodel.gear }</td>
						</tr>
						<!-- <tr>
							<td colspan="4" id="title_charge">요금표</td>
						</tr> -->
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
							<td colspan="3" class="last_tr">12시간 초과 연체요금</td>
							<td class="charge" class="last_tr">${carmodel.hourElse }</td>
						</tr>
						<tr>
							<td colspan="3" id="last_td">기본요금</td>
							<td class="charge" id="last">${carmodel.basicCharge }</td>
						</tr>
					</table>
				</div>
				<div id="btn_wrap">
					<a href="carlistcustomer.do">목록</a>
				</div>
					<a href="carbefore.do?carCode=${carmodel.carCode }" id="back">
						<img src="${pageContext.request.contextPath }/upload/back.png" alt="back">
					</a>
					<a href="carafter.do?carCode=${carmodel.carCode }" id="next">
						<img src="${pageContext.request.contextPath }/upload/next.png" alt="next">
					</a>
			</div>
		</section>
	</div>
	
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
</html>