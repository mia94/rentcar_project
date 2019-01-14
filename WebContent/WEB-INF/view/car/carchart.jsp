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
		width:600px;
		height: 300px;
	}
</style>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
<%-- <script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/js/jquery.jqplot.min.js"></script>
<script src="${pageContext.request.contextPath }/js/jqplot.barRenderer.js"></script>
<script src="${pageContext.request.contextPath }/js/jqplot.pointLabels.js"></script>
<script src="${pageContext.request.contextPath }/js/jqplot.categoryAxisRenderer.js"></script> --%>
<script class="include" type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
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
		    // Tell the plot to stack the bars.
		    stackSeries: true,
		    captureRightClick: true,
		    seriesDefaults:{
		      renderer:$.jqplot.BarRenderer,
		      rendererOptions: {
		          // Put a 30 pixel margin between bars.
		          barMargin: 30,
		          // Highlight bars when mouse button pressed.
		          // Disables default highlighting on mouse over.
		          highlightMouseDown: true    
		      },
		      pointLabels: {show: true}
		    },
		    axes: {
		      xaxis: {
		          renderer: $.jqplot.CategoryAxisRenderer
		      },
		      yaxis: {
		        // Don't pad out the bottom of the data range.  By default,
		        // axes scaled as if data extended 10% above and below the
		        // actual range to prevent data points right on grid boundaries.
		        // Don't want to do that here.
		        padMin: 0
		      }
		    },
		    legend: {
		      show: true,
		      location: 'e',
		      placement: 'outside'
		    }      
		  });
		  // Bind a listener to the "jqplotDataClick" event.  Here, simply change
		  // the text of the info3 element to show what series and ponit were
		  // clicked along with the data for that point.
		  $('#chart3').bind('jqplotDataClick', 
		    function (ev, seriesIndex, pointIndex, data) {
		      $('#info3').html('series: '+seriesIndex+', point: '+pointIndex+', data: '+data);
		    }
		  ); 
	})
</script>
</head>
<body>
	<span id="info3">Nothing yet.</span>
	<div id="chart3" style="width:400px; height:300px;"></div>

	<div id="container">
		<header>
			<jsp:include page="../header.jsp"></jsp:include>
		</header>
		
		<section>
			<h1>차트</h1>
			<div id="chart">
			
			</div>
		</section>
	</div>
	
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
</html>