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
			<div id="modify_wrap">
			<h1>등급 수정 창</h1>
				<div id="input_wrap">
					<div id="img_wrap">img</div>
					<form action="gradeModify.do" method="post">
						<p>
							<label>등급 코드</label>
							<input type="text" name="code" class="textfield" readonly value="${grade.code }">
						</p>
						<p>
							<label>등급 이름</label>
							<input type="text" name="name" class="textfield" value="${grade.name }">
						</p>
						<p>
							<label>최대 등급</label>
							<input type="text" name="gHisal" class="textfield" value="${grade.gHisal }">
						</p>
						<p>
							<label>최소 등급</label>
							<input type="text" name="gLosal" class="textfield" value="${grade.gLosal }">
						</p>
						<p>
							<label>등급별 할인율</label>
							<input type="text" name="rate" class="textfield" value="${grade.rate }">
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