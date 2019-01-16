<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/css/common.css?aaaaa" rel="stylesheet"  type="text/css">
<link href="${pageContext.request.contextPath }/css/search.css?aa" rel="stylesheet"  type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		if("${msg}"=="1"){
			alert("잘못 입력");
		}
		$("#domain").change(function() {
			
			$("#email2").val($("#domain").val());
		})
	})
</script>
</head>
<body>
<div id="container">
		<header>
			<jsp:include page="../header.jsp"></jsp:include>
		</header>
		
		<section>
		<div id="form">
		<h1>PASSWORD 찾기</h1>
		<h5>이름과 아이디 이메일을 입력해 주세요.</h5>
	<form action="searchPw.do" method="post">
	<fieldset>
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
         <input type="text" name="email1"> @ <input type="text" name="email2"  id="email2">
        <select name="email2" id="domain">
        	<!-- <option value="a">선택하세요</option> -->
        	<option value="naver.com">naver.com</option>
        	<option value="gmail.com">gmail.com</option>
        	<option value="daum.net">daum.net</option>
        	<option value="nate.com">nate.com</option>
        </select>
      </p>
      <p id="href">
      	<a href="searchId.do">ID찾기</a>
      	<input type="submit" value="PW찾기"  id="Btn">
	
      </p>
      </fieldset>
	</form>
		</div>
		</section>
	</div>
	
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
</html>