<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/css/common.css" rel="stylesheet"  type="text/css">
<link href="${pageContext.request.contextPath }/css/common_orig.css" rel="stylesheet"  type="text/css">
<link href="${pageContext.request.contextPath }/css/management.css?aaa" rel="stylesheet"  type="text/css">

<style type="text/css">
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(function(){

	$(".gradeDel").click(function(){
		var del = confirm("정말 삭제하시겠습니까?");
		if(del==true){
			var no = $(this).parent("span").prev().text();
			location.href="${pageContext.request.contextPath }/gradeDelete.do?code="+code;
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
			<!-- <a href="customerList.do">고객관리</a>
			<a href="employeeList.do">직원관리</a>
			<a href="eventList.do">이벤트관리</a>
			<a href="gradeList.do">등급관리</a> -->
			<h1 id="title">GRADE</h1><p><a href="gradeUpload.do" class="btnAdd">[ 등급추가 ]</a></p>
			<div class="wrap">
				
				<div id="center">
						<table>
						<tr>
							
							<th>등급 코드</th>
							<th>등급 이름</th>
							<th>최소</th>
							<th>최대</th>
							<th>할인율</th>
							<th>수정 & 삭제</th>
						</tr>
						<c:forEach var="item" items="${gradeList }">
							<tr>
								<%-- <td><img src="${pageContext.request.contextPath }/upload/${item.code }.png"></td> --%>
								<td>${item.code }</td>
								<td >${item.name }</td>
								<td >${item.gLosal }</td>
								<td >${item.gHisal }</td>
								<td >${item.rate } %</td>
								<td>
									<a href="gradeModify.do?code=${item.code }">수정</a>
									<a href="gradeDelete.do?code=${item.code }" class="gradeDel">삭제</a>
								</td>
							</tr>
							</c:forEach>
						</table>
				</div>
				
			</div>
			</div>
		</section>
	</div>
	
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
</html>