<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	#chartpage_menu{
		width:500px;
		margin: 40px auto;
		text-align: center;
	}
	#chartpage_menu a{
		float:left;
		width:120px;
		height: 40px;
		line-height:40px;
		color:gray;
		border:2px solid #eeeeee;
		border-radius:10px;
		text-decoration: none;
		font-size: 14px;
	}
	#chartpage_menu a:hover{
		background-color: #aaaaaa;
		color: white;
	}
</style>

	<div id="chartpage_menu">
		<a href="carchart.do">차량별 렌트</a>
		<a href="cartypechart.do">차종</a>
		<a href="brandchart.do">브랜드</a>
		<a href="monthbrandchart.do">월별</a>
	</div>