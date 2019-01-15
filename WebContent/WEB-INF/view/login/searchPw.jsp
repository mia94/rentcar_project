<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/css/common.css?aa" rel="stylesheet"  type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		if("${msg}"=="1"){
			alert("잘못 입력");
		}
	})
</script>
</head>
<body>
<div id="container">
		<header>
			<jsp:include page="../header.jsp"></jsp:include>
		</header>
		
		<section>
	<form action="searchPw.do" method="post">
		<p>
		<label>이름</label>
		<input type="text" name="name">
	</p>
	 <p>
		<label>아이디</label>
		<input type="text" name="id"><!-- <input type="button" value="확인" id="btnOk"> -->
	</p>
	 <p>
         <label>이메일</label>
         <input type="text" name="email1"> @
        <select name="email2">
        	<!-- <option value="a">선택하세요</option> -->
        	<option value="naver.com">naver.com</option>
        	<option value="gmail.com">gmail.com</option>
        	<option value="daum.net">daum.net</option>
        	<option value="nate.com">nate.com</option>
        </select>
      </p>
      <p>
      	<input type="submit" value="비밀번호 변경">
      </p>
	</form>
		</section>
	</div>
	
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
</html>