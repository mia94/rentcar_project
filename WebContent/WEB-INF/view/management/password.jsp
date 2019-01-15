<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/css/common.css?aaa" rel="stylesheet"  type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
<%-- $(function() {
	<%
		if(session.getAttribute("AUTH") !=null){
			String id = (String)session.getAttribute("AUTH");
		}
	%>
}) --%>

</script>

</head>
<body>
	<div id="container">
		<header>
			<jsp:include page="../guest.jsp"></jsp:include>
		</header>
		
		<section>
		<form action="password.do" method="post">
		현재 비밀번호<input type="password" name="password">
		<input type="submit" value="회원정보 수정">
		</form>
			</section>
	</div>
	
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
</html>