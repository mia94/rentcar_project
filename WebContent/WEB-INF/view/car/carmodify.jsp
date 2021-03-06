<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/css/common.css" rel="stylesheet"  type="text/css">
<link href="${pageContext.request.contextPath }/css/common_orig.css" rel="stylesheet"  type="text/css">
<style>
	#modify_wrap{
		width:1000px;
		height:500px;
		margin: 70px auto;
		position: relative;
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
	.radio_wrap{
		width:122px;
		margin-left:126px;
		height:48px;
		border:1px solid #aaaaaa;
		position: relative;
	}
	.radio{
		width:50px;
		display: inline-block;
	}
	.radio_wrap div:FIRST-CHILD{
		margin-left: 10px;
		margin-top: 10px; 
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
		bottom: 60px;
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
		//받아온 값으로 미리 선택되있도록 설정하기
		$("#brandSelect").val("${carmodel.brand.no}").prop("selected",true);
		$("#cartypeSelect").val("${carmodel.carType.code}").prop("selected",true);
		$("#fuelSelect").val("${carmodel.fuel.code}").prop("selected",true);
		$("#colorSelect").val("${carmodel.color}").prop("selected",true);
		$("input:radio[name=gear]").val("${carmodel.gear}").attr("checked",true);
		$("input:radio[name=isRent]").val("${carmodel.rent}").attr("checked",true);

	})
	
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
			<jsp:include page="../admin.jsp"></jsp:include>
		</header>
		
		<section>
		
			<div id="modify_wrap">
			<h1>차량 수정</h1>
				<form action="carmodify.do" enctype="multipart/form-data" method="post"><!--   enctype="multipart/form-data"  -->
					<div id="img_wrap">
						<label>PHOTH</label>
						<img id="preview" src="${pageContext.request.contextPath }/upload/${carmodel.carCode}.png" alt="car_img">
						<input type="file" name="carImg" id="imgInp">
					</div>
					<div id="wrap_1">
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
								<c:forEach var="item" items="${brandList }">
									<option value="${item.no }">${item.name }</option>
								</c:forEach>
							</select>
						</p>
						<p>
							<label>차종</label>
							<select name="cartype" id="cartypeSelect">
								<c:forEach var="item" items="${typeList }">
									<option value="${item.code }">${item.type }</option>
								</c:forEach>
							</select>
						</p>
						<p>
							<label>연료</label>
							<select name="fuel_code" id="fuelSelect">
								<c:forEach var="item" items="${fuelList }">
									<option value="${item.code }">${item.code }</option>
								</c:forEach>
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
							<label>렌트 회수</label>
							<input type="text" name="rentCnt"  class="textfield" value="${carmodel.rentCnt }">
						</p>
					</div>
					<div id="wrap_2">
						<p>
							<label>기본요금</label>
							<input type="text" name="basic_charge" class="textfield" class="charge" value="${carmodel.basicCharge }">
						</p>
						<p>
							<label>6시간 이하</label>
							<input type="text" name="hour6" class="textfield" class="charge" value="${carmodel.hour6 }">
						</p>
						<p>
							<label>10시간 이하</label>
							<input type="text" name="hour10" class="textfield" class="charge" value="${carmodel.hour10 }">
						</p>
						<p>
							<label>12시간 이하</label>
							<input type="text" name="hour12" class="textfield" class="charge" value="${carmodel.hour12 }">
						</p>
						<p>
							<label>12시간 초과</label>
							<input type="text" name="hour_else" class="textfield" class="charge" value="${carmodel.hourElse }">
						</p>
						<p>
							<label>변속기</label>
							<div class="radio_wrap">
								<div class="radio"><input type="radio" name="gear" value="auto"><span>자동</span></div>
								<div class="radio"><input type="radio" name="gear" value="stick"><span>수동</span></div>
							</div>
						</p>
						<p>
							<label>렌트 중</label>
							<div class="radio_wrap">
								<div class="radio"><input type="radio" name="isRent" value="true"> <span>Y</span></div>
								<div class="radio"><input type="radio" name="isRent" value="false"> <span>N</span></div>
							</div>
						</p>
						
					</div>
					
					<div id="btn_wrap">
						<input type="submit" value="수정">
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