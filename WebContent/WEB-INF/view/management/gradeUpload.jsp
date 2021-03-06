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
			<h1>등급 추가</h1>
			<h5>추가 할 정보를 입력해 주세요.</h5>
			<div id="input_wrap">
					
					<form action="gradeUpload.do" method="post">
						<fieldset id="grade">
						<p>
							<label>등급 코드</label>
							<input type="text" name="code" class="textfield" value="${nextCode }" readonly>
						</p>
						<p>
							<label>등급 이름</label>
							<input type="text" name="name" class="textfield">
						</p>
						<p>
							<label>최소 범위</label>
						<input type="text" name="gLosal" class="textfield">
						</p>
						<p>
							<label>최대 범위</label>
							<input type="text" name="gHisal" class="textfield">
						</p>
						
						<p>
							<label>등급 별 할인율</label>
						<input type="text" name="rate" class="textfield">
						</p>
	
					 <p id="send">
					 	<input type="reset" value="초기화" id="reset">
							<input type="submit" value="등급추가" id="ok">
							
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