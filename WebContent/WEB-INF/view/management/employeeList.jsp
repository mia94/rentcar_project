<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/css/common.css" rel="stylesheet"  type="text/css">
<link href="${pageContext.request.contextPath }/css/management.css?aaaaaaa" rel="stylesheet"  type="text/css">
<link href="${pageContext.request.contextPath }/css/common_orig.css" rel="stylesheet"  type="text/css">

</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(function(){

	$(".employeeDel").click(function(){
		var del = confirm("정말 삭제하시겠습니까?");
		if(del==true){
			var no = $(this).parent("span").prev().text();
			location.href="${pageContext.request.contextPath }/employeeDelete.do?code="+code;
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
			
			<h1>EMPLOYEE</h1>
			<div class="wrap">
				<c:forEach var="item" items="${employeeList }">
						<table>
						<tr>
							<td>${item.code }</td>
							<td id="EmpName">${item.name }</td>
							<td>${item.phone }</td>
							<td>
								<a href="employeeModify.do?code=${item.code }">수정</a>
								<a href="employeeDelete.do?code=${item.code }" class="employeeDel">삭제</a>
							</td>
						</tr>
						</table>
				
				</c:forEach>
				<p><a href="employeeUpload.do" class="btnAdd">[ 추가 ]</a></p>
			</div>
			</div>
		</section>
	</div>
	
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
</html>