<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/css/common.css" rel="stylesheet"  type="text/css">
<link href="${pageContext.request.contextPath }/css/form.css?aaaa" rel="stylesheet"  type="text/css">
<link href="${pageContext.request.contextPath }/css/common_orig.css" rel="stylesheet"  type="text/css">

</head>
<body>
<div id="container">
		<header>
			<jsp:include page="../admin.jsp"></jsp:include>
		</header>
		
		<section>
			<div id="form">
			<h1>직원 추가</h1>
			<h5>추가 할 정보를 입력해 주세요.</h5>
			<div id="input_wrap">
				
					<form action="employeeUpload.do" method="post">
					<fieldset id="emp">
						<p>
							<label>직원 코드</label>
							<input type="text" name="code" class="textfield" value="${nextCode }" readonly>
						</p>
						<p>
							<label>직원 이름</label>
							<input type="text" name="name" class="textfield">
						</p>
						<p>
							<label>직원 연락처</label>
						        <select name="phone">
						        	<!-- <option selected="selected" value="opt">선택하세요</option> -->
						        	<option value="010">010</option>
						        	<option value="011">011</option>
						        	<option value="017">017</option>
						        </select>
						      - <input type="text" name="phone2"> - <input type="text" name="phone3">
						</p>
						<p>
							<label>직원 비밀번호</label>
							<input type="password" name="password" class="textfield">
						</p>
	
						<p id="send"> 
							<input type="submit" value="직원추가"> 
							 <input type="reset" value="초기화">
						</p>
						 </fieldset> 
					</form>	
				</div>
			</div>
		</section>
	</div>
	
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
</html>