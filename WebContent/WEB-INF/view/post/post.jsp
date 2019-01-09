<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<title>Insert title here</title>
<style type="text/css">
	table{
		border-collapse: collapse;
		margin: 10px;
	}
	tr,td {
	padding:5px;
	border: 1px solid black;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script type="text/javascript">
	$(function () {
	     $("#btnPost").click(function() {
	    	var sido = $("#sido").val();
	    	var doro = $("#doro").val();
	    	 
	         $.ajax({
	            url:"post.do",
	            type:"post",
	            data:{"sido":sido, "doro":doro},
	            dataType:"json",
	            success:function(json){
	            	console.log(json);
	            	 $("#table").append("<tr>")
	       			 $("#table").append("<td>"+"우편번호"+"</td>")
	       			 $("#table").append("<td>"+"주소"+"</td>")
	       			 $("#table").append("</tr>")
	          $(json).each(function(index,obj){
	   
	        	   var i = 0;
	        	  if(obj.building2==0){
	        		  i="";
	        	  }else{
	        		  i="-"+obj.building2;
	        	  }
	        	  $("#table").append("<tr>")
	        	   $("#table").append("<td>"+obj.zipcode +"</td>")
	        	  $("#table").append("<td>" + obj.sido +" "+ obj.sigungu +" "+ obj.eupmyeon +" "+ obj.doro +" "+ obj.building1 +" "+ i + "</td>")
	        	   $("#table").append("</tr>")
               })
	            	
	            }
	         })
	         
	      })
	      
	})
</script>
</head>
<body>
	시도
	<select name="sido" id="sido">
		<option>강원도</option>
		<option>경기도</option>
		<option>경상남도</option>
		<option>경상북도</option>
		<option>광주광역시</option>
		<option>대구광역시</option>
		<option>대전광역시</option>
		<option>부산광역시</option>
		<option>서울특별시</option>
		<option>세종특별자치시</option>
		<option>울산광역시</option>
		<option>전라남도</option>
		<option>전라북도</option>
		<option>제주특별자치도</option>
		<option>충청남도</option>
		<option>충청북도</option>
	</select> 도로명
	<input type="text" name="doro" id="doro">
	<input type="button" value="검색" id="btnPost">


	<table id="table">
		
	</table>

</body>
</html>