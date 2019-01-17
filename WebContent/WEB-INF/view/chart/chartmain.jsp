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
	#wrap{
		width:800px;
		height:800px;
		margin: 50px auto;
		position: relative;
	}
	#wrap>p{
		color: #999999;
		font-size: 14px;
	}
	/*차트 디스플레이*/
	#brand_chart, #type_chart{
		width:300px;
	}
	#brand_chart{
		position: absolute;
		left: 10px;
		top:10px;	
	}
	#type_chart{
		position: absolute;
		left: 10px;
		top:200px;
	}
	#line_chart{
		width:450px;
		position: absolute;
		left: 310px;
		top:10px;
	}
	#car_chart{
		width:800px;
		position: absolute;
		top:400px;
		left: 10px;
	}
</style>
</head>
<body>
<div id="container">
		<header>
			<jsp:include page="../admin.jsp"></jsp:include>
		</header>
		
		<section>
		<p>그래프를 클릭하면 해당 페이지로 이동합니다</p>
			<div id="wrap">
				<a href="carchart.do" class="menu">
					<div id="car_chart"></div>
				</a>
				<a href="cartypechart.do" class="menu">
					<div id="type_chart"></div>
				</a>
				<a href="brandchart.do" class="menu">
					<div id="brand_chart"></div>
				</a>
				<a href="monthbrandchart.do" class="menu">
					<div id="line_chart"></div>
				</a>
			</div>
		</section>
	</div>
	
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script class="include" type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.jqplot.min.js"></script>
	<script class="include" language="javascript" type="text/javascript" src="${pageContext.request.contextPath }/js/jqplot.barRenderer.min.js"></script>
	<script class="include" language="javascript" type="text/javascript" src="${pageContext.request.contextPath }/js/jqplot.categoryAxisRenderer.min.js"></script>
	<script class="include" language="javascript" type="text/javascript" src="${pageContext.request.contextPath }/js/jqplot.pointLabels.min.js"></script>
	<script>
		//브랜드 통계
		$(document).ready(function(){
		

		google.charts.load('current', {'packages':['corechart']});
	    google.charts.setOnLoadCallback(drawChart);
		
		function drawChart() {
			 var data = google.visualization.arrayToDataTable([
				 	['브랜드','보유 수'],
				 	['${blist.get(0).name}', ${cblist.get(0).count}],['${blist.get(1).name}', ${cblist.get(1).count}], 
			  	    ['${blist.get(2).name}', ${cblist.get(2).count}], ['${blist.get(3).name}', ${cblist.get(3).count}],
			  	   	['${blist.get(4).name}', ${cblist.get(4).count}], ['${blist.get(5).name}', ${cblist.get(5).count}]
				  ]);
			 
			 var options = {
			          title: '브랜드별 보유차량'
			 };
			 
			 var chart = new google.visualization.PieChart(document.getElementById('brand_chart'));

		     chart.draw(data, options);
		}
		});
		//차종 통계
		$(document).ready(function(){
		google.charts.load("current", {packages:["corechart"]});
   		google.charts.setOnLoadCallback(drawChart);
    
	    function drawChart() {
	        var data = google.visualization.arrayToDataTable([
	          ['제목', 'total'],
	          ['${tlist.get(0).type}', ${tclist.get(0).count}],['${tlist.get(1).type}', ${tclist.get(1).count}], 
	  	      ['${tlist.get(2).type}', ${tclist.get(2).count}], ['${tlist.get(3).type}', ${tclist.get(3).count}],
	  	   	  ['${tlist.get(4).type}', ${tclist.get(4).count}], ['${tlist.get(5).type}', ${tclist.get(5).count}]
	        ]);
	        
	        var options = {
	                title: '차종별 보유 수',
	                pieHole: 0.4,
	        };
	        
	        var chart = new google.visualization.PieChart(document.getElementById('type_chart'));
	        chart.draw(data, options);
	    }
	    
		});
		
		//차량별
		$(function(){

		var line = new Array();

		<c:forEach var="item" items="${list}" varStatus="status">
			line[${status.index}] = ${list.get(status.index).rentCnt};
		</c:forEach>
		
		  plot = $.jqplot('car_chart', [line], {
		    stackSeries: true,
		    captureRightClick: true,
		    seriesDefaults:{
		      renderer:$.jqplot.BarRenderer,
		      rendererOptions: {
		          barMargin: 30,
		          highlightMouseDown: true    
		      },
		      pointLabels: {show: true}
		    },
		    axes: {
		      xaxis: {
		          renderer: $.jqplot.CategoryAxisRenderer
		      },
		      yaxis: {
		        padMin: 0
		      }
		    },
		    legend: {
		      show: true,
		      location: 'e',
		      placement: 'outside'
		    }      
		  });
		  $('#car_chart').bind('jqplotDataClick', 
		    function (ev, seriesIndex, pointIndex, data) {
		     // $('#info').html('series: '+seriesIndex+', point: '+pointIndex+', data: '+data);
		    }
		  ); 
		})
		
		//라인그래프
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
	        },
	        width: 490,
	        height: 350,
	        axes: {
	          x: {
	            0: {side: 'top'}
	          }
	        }
	      };

	      var chart = new google.charts.Line(document.getElementById('line_chart'));

	      chart.draw(data, google.charts.Line.convertOptions(options));
	    }
	</script>
</body>
</html>