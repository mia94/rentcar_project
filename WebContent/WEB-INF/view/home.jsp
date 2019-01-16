<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, user-scalable=no">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/css/common.css?x" rel="stylesheet"  type="text/css">
<style>
@media all and (max-width:767px){
	header{
		width:100%;
		height: 50px;
		background-color: #3a3a3a;
	}
	header #logo{
		position: absolute;
		top:5px;
		left: 50px;
		font-size: 25px;
	}
	header #menu_img{
		display:block;
		width:30px;
		height: 30px;
		position: absolute;
		top:10px;
		left:10px;
		z-index: 20;
	}
	header #main{
		width:100%;
		height:100%;
		position: absolute;
		top:50px;
		background-color: rgba(0,0,0,0.7);
		z-index: 100;
	}
	header #main a{
		width:100%;
		line-height: 40px;
		border-bottom: 1px solid white;
		text-align: center;
		color:white;
		line-height: 40px;
		text-decoration: none;
		background-color: rgba(0,0,0,0.7);
	}
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(function(){
	$("#main").css("margin-left","-100%").css("opacity",1); //0에서 1로 변경
	$("#menu_img").click(function(){
		var opacity = $("#main").css("opacity");
		if(opacity == 0){
			/* $("#main").css("width","100%").css("opacity",1); */
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