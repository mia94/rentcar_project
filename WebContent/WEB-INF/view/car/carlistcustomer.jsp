<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/css/common.css?aa" rel="stylesheet"  type="text/css">
<link href="${pageContext.request.contextPath }/css/common_orig.css" rel="stylesheet"  type="text/css">
<style>
	#list_wrap{
		width:1100px;
		margin: 0 auto;
		overflow:hidden;
	}
	#list_wrap h1{
		margin: 5px;
		padding-bottom: 10px;
	}
	#list_wrap ul{
		height: 60px;
		list-style: none;
	}
	#list_wrap ul li{
		float:left;
		border-left:0.5px solid #bbbbbb; 
		border-top:0.5px solid #bbbbbb;
		text-align: center;
	}
	#list_wrap ul li:LAST-CHILD{
		border-right:0.5px solid #bbbbbb; 
	}
	#list_wrap ul li a{
		text-decoration: none;
		float:left;
		width:154px;
		height: 70px;
		position: relative;
		color:black;
	}
	#list_wrap ul li a:hover{
		background-color: #D9E5FF;
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
	.btn{
		display: block;
	}
	#container article{
		width:520px;
		padding:10px;
		height:170px;
		border:0.5px solid #E7E7E7;
		float: left;
		position: relative; 
	}
	#container article:hover{
		background-color: #EBF7FF;
	}
	#container article h3{
		color:gray;
	}
	#container article .car_img{
		width:200px;
		height: 120px;
		margin-left: 40px; 
	}
	#container article .fuel_img{
		width:35px;
		position: absolute;
		left: 270px;
		bottom: 55px;
	}
	#container article .brand_img{
		width:45px;
		position: absolute;
		left: 260px;
		top: 30px;
	}
	#container article .info_wrap{
		position:absolute;
		right:10px;
		top:10px;
		width:180px;
	}
	#container article .info_wrap h3{
		color:black;
	}
	#container article .info_wrap p{
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
			<jsp:include page="../guest.jsp"></jsp:include>
		</header>
		
		<section>
			<div id="list_wrap">
			<h1>차량 조회</h1>
				<ul>
					<li><a href="carlistcustomer.do" id="total">전체</a></li>
					<li>
						<a href="selectcustomer.do?cartype=S1">
							<img src="${pageContext.request.contextPath }/images/경형b.png">
							<span>경형</span>
						</a>
					</li>
					<li>
						<a href="selectcustomer.do?cartype=S2">
							<img src="${pageContext.request.contextPath }/images/소형b.png">
							<span>소형</span>
						</a>
					</li>
					<li>
						<a href="selectcustomer.do?cartype=S3">
							<img src="${pageContext.request.contextPath }/images/중형b.png">
							<span>중형</span>
						</a>
					</li>
					<li>
						<a href="selectcustomer.do?cartype=S4">
							<img src="${pageContext.request.contextPath }/images/대형b.png">
							<span>대형</span>
						</a>
					</li>
					<li>
						<a href="selectcustomer.do?cartype=S5">
							<img src="${pageContext.request.contextPath }/images/승합b.png">
							<span>승합</span>
						</a>
					</li>
					<li>
						<a href="selectcustomer.do?cartype=S6">
							<img src="${pageContext.request.contextPath }/images/suvbk.png">
							<span>suv</span>
						</a>
					</li>
				
				</ul>
				<c:forEach var="item" items="${list }">
				<a href="carreadcustomer.do?carCode=${item.carCode }">
					<article data-index='i'>
					<h3>${item.name }</h3>
						<img src="${pageContext.request.contextPath }/upload/${item.carCode  }.png" class="car_img">
						<img src="${pageContext.request.contextPath }/upload/${item.brand.no  }.png" class="brand_img">
						<img src="${pageContext.request.contextPath }/upload/${item.fuel.code  }.png" class="fuel_img">
						<div class="info_wrap">
							<h3>1일 대여비 : ${item.basicCharge } </h3>
							<p>차종 : ${item.carType.type }</p> 
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