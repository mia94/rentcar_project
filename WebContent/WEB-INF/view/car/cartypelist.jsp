<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/css/caroption.css?a" rel="stylesheet"  type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(function(){
	$(".typeDel").click(function(){
		var del = confirm("정말 삭제하시겠습니까?");
		if(del==true){
			var code = $(this).parent("span").prev().text();
			location.href="${pageContext.request.contextPath }/cartypedelete.do?code="+code;
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
			<div id="wrap_wrap">
			<a href="cartypelist.do">CARTYPE</a>
			<a href="brandlist.do">BRAND</a>
			<a href="fuellist.do">FUEL</a>
			<a href="caroptionlist.do">OPTION</a>
			<h1>CARTYPE</h1>
			<div class="wrap">
				<c:forEach var="item" items="${typeList }">
						<p class="list_p">
							<span>
								<img src="${pageContext.request.contextPath }/images/${item.type }b.png">
							</span>
							<span>${item.type }</span>
							<span>${item.code }</span> 
							<span class="btn_span">
								<a href="cartypemodify.do?code=${item.code }">수정</a>
								<a href="cartypedelete.do?code=${item.code }" class="typeDel">삭제</a>
							</span>
						</p>
				</c:forEach>
				<p><a href="cartypeupload.do" class="btnAdd">[ 추가  ]</a></p>
			</div>
			</div>
		</section>
	</div>
	
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
</html>