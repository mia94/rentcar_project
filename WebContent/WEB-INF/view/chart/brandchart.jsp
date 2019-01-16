<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/css/common.css?a" rel="stylesheet"  type="text/css">
<link href="${pageContext.request.contextPath }/css/common_orig.css" rel="stylesheet"  type="text/css">
<style>
	#chart_wrap{
		width:1000px;
		margin: 50px auto; 
		height: 600px;
		position: relative;
	}
	#chart{
		width:600px;
		height: 400px;
		margin: 0 auto;
	}
</style>
</head>
<body>
	<div id="container">
		<header>
			<jsp:include page="../admin.jsp"></jsp:include>
		</header>
		
		<section>
		<jsp:include page="chartmenu.jsp"></jsp:include>
			<div id="chart_wrap">
				<div id="chart"></div>
			</div>
		</section>
	</div>
	
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
$(document).ready(function(){
	

		google.charts.load('current', {'packages':['corechart']});
	    google.charts.setOnLoadCallback(drawChart);
		
		function drawChart() {
			 var data = google.visualization.arrayToDataTable([
				 	['브랜드','보유 수'],
				 	['${blist.get(0).name}', ${list.get(0).count}],['${blist.get(1).name}', ${list.get(1).count}], 
			  	    ['${blist.get(2).name}', ${list.get(2).count}], ['${blist.get(3).name}', ${list.get(3).count}],
			  	   	['${blist.get(4).name}', ${list.get(4).count}], ['${blist.get(5).name}', ${list.get(5).count}]
				  ]);
			 
			 var options = {
			          title: '브랜드별 보유차량'
			 };
			 
			 var chart = new google.visualization.PieChart(document.getElementById('chart'));

		     chart.draw(data, options);
		}
	});
	

</script>
</body>
</html>