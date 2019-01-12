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
	#btn_wrap, #next_wrap{
		clear: both;
		text-align: center;
	}
	#btn_wrap{ 	
		position:absolute;
		left:320px;
		bottom:60px;
	}
	#next_wrap{
		position:absolute;
		left:340px;
		bottom:30px;
	}
	#btn_wrap a, #next_wrap a{
		margin: 5px;
	}
	#btn_wrap a{
		background-color: #eeeeee;
		border:2px solid gray;
		padding: 5px;
		width:25px;
		text-decoration: none;
	}
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(function(){
		$("#delBtn").click(function(){
			var del = confirm("정말 삭제하시겠습니까?");
			if(del==true){
				location.href="${pageContext.request.contextPath }/cardelete.do?carCode=${carmodel.carCode }";
			}
			return false;
		})
	})
</script>
</head>
<body>
	<div id="container">
		<header>
			<jsp:include page="../header.jsp"></jsp:include>
		</header>
		
		<section>
			<h1>차량관리</h1>
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
							<td> ${carmodel.color }</td>
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
				<div id="btn_wrap">
					<a href="carmodify.do?carCode=${carmodel.carCode }">수정</a>
					<a href="cardelete.do?carCode=${carmodel.carCode }" id="delBtn">삭제</a>
					<a href="carlist.do">목록</a>
				</div>
				<div id="next_wrap">
					<a href="carbeforeforemp.do?carCode=${carmodel.carCode }">BACK</a><!-- 이전차량 보이기 -->
					<a href="carafterforemp.do?carCode=${carmodel.carCode }">NEXT</a><!-- 이후차량 보이기 -->
				</div>
			</div>
		</section>
	</div>
	
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
</html>