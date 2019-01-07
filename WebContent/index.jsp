<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*{
		margin:0;
		padding: 0;
	}
	#container{
		width:1200px;
		margin:0 auto;
	}
	header{
		height: 100px;
		width:1200px;
		border:1px black solid;
	}
	section{
		width:1200px;
		border:1px black solid;
		padding:10px;
	}
	footer{
		width:100%;
		background-color: gray;
		height: 120px;
	}
</style>
</head>
<body>
	<div id="container">
		<header>
			<jsp:include page="header.jsp"></jsp:include>
		</header>
		
		<section>
		
		</section>
	</div>
	
	<footer>
		<jsp:include page="footer.jsp"></jsp:include>
	</footer>

</body>
</html>