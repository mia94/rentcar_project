<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/css/common.css" rel="stylesheet"  type="text/css">
<link href="${pageContext.request.contextPath }/css/common_orig.css" rel="stylesheet"  type="text/css">
<link href="${pageContext.request.contextPath }/css/optionform.css" rel="stylesheet"  type="text/css">
<style>
	
</style>
</head>
<body>
	<div id="container">
		<header>
			<jsp:include page="../admin.jsp"></jsp:include>
		</header>
		
		<section>
			<div id="upload_wrap">
			<h1>브랜드 추가 창</h1>
				<div id="input_wrap">
					<div id="img_wrap">
						<img src="${pageContext.request.contextPath }/upload/car2.jpg" alt="brand">
					</div>
					<form action="brandupload.do" enctype="multipart/form-data" method="post">
						<p>
							<label>브랜드 코드</label>
							<input type="text" name="no" class="textfield" value="${nextCode }" readonly>
						</p>
						<p>
							<label>브랜드 이름</label>
							<input type="text" name="name" class="textfield">
						</p>
						<p>
							<label>브랜드 로고</label>
							<input type="file" name="brandImg">
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