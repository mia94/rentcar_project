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
	#wrap_wrap{
		width:1000px;
		margin: 30px auto;
		padding-right: 100px;
	}
	.wrap{
		width:900px;
		height:298px; 
		margin-left:100px;
		border:1px solid black;
		position: relative; 
	}
	.wrap div{
		width:500px; 
		height: 297px;
		float: left;
	}
	.list_p{
		height: 40px;
		width:380px;
		line-height:40px;
		overflow: hidden;
		position: relative;
	}
	.list_p img{
		width:25px;
	}
	.list_p span{
		float: left;
		width:80px;
		text-align: center;
	}
	.wrap .btnAdd{
		text-decoration: none;
		text-align: right;
		position: absolute;
		bottom: 20px;
		right: 190px;
	}
	.wrap .btn_span{
		width:130px; 
		position: absolute;
		right: 10px;
		top:0;
	}
	.wrap .btn_span a{
		text-decoration: none;
		color:gray;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(function(){

	$(".fuelDel").click(function(){
		var del = confirm("정말 삭제하시겠습니까?");
		if(del==true){
			var no = $(this).parent("span").prev().text();
			location.href="${pageContext.request.contextPath }/fueldelete.do?no="+no;
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
		<a href="cartypelist.do">차종옵션</a>
		<a href="brandlist.do">브랜드</a>
		<a href="fuellist.do">연료</a>
		<a href="caroptionlist.do">옵션</a>
			<div id="wrap_wrap">
			<h1>연료 관리</h1>
			<div class="wrap">
			<div>
				연료
				<%-- <img alt="fuel" src="${pageContext.request.contextPath }/images/fuel.png"> --%>
			</div>
				<c:forEach var="item" items="${fuelList }">
						<p class="list_p">
							<span>
								<img src="${pageContext.request.contextPath }/upload/${item.code }.png">
							</span>
							<span>${item.code }</span>
							<span>${item.no }</span>
							<span class="btn_span">
								<a href="fuelmodify.do?code=${item.code }">수정</a>
								<a href="fueldelete.do?no=${item.no }" class="fuelDel">삭제</a>
							</span>
						</p>
				</c:forEach>
				<p><a href="fuelupload.do" class="btnAdd">[ 추가  ]</a></p>
			</div>
			</div>
		</section>
	</div>
	
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
</html>