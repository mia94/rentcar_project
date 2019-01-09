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
	       			 $("#table").append("<td>"+"�����ȣ"+"</td>")
	       			 $("#table").append("<td>"+"�ּ�"+"</td>")
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
	�õ�
	<select name="sido" id="sido">
		<option>������</option>
		<option>��⵵</option>
		<option>��󳲵�</option>
		<option>���ϵ�</option>
		<option>���ֱ�����</option>
		<option>�뱸������</option>
		<option>����������</option>
		<option>�λ걤����</option>
		<option>����Ư����</option>
		<option>����Ư����ġ��</option>
		<option>��걤����</option>
		<option>���󳲵�</option>
		<option>����ϵ�</option>
		<option>����Ư����ġ��</option>
		<option>��û����</option>
		<option>��û�ϵ�</option>
	</select> ���θ�
	<input type="text" name="doro" id="doro">
	<input type="button" value="�˻�" id="btnPost">


	<table id="table">
		
	</table>

</body>
</html>