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
	#read_wrap{
		width:900px;
		height: 500px;
		margin: 20px auto;
		margin-top:100px;
		position: relative;
	}
	img{
		width:400px;
	}
	#info_wrap{
		width:350px;
		height: 200px;
		position:absolute;
		right:50px;
		top:0;
		background-color: lightgray;
		padding: 10px;
	}
	#btn_wrap{ 
		clear: both;
		margin-top:100px;
		text-align: center;
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
			<h1>차량별 세부정보</h1>
			<div id="read_wrap">
				<img src="">
				<img src="${pageContext.request.contextPath }/upload/${carmodel.carCode  }.png">
				<div id="info_wrap">
					<p> 선택된 차량 : ${carmodel.name}</p>
					<p> 차량 색상 : ${carmodel.color }</p>
					<p> 선택된 차량 코드 : ${carmodel.carCode}</p>
				</div>
				<div id="btn_wrap">
					<a href="carmodify.do?carCode=${carmodel.carCode }">[수정]</a><!-- 수정연결 아직 안됨 -->
					<a href="cardelete.do?carCode=${carmodel.carCode }" id="delBtn">[삭제]</a>
					<a href="carlist.do">[목록]</a>
				</div>
			</div>
		</section>
	</div>
	
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
</html>