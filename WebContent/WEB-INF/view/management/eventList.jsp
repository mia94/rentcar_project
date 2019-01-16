<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/css/event.css?aaaaa" rel="stylesheet"  type="text/css">
<link href="${pageContext.request.contextPath }/css/common_orig.css" rel="stylesheet"  type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(function(){

	$(".eventDel").click(function(){
		var del = confirm("정말 삭제하시겠습니까?");
		if(del==true){
			var no = $(this).parent("span").prev().text();
			location.href="${pageContext.request.contextPath }/eventDelete.do?code="+code;
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
			<a href="employeeList.do">직원</a>
			<a href="eventList.do">이벤트</a>
			<a href="gradeList.do">등급</a>
			
			<h1>EVENT</h1>
			<div class="wrap">
				<c:forEach var="item" items="${eventList }">
						<p class="list_p">
							
							<span>${item.code }</span>
							<span>${item.name }</span>
							<span>${item.rate }</span>
							<span class="btn_span">
								<a href="eventModify.do?code=${item.code }">수정</a>
								<a href="eventDelete.do?code=${item.code }" class="eventDel">삭제</a>
							</span>
						</p>
				</c:forEach>
				<p><a href="eventUpload.do" class="btnAdd">[ 추가  ]</a></p>
			</div>
			</div>
		</section>
	</div>
	
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
</html>