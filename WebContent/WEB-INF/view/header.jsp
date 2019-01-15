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
			$("#bbb").text(" ${AUTH.id }님 환영합니다");
			
			<%
		}else{
			%>
			
			<%
		}
	%>	
})
</script>
<script type="text/javascript">
$(function(){
	
})
</script>
</head>
<body>
<a id="bbb"></a><a href="login.do" id="aaa">로그인</a>
<a href="join.do">회원가입</a>
<a href="searchId.do">아이디</a>
<a href="searchPw.do">비밀번호 찾기</a>
	
</body>
</html>


