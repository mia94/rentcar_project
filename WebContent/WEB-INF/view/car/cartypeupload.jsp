<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/css/common.css" rel="stylesheet"  type="text/css">
<style>
	#upload_wrap{
		width:1000px; 
		height: 600px;
		margin:30px 80px;
	}
	#upload_wrap label{
		width:150px;
		height: 50px;
		line-height: 50px;
		background-color: #4C4C4C;
		color:#F6F6F6;
		font-weight: bold;
		text-align: center;
		float: left;
	}
	#upload_wrap .textfield{
		width:295px;
		height: 46px;
		line-height: 46px;
	}
	#img_wrap{
		width:445px;
		height: 200px;
		margin-top: 80px;
	}
	#img_wrap img{
		width:445px;
		height: 200px;
	}
	#input_wrap{
		width:500px;
		margin: 0px auto;
	}
	#btn_wrap{
		clear:both;
		width:450px;
		text-align: center;
	}
</style>
</head>
<body>
	<div id="container">
		<header>
			<jsp:include page="../admin.jsp"></jsp:include>
		</header>
		<section>
			<div id="upload_wrap">
			<h1>차종추가 창</h1>
				<div id="input_wrap">
					<div id="img_wrap">
						<img src="${pageContext.request.contextPath }/upload/car1.jpg" alt="type">
					</div>
					<form action="cartypeupload.do" enctype="multipart/form-data" method="post">
						<p>
							<label>차종 코드</label>
							<input type="text" name="code" class="textfield" value="${nextCode }" readonly>
						</p>
						<p>
							<label>차종 이름</label>
							<input type="text" name="type" class="textfield">
						</p>
						<p>
							<label>차종 아이콘</label>
							<input type="file" name="icon">
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