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
	//submenu
	$("#option_menu").hover(function () {
		  $("#option_sub").show();
	}, function () {
		  $("#option_sub").hide();
	});
})
</script>
</head>
<body>
<div id="main">
<a href="login.do" id="aaa">로그인</a><a id="bbb"></a>
</div>
<div id="menu">
	<ul>
		<li><a href="customerList.do">고객관리</a></li>
		<li><a href="carlist.do">차량관리</a></li>
		<li id="option_menu">
			<a href="totaloptionlist.do">차량옵션관리</a>
			<ul id="option_sub">
				<li><a href="cartypelist.do">CARTYPE</a></li>
				<li><a href="brandlist.do">BRAND</a></li>
				<li><a href="fuellist.do">FUEL</a></li>
				<li><a href="caroptionlist.do">OPTION</a></li>
			</ul>
		</li>
		<li><a href="employeeList.do">직원관리</a></li>
		<li><a href="gradeList.do">등급관리</a></li>
		<li><a href="eventList.do">이벤트관리</a></li>
		<li><a href="reservation.do">대여관리</a></li>
		<li><a href="carmainchart.do">차량통계</a></li>
	</ul>
</div>	
</body>
</html>