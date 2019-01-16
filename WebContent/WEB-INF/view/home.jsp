<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, user-scalable=no">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/css/common.css?xx" rel="stylesheet"  type="text/css">
<link href="${pageContext.request.contextPath }/css/common_min.css?aa" rel="stylesheet"  type="text/css">
<style>

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(function(){
	$("#main").css("margin-left","-100%").css("opacity",1); //0에서 1로 변경
	$("#menu_img").click(function(){
		var opacity = $("#main").css("opacity");
		if(opacity == 0){
			$("#main").animate({"margin-left":"0", "opacity":1});
		}else{
			$("#main").animate({"margin-left":"-100%", "opacity":0});
		}
	})
})
</script>
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
		 <div id="session_home">
		 	<h1>RENT MANAGEMENT</h1>
		 	<img src="${pageContext.request.contextPath }/upload/main.png" alt="main" id="main_img">
		 	<img src="${pageContext.request.contextPath }/upload/procedure.jpg" alt="procedure" id="procedure">
		 	<img src="${pageContext.request.contextPath }/upload/info.jpg" alt="info" id="info_img">
		 	<img src="${pageContext.request.contextPath }/upload/jeju.jpg" alt="jeju" id="jeju_img">
		 	<img src="${pageContext.request.contextPath }/upload/car_main2.png" alt="car" id="car_main">
		 </div>
		</section>
	</div>
	<footer>
		<jsp:include page="footer.jsp"></jsp:include>
	</footer>

</body>
</html>