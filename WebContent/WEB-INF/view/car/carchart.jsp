<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/css/common.css?a" rel="stylesheet"  type="text/css">
<style>
	#chart{
		width:900px;
		height: 300px;
	}
</style>
</head>
<body>
	<div id="container">
		<header>
			<jsp:include page="../header.jsp"></jsp:include>
		</header>
		
		<section>
			<h1>차트</h1>
			<span id="info">차량 별 렌트 수</span>
			<div id="chart"></div>
			
			<span id="info3">예제.</span>
			<div id="chart3" style="width:400px; height:300px;"></div>
		</section>
	</div>
	
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
<script class="include" type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.jqplot.min.js"></script>
<script class="include" language="javascript" type="text/javascript" src="${pageContext.request.contextPath }/js/jqplot.barRenderer.min.js"></script>
<script class="include" language="javascript" type="text/javascript" src="${pageContext.request.contextPath }/js/jqplot.categoryAxisRenderer.min.js"></script>
<script class="include" language="javascript" type="text/javascript" src="${pageContext.request.contextPath }/js/jqplot.pointLabels.min.js"></script>
<script>
	$(function(){
		var s1 = [2, 6, 7, 10];
		  var s2 = [7, 5, 3, 4];
		  var s3 = [14, 9, 3, 8];
		  plot3 = $.jqplot('chart3', [s1, s2, s3], {
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
		  $('#chart3').bind('jqplotDataClick', 
		    function (ev, seriesIndex, pointIndex, data) {
		      $('#info3').html('series: '+seriesIndex+', point: '+pointIndex+', data: '+data);
		    }
		  ); 
	  
		  var line = new Array;
		  for(var i=0;i<"${list.size()}";i++){
			  line[i] = "${list.get(i).rentCnt}"
		  }
		  
		  plot = $.jqplot('chart', ["${line}"], {
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
		  $('#chart').bind('jqplotDataClick', 
		    function (ev, seriesIndex, pointIndex, data) {
		      $('#info').html('series: '+seriesIndex+', point: '+pointIndex+', data: '+data);
		    }
		  ); 
	})
</script>
</body>
</html>