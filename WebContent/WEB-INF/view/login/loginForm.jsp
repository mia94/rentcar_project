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

	#login h1{
		text-align: center;
		font-weight: lighter;
	}

	#login h5{
		color: #aaa;
		font-weight: lighter;
		margin: 10px;	
		text-align: center;
	}
	
	fieldset {
	width:587px;
	margin: 0 auto;
	}


	label {
		width:100px;
		position:absolute;
		left:550px;
		margin: 0 auto;
		padding-left :10px;
		float: left;
		text-align: center;
	}
	
	p {	
		overflow: hidden;
		margin: 10px;	
		text-align: center; 	
	}
	
	#btnLogin{
	padding: 5px;
	margin: 5px;
	text-align: center;
	}
	
	 #href{
	text-align: center;
	} 
	
	#href a{
		padding:10px;
		text-decoration: none;
		color: black;
		text-align: center;
		
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
		<h5>로그인을 하시면 더욱 다양한 서비스를 즐길 수 있습니다.</h5>
	
	<form action="login.do" method="post" id="form">
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
			 <input type="checkbox" value="관리자 모드" name="checkManager" id="checkManager">관리자 모드
			  <input type="submit" value="로그인" id="btnLogin">
			 </p>
			 
			<p id="href">
			
				<a href="join.do">회원가입</a>
				<a href="searchId.do">ID찾기</a>
				<a href="searchPw.do">PW찾기</a>
				
				
			</p>
		</fieldset>
	</form>
	</div>
	
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