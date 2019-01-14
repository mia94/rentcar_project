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
		height: 400px;
		margin: 50px auto;
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
	  /*반복문으로 바꿔야함ㅠㅠ*/
		var line = new Array;
		line[0] = "${list.get(0).rentCnt}"
		line[1] = "${list.get(1).rentCnt}"
		line[2] = "${list.get(2).rentCnt}"
		line[3] = "${list.get(3).rentCnt}"
		line[4] = "${list.get(4).rentCnt}"	
		line[5] = "${list.get(5).rentCnt}"
		line[6] = "${list.get(6).rentCnt}"
		line[7] = "${list.get(7).rentCnt}"
		line[8] = "${list.get(8).rentCnt}"
		line[9] = "${list.get(9).rentCnt}"
		line[10] = "${list.get(10).rentCnt}"
		line[11] = "${list.get(11).rentCnt}"
		line[12] = "${list.get(12).rentCnt}"
		line[13] = "${list.get(13).rentCnt}"
		line[14] = "${list.get(14).rentCnt}"	
		line[15] = "${list.get(15).rentCnt}"
		line[16] = "${list.get(16).rentCnt}"
		line[17] = "${list.get(17).rentCnt}"
		line[18] = "${list.get(18).rentCnt}"
		line[19] = "${list.get(19).rentCnt}"
		line[20] = "${list.get(20).rentCnt}"
		line[21] = "${list.get(21).rentCnt}"
		line[22] = "${list.get(22).rentCnt}"
		line[23] = "${list.get(23).rentCnt}"
		line[24] = "${list.get(24).rentCnt}"	
		line[25] = "${list.get(25).rentCnt}"
		line[26] = "${list.get(26).rentCnt}"
		line[27] = "${list.get(27).rentCnt}"
		line[28] = "${list.get(28).rentCnt}"
		line[29] = "${list.get(29).rentCnt}"
		line[30] = "${list.get(30).rentCnt}"
		line[31] = "${list.get(31).rentCnt}"
		line[32] = "${list.get(32).rentCnt}"
		line[33] = "${list.get(33).rentCnt}"
		line[34] = "${list.get(34).rentCnt}"	

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
		      $('#info').html('series: '+seriesIndex+', point: '+pointIndex+', data: '+data);
		    }
		  ); 
	})
</script>
</body>
</html>