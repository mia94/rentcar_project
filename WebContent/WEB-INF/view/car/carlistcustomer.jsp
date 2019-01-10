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
	#list_wrap{
		width:1100px;
		margin: 0 auto;
		overflow:hidden;
	}
	ul{
		height: 60px;
		list-style: none;
		margin: 10px; 
	}
	ul li{
		float:left;
		border:1px solid white;	
		text-align: center;
	}
	ul li a{
		text-decoration: none;
		float:left;
		width:150px;
		height: 60px;
		line-height: 60px;
		color:white;
		background-color: gray;
	}
	.btn{
		display: block;
	}
	article{
		width:520px;
		padding:10px;
		height:170px;
		border:1px solid gray;
		float: left;
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
		width:40px;
		margin: 30px;
	}
	article .brand_img{
		width:60px;
		margin: 30px;
	}
</style>
</head>
<body>
<div id="container">
		<header>
			<jsp:include page="../header.jsp"></jsp:include>
		</header>
		
		<section>
		<h1>차량 목록</h1>
		
			<div id="list_wrap">
				<ul>
					<li><a href="carlistcustomer.do">전체</a></li>
					<li><a href="selectcustomer.do?cartype=S1">경형</a></li>
					<li><a href="selectcustomer.do?cartype=S2">소형</a></li>
					<li><a href="selectcustomer.do?cartype=S3">중형</a></li>
					<li><a href="selectcustomer.do?cartype=S4">대형</a></li>
					<li><a href="selectcustomer.do?cartype=S5">승합</a></li>
					<li><a href="selectcustomer.do?cartype=S6">suv</a></li>
				</ul>
				<c:forEach var="item" items="${list }">
				<a href="carreadcustomer.do?carCode=${item.carCode }">
					<article data-index='i'>
					<h3>${item.name }</h3>
						<img src="${pageContext.request.contextPath }/upload/${item.carCode  }.png" class="car_img">
						<img src="${pageContext.request.contextPath }/upload/${item.fuel.code  }.png" class="fuel_img">
						<img src="${pageContext.request.contextPath }/upload/${item.brand.no  }.png" class="brand_img">
						<p>
							${item.color },
							${item.brand.name },
							${item.carType.type },
							${item.basicCharge },
							${item.hour6 },
							${item.hour10 },
							${item.hour12 },
							${item.hourElse },
							<!-- isRent와 rentCnt실패ㅠㅡㅜ  -->
						</p>
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