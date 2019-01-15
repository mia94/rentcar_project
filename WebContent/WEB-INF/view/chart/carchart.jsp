<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/css/common.css?aaa" rel="stylesheet"  type="text/css">
<style>
	#chart_wrap{
		width:1000px;
		margin: 50px auto; 
		height: 600px;
		position: relative;
	}
	#chart{
		width:800px;
		height: 400px;
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
<script class="include" type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.jqplot.min.js"></script>
<script class="include" language="javascript" type="text/javascript" src="${pageContext.request.contextPath }/js/jqplot.barRenderer.min.js"></script>
<script class="include" language="javascript" type="text/javascript" src="${pageContext.request.contextPath }/js/jqplot.categoryAxisRenderer.min.js"></script>
<script class="include" language="javascript" type="text/javascript" src="${pageContext.request.contextPath }/js/jqplot.pointLabels.min.js"></script>
<script>
	$(function(){

		var line = new Array();

		<c:forEach var="item" items="${list}" varStatus="status">
			line[${status.index}] = ${list.get(status.index).rentCnt};
		</c:forEach>
		
		  plot = $.jqplot('chart', [line], {
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
		     // $('#info').html('series: '+seriesIndex+', point: '+pointIndex+', data: '+data);
		    }
		  ); 
	})
</script>
</body>
</html>