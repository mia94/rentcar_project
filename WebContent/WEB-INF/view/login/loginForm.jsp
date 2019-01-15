<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/css/common.css?aaaaa" rel="stylesheet"  type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	$("#checkManager").click(function() {
		
	})
})
</script>
</head>
<style type="text/css">
	fieldset {
	width: 500px;
}
label {
	width: 80px;
	float: left;
	clear: both;
}
p:LAST-CHILD {
	text-align: center;
}
p:LAST-CHILD input {
	width: 100px;
	height: 30px;
}

</style>
</head>
<body>

<div id="container">
		<header>
			<jsp:include page="../header.jsp"></jsp:include>
		</header>
		
		<section>
	<div id="login">
		<h1>Login 로그인</h1>
		로그인 하시면 더욱 다양한 서비스를 즐길수 있습니다
	</div>
	<form action="login.do" method="post">
		<fieldset>
			<p>
				<label>아이디</label> 
				<input type="text" name="id">
					<input type="submit" value="로그인">
				
			</p>
			<p>
				<label>비밀번호</label> 
				<input type="password" name="password">
			<input type="checkbox" value="관리자 모드" name="checkManager" id="checkManager">관리자 모드
			</p>
			 
			<p>
				<a href="join.do">회원가입</a>
				<a href="searchId.do">ID찾기</a>
				<a href="searchPw.do">PW찾기</a>
				
				
			</p>
		</fieldset>
	</form>
	
	<c:if test="${error!=null }">
		<script type="text/javascript">
			alert("${error}");
		</script>
	</c:if>
		</section>
	</div>
	
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
</html>