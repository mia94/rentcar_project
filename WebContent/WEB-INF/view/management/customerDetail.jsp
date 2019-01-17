<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
       <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/css/common.css" rel="stylesheet"  type="text/css">
<link href="${pageContext.request.contextPath }/css/common_orig.css" rel="stylesheet"  type="text/css">
<link href="${pageContext.request.contextPath }/css/customerDetail.css" rel="stylesheet"  type="text/css">

</head>
<body>
<div id="container">
		<header>
			<jsp:include page="../admin.jsp"></jsp:include>
		</header>
		
		<section>
			<div id="detail">
			<table>
				<tr>
					<td>고객코드</td>
					<td>${map.cstm.code }</td>
					
				</tr>
				<tr>
					<td>고객이름</td>
					<td>${map.cstm.name }</td>
				</tr>
				<tr>
					<td>고객아이디</td>
					<td>${map.cstm.id }</td>
				</tr>
				<tr>
					<td>우편번호</td>
					<td>${map.cstm.zipCode }</td>
				</tr>
				<tr>
					<td>주소</td>
					<td>${map.cstm.address }</td>
				</tr>
				<tr>
					<td>연락처</td>
					<td>${map.cstm.phone }</td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><fmt:formatDate value="${map.cstm.dob }" pattern="yyyy-MM-dd"/>
					</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>${map.cstm.email }</td>
				</tr>
				<tr>
					<td>면허종류</td>
					<td>${map.cstm.license }</td>
				</tr>
				<tr>
					<td>등급명</td>
					<td>${map.cstm.gradeCode.name }</td>
				</tr>
				<tr>
					<td>대여횟수</td>
					<td>${map.cstm.rentCnt }</td>
				</tr>
				<tr>
					<td>이벤트</td>
					 <td>
								<c:forEach var="events" items="${map.cstm.events }">
								<c:forEach var="event" items="${events.events }">
									<span>${event.name}</span>
								</c:forEach>												

								</c:forEach>
					</td>
				</tr>
			</table>
			<div>
				<a href="customerModify.do?code=${map.cstm.code }">수정</a>
				<a href="customerDelete.do?code=${map.cstm.code }">삭제</a>
				<a href="customerList.do">목록</a>
			</div>
		</div>
			</section>
	</div>
	
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
</html>