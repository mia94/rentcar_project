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
			<jsp:include page="../admin.jsp"></jsp:include>
		</header>
		
		<section>
			<div id="modify_wrap">
			<h1>이벤트 수정 창</h1>
				<div id="input_wrap">
					<div id="img_wrap">img</div>
					<form action="eventModify.do" method="post">
						<p>
							<label>이벤트 코드</label>
							<input type="text" name="code" class="textfield" readonly value="${event.code }">
						</p>
						<p>
							<label>이벤트 이름</label>
							<input type="text" name="name" class="textfield" value="${event.name }">
						</p>
						<p>
							<label>이벤트 할인율</label>
							<input type="text" name="rate" class="textfield" value="${event.rate }">
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