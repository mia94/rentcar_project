<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/css/common.css" rel="stylesheet"  type="text/css">
</head>
<body>
<div id="container">
		<header>
			<jsp:include page="../header.jsp"></jsp:include>
		</header>
		
		<section>
			<div id="upload_wrap">
			<h1>직원 추가 창</h1>
			<div id="input_wrap">
					<div id="img_wrap">img</div>
					<form action="employeeUpload.do" method="post">
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
	
						<div id="btn_wrap">
							<input type="submit" value="저장">
							<input type="reset" value="취소">
						</div>
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