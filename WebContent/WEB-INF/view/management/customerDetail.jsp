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
<link href="${pageContext.request.contextPath }/css/customerDetail.css?a" rel="stylesheet"  type="text/css">
   
</head> 
<body>
<div id="container">
		<header>
			<jsp:include page="../admin.jsp"></jsp:include>
		</header>
		
		<section>
		<div id="All">
		<div id="Wrap">
			<div id="carInfo">
						<div id="personImg">
							<%-- <img src="${pageContext.request.contextPath }/upload/G001.png" class='carImg'> --%>
						</div>
					</div>
			
		</div>
			<div id="detail">
			<h3>고객 상세정보</h3>
			<table>
				<tr>
					<th>고객코드</th>
					<td>${map.cstm.code }</td>
					
				</tr>
				<tr>
					<th>고객이름</th>
					<td>${map.cstm.name }</td>
				</tr>
				<tr>
					<th>고객아이디</th>
					<td>${map.cstm.id }</td>
				</tr>
				<tr>
					<th>우편번호</th>
					<td>${map.cstm.zipCode }</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>${map.cstm.address }</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td>${map.cstm.phone }</td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><fmt:formatDate value="${map.cstm.dob }" pattern="yyyy-MM-dd"/>
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${map.cstm.email }</td>
				</tr>
				<tr>
					<th>면허종류</th>
					<td>${map.cstm.license }</td>
				</tr>
				<tr>
					<th>등급명</th>
					<td>${map.cstm.gradeCode.name }</td>
				</tr>
				<tr>
					<th>대여횟수</th>
					<td>${map.cstm.rentCnt }</td>
				</tr>
				<tr>
					<th>이벤트</th>
					 <td>
								<c:forEach var="events" items="${map.cstm.events }">
								<c:forEach var="event" items="${events.events }">
									<span>${event.name}</span>
								</c:forEach>												

								</c:forEach>
					</td>
				</tr>
			</table>
			<div id="btnWrap">
				<a href="customerModify.do?code=${map.cstm.code }">수정</a>
				<a href="customerDelete.do?code=${map.cstm.code }">삭제</a>
				<a href="customerList.do">목록</a>
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