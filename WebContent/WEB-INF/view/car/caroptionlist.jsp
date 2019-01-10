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
	#wrap_wrap{
		width:1100px;
		margin: 30px auto;
		padding-right: 100px;
	}
	.wrap{
		width:900px;
		height:298px; 
		margin-left:100px;
		border:1px solid black;
		position: relative;
	}
	.wrap h1{
		width:500px; 
		height: 297px;
		line-height:297px;
		text-align:center;
		float: left;
		background-color: #eeeeee;
	}
	.list_p{
		height: 40px;
		width:340px;
		line-height:40px;
		overflow: hidden;
		position: relative;
	}
	.list_p img{
		width:25px;
	}
	.list_p span{
		float: left;
		width:80px;
		text-align: center;
	}
	.wrap .btnAdd{
		text-decoration: none;
		text-align: right;
		position: absolute;
		bottom: 10px;
		right: 20px;
	}
	.wrap .btn_span{
		width:130px; 
		position: absolute;
		right: 10px;
		top:0;
	}
	.wrap .btn_span a{
		text-decoration: none;
		color:gray;
		padding: 5px;
		border:1px solid gray;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(function(){
	$(".typeDel").click(function(){
		var del = confirm("정말 삭제하시겠습니까?");
		if(del==true){
			var code = $(this).parents(".list_p").children("span").first().text();
			location.href="${pageContext.request.contextPath }/cartypedelete.do?code="+code;
		}
		return false;
	})
	$(".brandDel").click(function(){
		var del = confirm("정말 삭제하시겠습니까?");
		if(del==true){
			var no = $(this).parents(".list_p").children("span").first().text();
			location.href="${pageContext.request.contextPath }/branddelete.do?no="+no;
		}
		return false;
	})
	$(".fuelDel").click(function(){
		var del = confirm("정말 삭제하시겠습니까?");
		if(del==true){
			var no = $(this).parents(".list_p").children("span").first().text();
			location.href="${pageContext.request.contextPath }/fueldelete.do?no="+no;
		}
		return false;
	})
	$(".optionDel").click(function(){
		var del = confirm("정말 삭제하시겠습니까?");
		if(del==true){
			var no = $(this).parents(".list_p").children("span").first().text();
			location.href="${pageContext.request.contextPath }/optiondelete.do?no="+no;
		}
		return false;
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
			<h1>차량옵션 관리</h1>
			<div id="wrap_wrap">
			<div class="wrap">
				<h1>차종</h1>
				<c:forEach var="item" items="${typeList }">
						<p class="list_p">
							<span>${item.code }</span> 
							<span>
								<img src="${pageContext.request.contextPath }/images/${item.type }b.png">
								${item.type }
							</span>
							<span class="btn_span">
								<a href="cartypemodify.do?code=${item.code }">수정</a>
								<a href="cartypedelete.do?code=${item.code }" class="typeDel">삭제</a>
							</span>
						</p>
				</c:forEach>
				<p><a href="cartypeupload.do" class="btnAdd">추가</a></p>
			</div>
			<div class="wrap">
				<h1>브랜드</h1>
				<c:forEach var="item" items="${brandList }">
						<p class="list_p">
							<span>${item.no }</span>
							<span>
								<img src="${pageContext.request.contextPath }/upload/${item.no }.png">
								${item.name }
							</span>
							<span class="btn_span">
								<a href="brandmodify.do?no=${item.no }">수정</a>
								<a href="branddelete.do?no=${item.no }" class="brandDel">삭제</a>
							</span>
						</p>
				</c:forEach>
				<p><a href="brandupload.do" class="btnAdd">추가</a></p>
			</div>
			<div class="wrap">
			<h1>연료</h1>
				<c:forEach var="item" items="${fuelList }">
						<p class="list_p">
							<span>${item.no }</span>
							<span>
								<img src="${pageContext.request.contextPath }/upload/${item.code }.png">
								${item.code }
							</span>
							<span class="btn_span">
								<a href="fuelmodify.do?code=${item.code }">수정</a>
								<a href="fueldelete.do?no=${item.no }" class="fuelDel">삭제</a>
							</span>
						</p>
				</c:forEach>
				<p><a href="fuelupload.do" class="btnAdd">추가</a></p>
			</div>
			<div class="wrap">
				<h1>옵션</h1>
				<c:forEach var="item" items="${optionList }">
						<p class="list_p">
							<span>${item.no }</span>
							<span>${item.name }</span>
							<span>${item.price }</span>
							<span class="btn_span">
								<a href="optionmodify.do?no=${item.no }">수정</a>
								<a href="optiondelete.do?no=${item.no }" class="optionDel">삭제</a>
							</span>
						</p>	
				</c:forEach>
				<p><a href="caroptionupload.do" class="btnAdd">추가</a></p>
			</div>
			</div>
		</section>
	</div>
	
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
</html>