<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			<h1>이벤트 추가</h1>
			<h5>추가 할 정보를 입력해 주세요.</h5>
			<div id="input_wrap">
					
					<form action="eventUpload.do" method="post">
					<fieldset id="event">
						<p>
							<label>이벤트 코드</label>
							<input type="text" name="code" class="textfield" value="${nextCode }" readonly>
						</p>
						<p>
							<label>이벤트 이름</label>
							<input type="text" name="name" class="textfield">
						</p>
						<p>
							<label>이벤트 별 할인율</label>
							<input type="text" name="rate" class="textfield">
						</p>
	
						 <p id="send"> 
							<input type="submit" value="저장">
							<input type="reset" value="취소">
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