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
	#upload_wrap{
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
</head>
<body>
	<div id="container">
		<header>
			<jsp:include page="../header.jsp"></jsp:include>
		</header>
		
		<section>
		<h1>차량 추가</h1>
			<div id="upload_wrap">
				<form action="uploadcar.do" method="post">
					<p>
						<label>차량번호</label>
						<input type="text" name="car_code" class="textfield">
					</p>
					<p>
						<label>모델명</label>
						<input type="text" name="name"  class="textfield">
					</p>
					<p>
						<label>브랜드</label>
						<select name="brand">
							<option value="B1">현대</option>
							<option value="B2">기아</option>
							<option value="B3">BMW</option>
							<option value="B4">FORD</option>
						</select>
					</p>
					<p>
						<label>차종</label>
						<select name="cartype">
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
						<select name="fuel_code">
							<option value="gasolin">가솔린</option>
							<option value="diesel">디젤</option>
							<option value="lpg">LPG</option>
							<option value="hybrid">하이브리드</option>
							<option value="electric">전기차</option>
						</select>
					</p>
					<p>
						<label>색상</label>
						<select name="color">
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
						<input type="radio" name="gear">자동
						<input type="radio" name="gear">수동
					</p>
					<p>
						<label id="charge">요금표</label>
						<br><br><br>
						<!-- <input type="text" name="basic_charge" class="charge">
						<input type="text" name="hour6" class="charge">
						<input type="text" name="hour10" class="charge">
						<input type="text" name="hour12" class="charge">
						<input type="text" name="hour_else" class="charge"> -->
						<table>
							<tr>
								<td><input type="text" name="basic_charge" class="charge"></td>
								<td><input type="text" name="hour6" class="charge"></td>
								<td><input type="text" name="hour10" class="charge"></td>
								<td><input type="text" name="hour12" class="charge"></td>
								<td><input type="text" name="hour_else" class="charge"></td>
							</tr>
						</table>
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