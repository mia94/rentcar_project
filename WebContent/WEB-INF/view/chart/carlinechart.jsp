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
	#chart_wrap{
		width:1000px;
		margin: 50px auto; 
		height: 600px;
		position: relative;
	}
	#chart{
		width:800px;
		height: 500px;
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
	google.charts.load('current', {'packages':['line']});
	google.charts.setOnLoadCallback(drawChart);
	
	function drawChart() {

	      var data = new google.visualization.DataTable();
	      data.addColumn('number', "Day");
	      data.addColumn('number', "kia");
	      data.addColumn('number', "현대");
	      data.addColumn('number', "bmw");
	      data.addColumn('number', "ford");
	     /* <c:forEach var="item" items="${arrBrand}">
	      		data.addColumn('number', "${item}");
		  </c:forEach> */

	      data.addRows([
	        [1,  ${kialist.get(0).count}, ${hyunlist.get(0).count},  ${bmwlist.get(0).count},${fordlist.get(0).count}],
	        [2,  ${kialist.get(1).count}, ${hyunlist.get(1).count},  ${bmwlist.get(1).count},${fordlist.get(1).count}],
	        [3,  ${kialist.get(2).count}, ${hyunlist.get(2).count},  ${bmwlist.get(2).count},${fordlist.get(2).count}],
	        [4,  ${kialist.get(3).count}, ${hyunlist.get(3).count},  ${bmwlist.get(3).count},${fordlist.get(3).count}],
	        [5,  ${kialist.get(4).count}, ${hyunlist.get(4).count},  ${bmwlist.get(4).count},${fordlist.get(4).count}],
	        [6,  ${kialist.get(5).count}, ${hyunlist.get(5).count},  ${bmwlist.get(5).count},${fordlist.get(5).count}],
	        [7,  ${kialist.get(6).count}, ${hyunlist.get(6).count},  ${bmwlist.get(6).count},${fordlist.get(6).count}]
	      ]); 

	      var options = {
	        chart: {
	          title: '월별 브랜드별 렌트 수',
	          subtitle: 'in millions of dollars (USD)'
	        },
	        width: 800,
	        height: 500,
	        axes: {
	          x: {
	            0: {side: 'top'}
	          }
	        }
	      };

	      var chart = new google.charts.Line(document.getElementById('chart'));

	      chart.draw(data, google.charts.Line.convertOptions(options));
	    }
</script>
</body>
</html>

















