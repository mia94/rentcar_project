<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/css/common.css?b" rel="stylesheet"  type="text/css">
<style>
	#list_wrap{
		width:1100px;
		margin: 30px auto;
		overflow:hidden;
	}
	#list_wrap h1{
		border-bottom: 1px solid black; 
	}
	#list_wrap > a{
		text-decoration: none;
		color:gray;
	}
	#list_wrap ul{
		height: 60px;
		list-style: none;
	}
	#list_wrap ul li{
		float:left;
		border:0.5px solid white;	
		text-align: center;
	}
	#list_wrap ul li a{
		text-decoration: none;
		float:left;
		width:154px; 
		height: 70px;
		color:white;
		background-color: #4C4C4C;
		position: relative;
	}
	#list_wrap ul li a:hover{
		background-color: #6799FF;
	}
	#list_wrap ul li #total{
		line-height: 65px;
	}
	#list_wrap ul li a img{
		position: absolute;
		top: 13px;
		left: 45px;
		width:60px;
	}
	#list_wrap ul li a span{
		position: absolute;
		bottom: 5px;
		left: 65px;
		font-size: 12px;
	}
	#btn_wrap{
		width:1050px;
		height:40px;
		display: block;
		margin: 5px;
		text-align: right;
	}
	#btn_wrap a{
		padding: 10px;
		line-height:40px;
		text-decoration: none;
		font-size: 14px;
		color:#4C4C4C;
		font-weight: bold;
	}
	#btn_wrap a:hover{
		color:#6799FF;
		font-weight: bold;
	}
	article{
		width:520px;
		padding:10px;
		height:170px;
		border:0.5px solid #EAEAEA;
		float: left;
		position: relative;
	}
	article:hover{
		background-color:#F6F6F6; 
	}
	article h3{
		color:gray;
	}
	article .car_img{
		width:200px;
		height: 120px;
		margin-left: 40px; 
	}
	article .fuel_img{
		width:35px;
		position: absolute;
		left: 270px;
		bottom: 55px;
	}
	article .brand_img{
		width:50px;
		position: absolute;
		left: 260px;
		top: 30px;
	}
	article .info_wrap{
		position:absolute;
		right:10px;
		top:10px;
		width:180px;
	}
	article .info_wrap h3{
		color:black;
	}
	article .info_wrap p{
		color:gray;
		font-size: 12px;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(function(){
	<c:forEach var="item" items="${list}" varStatus="status">
		var isRent = $(".info_wrap .isRent").eq(${status.index}).text().trim();
		if(isRent=="true"){
			$(".info_wrap .isRent").eq(${status.index}).html("렌트 중");
			$(".info_wrap").eq(${status.index}).parent("article").css("background-color","#FFEFEF");
			$(".info_wrap .isRent").eq(${status.index}).css("color","#AA1212");
		}else{
			$(".info_wrap .isRent").eq(${status.index}).html("");
		}
	</c:forEach>
	
})
</script>
</head>
<body>
	<div id="container">
		<header>
			<jsp:include page="../admin.jsp"></jsp:include>
		</header>
		
		<section>
			<div id="list_wrap">
			<h1>차량 목록</h1>
				<div id="btn_wrap">
					<a href="uploadcar.do">자동차 추가</a>
				</div>
				<ul>
					<li><a href="carlist.do" id="total">전체</a></li>
					<li>
						<a href="select.do?cartype=S1">
							<img src="${pageContext.request.contextPath }/images/경형w.png">
							<span>경형</span>
						</a>
					</li>
					<li>
						<a href="select.do?cartype=S2">
							<img src="${pageContext.request.contextPath }/images/소형w.png">
							<span>소형</span>
						</a>
					</li>
					<li>
						<a href="select.do?cartype=S3">
							<img src="${pageContext.request.contextPath }/images/중형w.png">
							<span>중형</span>
						</a>
					</li>
					<li>
						<a href="select.do?cartype=S4">
							<img src="${pageContext.request.contextPath }/images/대형w.png">
							<span>대형</span>
						</a>
					</li>
					<li>
						<a href="select.do?cartype=S5">
							<img src="${pageContext.request.contextPath }/images/승합w.png">
							<span>승합</span>
						</a>
					</li>
					<li>
						<a href="select.do?cartype=S6">
							<img src="${pageContext.request.contextPath }/images/suvw.png">
							<span>suv</span>
						</a>
					</li>
				</ul>
				<c:forEach var="item" items="${list }">
				<a href="carread.do?carCode=${item.carCode }">
					<article data-index='i'>
					<h3>${item.name }</h3>
						<img src="${pageContext.request.contextPath }/upload/${item.carCode  }.png" class="car_img">
						<img src="${pageContext.request.contextPath }/upload/${item.brand.no  }.png" class="brand_img">
						<img src="${pageContext.request.contextPath }/upload/${item.fuel.code  }.png" class="fuel_img">
						<div class="info_wrap">
							<h3>1일 대여비 : ${item.basicCharge } </h3>
							<p>차종 : ${item.carType.type }</p>
							<p>6시간 이하 : ${item.hour6 }</p>
							<p>10시간 이하 : ${item.hour10 }</p>
							<p>12시간 이하 : ${item.hour12 }</p>
							<p>12시간 이상 : ${item.hourElse }</p>
							<p>렌트 수 : ${item.rentCnt }</p>
							<p class="isRent">${item.rent } </p>
						</div>
					</article>
				</a>
				</c:forEach>
				
			</div>
		</section>
	</div>
	
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
</html>