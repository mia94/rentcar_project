<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/css/common.css?aaa" rel="stylesheet"  type="text/css">
<link href="${pageContext.request.contextPath }/css/common_orig.css" rel="stylesheet"  type="text/css">
<link href="${pageContext.request.contextPath }/css/management.css?aa" rel="stylesheet"  type="text/css">
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
			<a href="customerList.do">고객관리</a>
			<a href="employeeList.do">직원관리</a>
			<a href="eventList.do">이벤트관리</a>
			<a href="gradeList.do">등급관리</a>
			
			<h1 id="title">EVENT</h1><p><a href="eventUpload.do" class="btnAdd">[ 이벤트 추가 ]</a></p>
			<div class="wrap">
			<table>
							<tr>
							<th>이벤트 코드</th>
							<th>이벤트 이름</th>
							<th>할인율</th>
							<th>수정 & 삭제</th>
							
							</tr>
							<c:forEach var="item" items="${eventList }">
							<tr>
								<td>${item.code }</td>
								<td id="EventName">${item.name }</td>
								<td id="rate">${item.rate } %</td>
								<td>
									<a href="eventModify.do?code=${item.code }">수정</a>
									<a href="eventDelete.do?code=${item.code }" class="eventDel">삭제</a>
								</td>
							</tr>					
				</c:forEach>
				</table>
				
			</div>
			</div>
		</section>
	</div>
	
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
</html>