<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/css/common.css" rel="stylesheet"  type="text/css">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(function(){

	$(".customerDel").click(function(){
		var del = confirm("정말 삭제하시겠습니까?");
		if(del==true){
			var no = $(this).parent("span").prev().text();
			location.href="${pageContext.request.contextPath }/customerDelete.do?code="+code;
		}
		return false;
	})
	
	
	
})
</script>
<body>
<div id="container">
		<header>
			<jsp:include page="../admin.jsp"></jsp:include>
		</header>
		
		<section>
			<div id="wrap_wrap">
			<a href="customerList.do">고객관리</a>
			<a href="employeeList.do">직원관리</a>
			<a href="eventList.do">이벤트관리</a>
			<a href="gradeList.do">등급관리</a>
			
			
			<h1>CUSTOMER</h1>
			<div class="wrap">
				<c:forEach var="item" items="${customerList }">
						<p class="list_p">
							
							<span>${item.code }</span>
							<span>${item.id }</span>
							<span>${item.name }</span>
							<span>${item.zipCode }</span>
							<span>${item.address }</span>
							<span>${item.phone }</span>
							<span id="dob">
							<fmt:formatDate value="${item.dob }" pattern="yyyy-MM-dd"/>
							
							</span>
							<span>${item.email }</span>
							<span>${item.license }</span>
							<span>${item.gradeCode.name }</span>
							<span>${item.rentCnt }</span>

							<c:forEach var="events" items="${item.events }">
								<c:forEach var="event" items="${events.events }">
									<span>${event.name}</span>
								</c:forEach>												

							</c:forEach>
							
							<span class="btn_span">
								<a href="customerModify.do?code=${item.code }">수정</a>
								<a href="customerDelete.do?code=${item.code }" class="customerDel">삭제</a>
							</span>
						</p>
				</c:forEach>
				<p><a href="customerUpload.do" class="btnAdd">[ 추가  ]</a></p>
			</div>
			</div>
		</section>
	</div>
	
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
</html>