<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(function() {	
	 <%
				
		if(session.getAttribute("AUTH") != null){
			String id = (String)session.getAttribute("AUTH");
			%>
			
			$("#aaa").attr("href","logout.do");
			$("#aaa").text("로그아웃");
			$("#bbb").text("<%=id %>님 환영합니다");
			<%
		}else{
			%>
			
			<%
		}
	%>	
})
</script>

<a href="">고객관리</a>
<a href="carlist.do">차량관리</a>
<a href="reservation.do">대여관리</a>
<a href="login.do" id="aaa">로그인</a><a id="bbb"></a>
<a href="join.do">회원가입</a>
