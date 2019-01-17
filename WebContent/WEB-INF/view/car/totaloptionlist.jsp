<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/css/common.css?aa" rel="stylesheet"  type="text/css">
<link href="${pageContext.request.contextPath }/css/common_min.css?x" rel="stylesheet"  type="text/css">
<style>
@media all and (min-width:768px){
	#wrap{
		width:720px;
		height:400px; 
		margin: 147px auto;
	}
	#wrap h1{
		text-align: center;
	}
	#wrap a{
		width:350px;
		height: 200px;
		margin:2px;
		float: left;
 		border:1px solid #bbbbbb;
		color:white;
		text-decoration: none;
		overflow: hidden;
		position: relative;
	}#wrap a h3{
		position: absolute;
		top:90px;
		left: 145px;
		color:white;
	}
	#wrap .menu img{
		width:350px;
		height:200px;
		transform-origin:center;
		transition:all 1s;
	}
	#wrap .menu img:hover{
		transform:scale(1.1);
	}
}
@media all and (max-width:767px){
	#wrap{
		width:350px;
		margin:0 auto;
		height: 700px;
	}
	#wrap a{
		width:90%;
		margin-left:5%;
		float:left;
		height: 150px;
		color:white;
		text-decoration: none;
		position: relative;
	}
	#wrap a h3{
		position: absolute;
		top:10px;
		left: 10px;
		color:white;
	}
	#wrap .menu img{
		width:350px;
		height:200px;
	}
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(function(){
	
})
</script>
</head>
<body>
	<div id="container">
		<header>
			<jsp:include page="../admin.jsp"></jsp:include>
		</header>
		
		<section>
			<div id="wrap">
			<h1>CAROPTION MANAGEMENT</h1>
				<a href="cartypelist.do" class="menu">
					<img src="${pageContext.request.contextPath }/upload/car1.jpg" alt="type">
					<h3>CARTYPE</h3>
				</a>
				<a href="brandlist.do" class="menu">
					<img src="${pageContext.request.contextPath }/upload/car2.jpg" alt="brand">
					<h3>BRAND</h3>
				</a>
				<a href="fuellist.do" class="menu">
					<img src="${pageContext.request.contextPath }/upload/car3.jpg" alt="fuel">
					<h3>FUEL</h3>
				</a>
				<a href="caroptionlist.do" class="menu">
					<img src="${pageContext.request.contextPath }/upload/car4.jpg" alt="option">
					<h3>OPTION</h3>
				</a>
			</div>
		</section>
	</div>
	
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
</html>