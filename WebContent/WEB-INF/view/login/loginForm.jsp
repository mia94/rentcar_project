<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<style type="text/css">
	fieldset {
	width: 300px;
}
label {
	width: 80px;
	float: left;
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
	<form action="login.do" method="post">
		<fieldset>
			<p>
				<label>아이디</label> 
				<input type="text" name="id">
			</p>
			<p>
				<label>비밀번호</label> 
				<input type="password" name="password">
			</p>
			<p>
				<input type="checkbox" value="관리자 모드" name="checkManager">
				<input type="submit" value="로그인">
				
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
</body>
</html>