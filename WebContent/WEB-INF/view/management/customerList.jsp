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
<link href="${pageContext.request.contextPath }/css/common_orig.css" rel="stylesheet"  type="text/css">
<link href="${pageContext.request.contextPath }/css/management.css?a" rel="stylesheet"  type="text/css">
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
			
			
			<h1 id="title">CUSTOMER</h1> <p><a href="customerUpload.do" class="btnAdd">[ 고객 추가  ]</a></p>
			<div class="wrap">
				
						<table>
						<tr>
							<th>고객 코드</th>
							<th>고객 아이디</th>
							<th>고객 이름</th>
							<th>연락처</th>
							<th>면허종류</th>
							<th>등급</th>
							<th>대여횟수</th>	
							<th>이벤트</th>
							<th>수정 & 삭제</th>
						</tr>
						<c:forEach var="item" items="${customerList }">
							<tr>
								<td>${item.code }</td>
								<td id="id">${item.id }</td>
								<td id="CusName">${item.name }</td>
								<%-- <td id="zipCode">${item.zipCode }</td> --%>
								<%-- <td id="addr">${item.address }</td> --%>
								<td id="tel">${item.phone }</td>
								<%-- <td id="dob"><fmt:formatDate value="${item.dob }" pattern="yyyy-MM-dd"/></td> --%>
								<%-- <td id="email">${item.email }</td> --%>
								<td id="license">${item.license }</td> 
								<td id="CusGrade">${item.gradeCode.name }</td>
								<td id="rentCnt">${item.rentCnt }</td>
								 <td id="CusEvent">
								<c:forEach var="events" items="${item.events }">
								<c:forEach var="event" items="${events.events }">
									<span>${event.name}</span>
								</c:forEach>												

								</c:forEach>
								</td>
								<td>
									<a href="customerModify.do?code=${item.code }">수정</a>
									<a href="customerDelete.do?code=${item.code }" class="customerDel">삭제</a>
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