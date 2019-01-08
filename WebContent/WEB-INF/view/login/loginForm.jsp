<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
	<form action="" method="post">
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

				<input type="submit" value="로그인">
			</p>
		</fieldset>
	</form>
</body>
</html>