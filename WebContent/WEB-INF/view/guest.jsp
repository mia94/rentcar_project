<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(function() {	
	 <%
				
		if(session.getAttribute("AUTH") != null){
			 session.getAttribute("AUTH");
			%>
			
			$("#aaa").attr("href","logout.do");
			$("#aaa").text("로그아웃");
			$("#bbb").text(" ${AUTH.id }님 환영합니다");
			
			<%
		}else{
			%>
			
			<%
		}
	%>	
	if($(window).width()<769){
		$("#menu").css("margin-left","-100%").css("opacity",1);
		$("#menu_img").click(function(){
			var opacity = $("#menu").css("opacity");
			if(opacity == 0){
				$("#menu").css("width","100%").css("opacity",1);
				$("#menu").animate({"margin-left":"0", "opacity":1});
			}else{
				$("#menu").animate({"margin-left":"-100%", "opacity":0});
			}
		})
	}
})
</script>
</head>
<body>
<img src="${pageContext.request.contextPath }/upload/menu.png" alt="menu" id="menu_img">
<h1 id="logo"><a href="home.do">L O G O</a></h1>
<div id="main">
	<a href="login.do" id="aaa">로그인</a><a id="bbb"></a>
</div>
	<div id="menu">
	<ul>
		<li><a href="carlistcustomer.do">차량조회</a></li>
		<li><a href="reservation.do">차량대여</a></li>
		<li><a href="rentChkList.do">대여내역</a></li>
		<li><a href="password.do">개인정보관리</a></li>
	</ul>
	</div>	
</body>
</html>