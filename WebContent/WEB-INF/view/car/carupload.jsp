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
		width:1000px;
		height:500px;
		margin: 70px auto;
		position: relative;
	}
	#upload_wrap > h1{
		text-align: right;
	}
	#img_wrap{
		width:500px;
		height: 370px; 
		float: left;
		position: relative;
	}
	#img_wrap label{
		width:500px;
		background-color: white;
		color:#4C4C4C;
		border-bottom: 3px solid #4C4C4C;
	}
	#img_wrap img{
		width:330px;
		position: absolute;
		top:80px;
		left: 90px;
	}
	#img_wrap input{
		position: absolute;
		bottom: 20px;
		left: 170px;
	}
	#wrap_1, #wrap_2{
		width:250px;
	}
	#wrap_1{
		position: absolute;
		top:32px;
		left: 520px;
	}
	#wrap_2{
		position: absolute;
		top:32px;
		left: 780px;
	}
	label{
		width:126px;
		float:left;
		height: 50px;
		line-height: 50px;
		background-color: #4C4C4C;
		color:#F6F6F6;
		font-weight: bold;
		text-align: center;
		font-size: 14px;
	}
	.textfield{
		width:120px;
		height: 46px;
		line-height: 46px;
	}
	select{
		width:124px;
		height: 50px;
		line-height: 50px;
	}
	input[type=radio]{
		margin-left: 10px;
		margin-top: 19px;
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
	#btn_wrap{
		position: absolute;
		bottom: 100px;
		right: 120px;
	}
	#btn_wrap input{
		width:100px;
		height:30px;
		line-height:30px;
		border: 2px solid #aaaaaa;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(function(){
		 $("#imgInp").on('change', function(){
             readURL(this);
         });
	})
	
	function readURL(input) {
            if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                    $('#preview').attr('src', e.target.result);
                }
              reader.readAsDataURL(input.files[0]);
            }
        }
</script>
</head>
<body>
	<div id="container">
		<header>
			<jsp:include page="../header.jsp"></jsp:include>
		</header>
		
		<section>
		
			<div id="upload_wrap">
			<h1>차량 추가</h1>
				<form action="uploadcar.do" enctype="multipart/form-data" method="post"><!--   enctype="multipart/form-data"  -->
					<div id="img_wrap">
						<label>PHOTH</label>
						<img id="preview" src="${pageContext.request.contextPath }/upload/V000.png" alt="car_img">
						<input type="file" name="carImg" id="imgInp">
					</div>
					<div id="wrap_1">
						<p>
							<label>차량번호</label>
							<input type="text" name="car_code" class="textfield" value="${nextCode }" readonly>
						</p>
						<p>
							<label>모델명</label>
							<input type="text" name="name"  class="textfield">
						</p>
						<p>
							<label>브랜드</label>
							<select name="brand">
								<c:forEach var="item" items="${brandList }">
									<option value="${item.no }">${item.name }</option>
								</c:forEach>
							</select>
						</p>
						<p>
							<label>차종</label>
							<select name="cartype">
								<c:forEach var="item" items="${typeList }">
									<option value="${item.code }">${item.type }</option>
								</c:forEach>
							</select>
						</p>
						<p>
							<label>연료</label>
							<select name="fuel_code">
								<c:forEach var="item" items="${fuelList }">
									<option value="${item.code }">${item.code }</option>
								</c:forEach>
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
					</div>
					<div id="wrap_2">
					<p>
						<label>기본요금</label>
						<input type="text" name="basic_charge"  class="textfield">
					</p>
					<p>
						<label>6시간 이하</label>
						<input type="text" name="hour6"  class="textfield">
					</p>
					<p>
						<label>10시간 이하</label>
						<input type="text" name="hour6"  class="textfield">
					</p>
					<p>
						<label>12시간 이하</label>
						<input type="text" name="hour12"  class="textfield">
					</p>
					<p>
						<label>12시간 초과</label>
						<input type="text" name="hour_else"  class="textfield">
					</p>
					<p>
						<label>변속기</label>
						<input type="radio" name="gear">자동
						<input type="radio" name="gear">수동
					</p>
					</div>
					
					<!-- isRent, rentCnt 0으로 자동입력되게 하기 --> 
					<div id="btn_wrap">
						<input type="submit" value="등록">
						<input type="reset" value="취소">
					</div>
				</form>
			</div>
		</section>
	</div>
	
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
</html>