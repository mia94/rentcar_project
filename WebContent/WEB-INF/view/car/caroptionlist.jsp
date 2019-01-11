<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/css/caroption.css" rel="stylesheet"  type="text/css">
<style>
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(function(){
	$(".optionDel").click(function(){
		var del = confirm("정말 삭제하시겠습니까?");
		if(del==true){
			var no = $(this).parents(".list_p").children("span").first().text();
			location.href="${pageContext.request.contextPath }/optiondelete.do?no="+no;
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
		<a>옵션</a>
			<div id="wrap_wrap">
			<h1>차량옵션 관리</h1>
			<div class="wrap">
				<div>옵션</div>
				<c:forEach var="item" items="${optionList }">
						<p class="list_p">
							<span>${item.no }</span>
							<span>${item.name }</span>
							<span>${item.price }</span>
							<span class="btn_span">
								<a href="optionmodify.do?no=${item.no }">수정</a>
								<a href="optiondelete.do?no=${item.no }" class="optionDel">삭제</a>
							</span>
						</p>	
				</c:forEach>
				<p><a href="caroptionupload.do" class="btnAdd">[ 추가  ]</a></p>
			</div>
			</div>
		</section>
	</div>
	
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
</html>