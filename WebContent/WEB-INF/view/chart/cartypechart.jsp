<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/css/common.css" rel="stylesheet"  type="text/css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/jquery.jqplot.css" />
<style>
	#chart_wrap{
		width:1000px;
		margin: 50px auto; 
		height: 600px;
	}
	#chart{
		width:650px;
		height: 500px;
		margin: 0 auto;
		padding-left: 50px;
	}
</style>
</head>
<body>
<div id="container">
		<header>
			<jsp:include page="../header.jsp"></jsp:include>
		</header>
		
		<section>
			<div id="chart_wrap">
				<h1>차트</h1>
				<span id="info">차종별 보유 수</span>
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
	google.charts.load("current", {packages:["corechart"]});
    google.charts.setOnLoadCallback(drawChart);
    
    function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['제목', 'total'],
          ['${list.get(0).title}', ${list.get(0).count}],['${list.get(1).title}', ${list.get(1).count}], 
  	      ['${list.get(2).title}', ${list.get(2).count}], ['${list.get(3).title}', ${list.get(3).count}],
  	   	  ['${list.get(4).title}', ${list.get(4).count}], ['${list.get(5).title}', ${list.get(5).count}]
        ]);
        
        var options = {
                title: '차종별 보유 수',
                pieHole: 0.4,
        };
        
        var chart = new google.visualization.PieChart(document.getElementById('chart'));
        chart.draw(data, options);
    }
    
	});
</script>
</body>
</html>