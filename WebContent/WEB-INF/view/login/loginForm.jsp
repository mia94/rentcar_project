<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/css/common.css" rel="stylesheet"  type="text/css">
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
			<input type="checkbox" value="관리자 모드" name="checkManager">관리자 모드
			</p>
			 
			<p>
				<input type="button" value="회원가입" name="join">
				<input type="button" value="ID/PW찾기" name="search">
				
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