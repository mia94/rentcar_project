<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/css/common.css?aaaaa" rel="stylesheet"  type="text/css">
<style>

</style>
</head>
<body>
	<div id="container">
		<header>
		      <c:choose>
		         <c:when test="${AUTH == null }">
		            <jsp:include page="header.jsp" flush="false" />
		         </c:when>
		          <c:when test="${AUTH.admin == true }">
		            <jsp:include page="admin.jsp" flush="false" />
		         </c:when>
		         <c:when test="${AUTH.admin == false }">
		            <jsp:include page="guest.jsp" flush="false" />
		         </c:when> 
		      </c:choose>
		</header>
		
		<section>
		 <h1>session</h1>
		</section>
	</div>
	<footer>
		<jsp:include page="footer.jsp"></jsp:include>
	</footer>

</body>
</html>