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
<link href="${pageContext.request.contextPath }/css/management.css?aazzaa" rel="stylesheet"  type="text/css">
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
	
	<c:forEach var="item" items="${customerList}" varStatus="status">
	var BlackList = $(".CusGrade").eq(${status.index}).text().trim();
	if(BlackList=="블랙리스트"){
		$(".CusGrade").eq(${status.index}).html("블랙리스트");
		$(".CusGrade").eq(${status.index}).parent().css("background-color","#FFEFEF");
		$(".CusGrade").eq(${status.index}).css("color","#AA1212"); 
	} 
	</c:forEach>
	
})
</script>

<body>
<div id="container">
		<header>
			<jsp:include page="../admin.jsp"></jsp:include>
		</header>
		
		<section>
		
		
		<div id="inner">
     		  <%-- <img src="${pageContext.request.contextPath }/images/btnX.png" id="btnx">  --%>
   			</div>
		
			<div id="wrap_wrap">
			<!-- <a href="customerList.do">고객관리</a>
			<a href="employeeList.do">직원관리</a>
			<a href="eventList.do">이벤트관리</a>
			<a href="gradeList.do">등급관리</a> -->
			
			
			<h1 id="title">CUSTOMER</h1> 
			<p>
			<a href="customerUpload.do" class="btnAdd">[ 고객 추가  ]</a>
			<p id="span">
			<span id="desc">세부사항은 고객코드를 눌러주세요.</span>
			<p>
			</p>
			<div class="wrap">
				<div id="center">
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
							<tr class="cusInfo">
								<td ><a href="customerRead.do?code=${item.code }">${item.code }</a></td>
								<td>${item.id }</td>
								<td>${item.name }</td>
								<%-- <td id="zipCode">${item.zipCode }</td> --%>
								<%-- <td id="addr">${item.address }</td> --%>
								<td>${item.phone }</td>
								<%-- <td id="dob"><fmt:formatDate value="${item.dob }" pattern="yyyy-MM-dd"/></td> --%>
								<%-- <td id="email">${item.email }</td> --%>
								<td>${item.license }</td> 
								<td class="CusGrade">${item.gradeCode.name }</td>
								<td>${item.rentCnt }</td>
								 <td>
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
			</div>
		</section>
	</div>
	
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
	
<%-- <script src="${pageContext.request.contextPath }/js/customJason.js?cassdfs"></script> --%>
	
</body>

</html>