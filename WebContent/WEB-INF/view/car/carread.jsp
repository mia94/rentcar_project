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
		height: 600px;
		margin: 0 auto;
	}
	img{
		width:400px;
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
				<img src="${pageContext.request.contextPath }/images/${carmodel.carCode  }.png">
				<p> 선택된 차량 : ${carmodel.name}</p>
				<p> 선택된 차량 코드 : ${carmodel.carCode}</p>
				<a href="carmodify.do?carCode=${carmodel.carCode }">[수정]</a><!-- 수정연결 아직 안됨 -->
				<a href="cardelete.do?carCode=${carmodel.carCode }" id="delBtn">[삭제]</a>
				<a href="carlist.do">[목록]</a>
			</div>
		</section>
	</div>
	
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
</html>