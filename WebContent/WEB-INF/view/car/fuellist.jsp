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
<link href="${pageContext.request.contextPath }/css/caroption.css" rel="stylesheet"  type="text/css">
<style>
	.fuelImg{
		padding-top: 7px;
		width:20px;
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
			<jsp:include page="../admin.jsp"></jsp:include>
		</header>
		
		<section>
			<div id="wrap_wrap">
			<a href="cartypelist.do">CARTYPE</a>
			<a href="brandlist.do">BRAND</a>
			<a href="fuellist.do">FUEL</a>
			<a href="caroptionlist.do">OPTION</a>
			<h1>FUEL</h1>
			<div class="wrap">
				<c:forEach var="item" items="${fuelList }">
						<p class="list_p">
							<span>
								<img src="${pageContext.request.contextPath }/upload/${item.code }.png" class="fuelImg">
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