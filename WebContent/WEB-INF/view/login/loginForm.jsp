<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
				<label>���̵�</label> 
				<input type="text" name="id">
					<input type="submit" value="�α���">
				
			</p>
			<p>
				<label>��й�ȣ</label> 
				<input type="password" name="password">
			<input type="checkbox" value="������ ���" name="checkManager">������ ���
			</p>
			 
			<p>
				<input type="button" value="ȸ������" name="join">
				<input type="button" value="ID/PWã��" name="search">
				
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