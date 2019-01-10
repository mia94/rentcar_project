<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/css/common.css" rel="stylesheet"  type="text/css">
<style>
	#modify_wrap{
		width:1100px;
		margin: 0 auto;
	}
	label{
		width:150px;
		float:left;
		height: 50px;
		line-height: 50px;
		background-color: #4C4C4C;
		color:#F6F6F6;
		font-weight: bold;
		text-align: center;
	}
	.textfield{
		width:295px;
		height: 46px;
		line-height: 46px;
	}
	select{
		width:300px;
		height: 50px;
		line-height: 50px;
	}
	input[type=radio]{
		margin: 19px;
	}
	#charge {
		width:450px;
		height: 50px;
		line-height: 50px;
	}
	.charge{
		clear:both;
		width:82px;
		height: 50px;
		line-height: 50px;
	}
	tabel{
		border-collapse: collapse;
		width:450px;
	}
	td{
		border:1px solid gray;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(function(){
		//받아온 값으로 미리 선택되있도록 설정하기
		$("#brandSelect").val("${carmodel.brand.no}").prop("selected",true);
		$("#cartypeSelect").val("${carmodel.carType.code}").prop("selected",true);
		$("#fuelSelect").val("${carmodel.fuel.code}").prop("selected",true);
		$("#colorSelect").val("${carmodel.color}").prop("selected",true);
		$("input:radio[name=gear]").val("${carmodel.gear}").prop("selected",true);//제대로 작동하지 않음ㅠㅠ모두 수동에 체크됨
	})
</script>
</head>
<body>
<div id="container">
		<header>
			<jsp:include page="../header.jsp"></jsp:include>
		</header>
		
		<section>
		<h1>차량 수정</h1>
			<div id="modify_wrap">

				<form action="carmodify.do" method="post"><!--   enctype="multipart/form-data"  -->
					<p>
						<label>차량번호</label>
						<input type="text" name="car_code" class="textfield" value="${carmodel.carCode}" readonly>
					</p>
					<p>
						<label>모델명</label>
						<input type="text" name="name"  class="textfield" value="${carmodel.name}">
					</p>
					<p>
						<label>브랜드</label>
						<select name="brand" id="brandSelect">
							<option value="B1">현대</option>
							<option value="B2">기아</option>
							<option value="B3">BMW</option>
							<option value="B4">FORD</option>
						</select>
					</p>
					<p>
						<label>차종</label>
						<select name="cartype" id="cartypeSelect">
							<option value="S1">경형</option>
							<option value="S2">소형</option>
							<option value="S3">중형</option>
							<option value="S4">대형</option>
							<option value="S5">승합</option>
							<option value="S6">SUV</option>
						</select>
					</p>
					<p>
						<label>연료</label>
						<select name="fuel_code" id="fuelSelect">
							<option value="gasolin">가솔린</option>
							<option value="diesel">디젤</option>
							<option value="lpg">LPG</option>
							<option value="hybrid">하이브리드</option>
							<option value="electric">전기차</option>
						</select>
					</p>
					<p>
						<label>색상</label>
						<select name="color" id="colorSelect">
							<option value="wh">하양</option>
							<option value="bk">검정</option>
							<option value="bl">파랑</option>
							<option value="gr">회색</option>
							<option value="re">빨강</option>
							<option value="mt">민트</option>
						</select>
					</p>
					<p>
						<label>변속기</label>
						<input type="radio" name="gear" value="auto">자동
						<input type="radio" name="gear" value="stick">수동
					</p>
					<p>
						<label id="charge">요금표</label>
						<br><br><br>
						<table>
							<tr>
								<td><input type="text" name="basic_charge" class="charge" value="${carmodel.basicCharge }"></td>
								<td><input type="text" name="hour6" class="charge" value="${carmodel.hour6 }"></td>
								<td><input type="text" name="hour10" class="charge" value="${carmodel.hour10 }"></td>
								<td><input type="text" name="hour12" class="charge" value="${carmodel.hour12 }"></td>
								<td><input type="text" name="hour_else" class="charge" value="${carmodel.hourElse }"></td>
							</tr>
						</table>
					</p>
					<p>
						<label>렌트 중</label>
						<input type="radio" name="isRent" value="true">렌트 중
						<input type="radio" name="isRent" value="false">보유 중
					</p>
					<p>
						<label>렌트 회수</label>
						<input type="text" name="rentCnt"  class="textfield" value="${carmodel.rentCnt }">
					</p>
					
					<!-- isRent, rentCnt 0으로 자동입력되게 하기 -->
					<input type="submit" value="등록">
					<input type="reset" value="취소">
					
				</form>
			</div>
		</section>
	</div>
	
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
</html>