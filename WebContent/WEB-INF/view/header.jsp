<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script type="text/javascript">
$(function() {	
	 <%
				
		if(session.getAttribute("AUTH") != null){
			 session.getAttribute("AUTH");
			%>
			
			$("#aaa").attr("href","logout.do");
			$("#aaa").text("로그아웃");
			$("#bbb").text(" ${AUTH.id }님 환영합니다 ");
			
			<%
		}else{
			%>
			
			<%
		}
	%>	
})
</script>
</head>
<body>
<img src="${pageContext.request.contextPath }/upload/menu.png" alt="menu" id="menu_img">
<h1 id="logo"><a href="home.do">L O G O</a></h1>
<div id="main">
<a href="searchPw.do">비밀번호 찾기</a>
<a href="searchId.do">아이디 찾기</a>
<a href="join.do">회원가입</a>
<a href="login.do" id="aaa">로그인</a><a id="bbb"></a>
</div>	
</body>
</html>


