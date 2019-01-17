<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/css/common.css?aaaaa" rel="stylesheet"  type="text/css">
<link href="${pageContext.request.contextPath }/css/common_orig.css" rel="stylesheet"  type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	$("#checkManager").click(function() {
		
	})
})
</script>
</head>
<style type="text/css">

 section{
 	height: 500px;
 }

	#login h1{
		text-align: center;
		font-weight: lighter;
		margin: 10px;

	}

	#login h5{
		color: #555;
		font-weight: lighter;
		margin: 10px;	
		text-align: center;
	}
	
	fieldset {
	width:400px;
	margin: 0 auto;
	padding: 15px;
	border:1px solid #aaa;
	border-right:none;
		border-left: none;
		border-bottom: none; 
 background-color: #f8f8f8; 
	}


	label {
		width:100px;	
		margin: 0 auto;
		margin:5px;
		padding-left :10px;
		float: left;
		text-align: center;
	}
	
	p {	
		overflow: hidden;
		margin: 10px;	
		text-align: center;
		 	
	}
	input{
		margin: 5px;
	}
	
	 #href{
	text-align: center;
	} 
	
	#href a{
		padding:10px;
		text-decoration: none;
		color: black;
		text-align: center;
		font-size: 14px;
		
	}
	#loginOK{
	padding: 5px;
	padding-left:25px;
	padding-right:25px;
	background-color: #fff;
	border: 1px solid #333;
	border-radius:3px; 
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
		<h5>아이디 비밀번호를 입력하신 후, 로그인 버튼을 클릭해 주세요.</h5>
	
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
			 <input type="submit" value="로그인" id="loginOK"> 
			 <input type="checkbox" value="관리자 모드" name="checkManager" id="checkManager">관리자 모드			  
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