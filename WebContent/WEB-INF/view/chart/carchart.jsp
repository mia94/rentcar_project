<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/css/common.css?aaa" rel="stylesheet"  type="text/css">
<link href="${pageContext.request.contextPath }/css/common_orig.css" rel="stylesheet"  type="text/css">
<style>
	#chart_wrap{
		width:1000px;
		margin: 50px auto; 
		height: 800px;
		position: relative;
	}
	#chart{
		width:800px;
		height: 700px;
		margin: 100px auto 50px;
	}
	#info{
		position: absolute;
		bottom: 80px;
		left: 500px;
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
				<span id="info">차량 별 렌트 수</span>
			</div>
		</section>
	</div>
	
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
	google.charts.load('current', {'packages':['bar']});
	google.charts.setOnLoadCallback(drawStuff);
	
	function drawStuff() {
	  var data = new google.visualization.arrayToDataTable([
	    ['차량코드', '차량'],
	    <c:forEach var="item" items="${list}" varStatus="status">
			['${list.get(status.index).carCode}', ${list.get(status.index).rentCnt}],
		</c:forEach>
	  ]);
	
	  var options = {
	    width: 800,
	    chart: {
	      title: '차량별 렌트',
	    },
	    bars: 'horizontal', // Required for Material Bar Charts.
	    series: {
	      0: { axis: 'distance' }, // Bind series 0 to an axis named 'distance'.
	      1: { axis: 'brightness' } // Bind series 1 to an axis named 'brightness'.
	    },
	    axes: {
	      x: {
	        distance: {label: 'rent count'}, // Bottom x-axis.
	        brightness: {side: 'top', label: 'rent count'} // Top x-axis.
	      }
	    }
	  };
	
	var chart = new google.charts.Bar(document.getElementById('chart'));
	chart.draw(data, options);
	};
</script>
</body>
</html>