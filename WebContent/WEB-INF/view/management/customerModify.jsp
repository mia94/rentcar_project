<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
  
<link href="${pageContext.request.contextPath }/css/common.css" rel="stylesheet"  type="text/css">
<style type="text/css">

</style>
</head>
<body>
	<div id="container">
		<header>
			<jsp:include page="../header.jsp"></jsp:include>
		</header>
		
		<section>
		<form action=".do" method="post" id="f1">
      <p>
         <label>�̸�</label>
         <input type="text" name="name"> 
        
      </p>
      <p>
         <label>���̵�</label>
         <input type="text" name="id" > 
       
      </p>
     
      
       <p>
         <label>�������</label>
       	 <input type="text" id="datepicker" name="dob" class="format">
       
      </p>
      
  <p>
         <label>��ȭ��ȣ</label>
        <select name="phone">
        	<!-- <option selected="selected" value="opt">�����ϼ���</option> -->
        	<option value="010">010</option>
        	<option value="011">011</option>
        	<option value="017">017</option>
        </select>
      - <input type="text" name="phone2"> - <input type="text" name="phone3">
        
      </p>
       <p>
         <label>�̸���</label>
         <input type="text"> @
        <select name="email">
        	<!-- <option value="a">�����ϼ���</option> -->
        	<option value="naver">naver.com</option>
        	<option value="gmail">gmail.com</option>
        	<option value="daum">daum.net</option>
        	<option value="nate">nate.com</option>
        </select>
      </p>
      
      <p>
       <label>�����ȣ</label>
      <input type="text" name="zipcode">
      <input type="button" value="�����ȣ �˻�" name="post" id="BtnPost">
      </p>
      
      <p>
       <label>�ּ�</label>   
      	<input type="text" name="address">
      </p>
      
	 <p>
	  <label>��������</label>
	 	<select name="license">
	 		<!-- <option>�����ϼ���</option> -->
	 		<option value="1������">1������</option>
	 		<option value="2������">2������</option>
		 </section>
		 
		 <p>
         <label>���� ��й�ȣ</label>
         <input type="password" name="password"> 
       
      </p>
      <p>
         <label>����й�ȣ</label>
         <input type="password" name="password"> 
       
      </p>
      <p>
         <label>��й�ȣ Ȯ��</label>
         <input type="password" name="confirmPassword"> 
         
      </p>
        <p>  
         <input type="submit" value="ȸ����������"> 
      </p>
   </form>
		 
	</div>
	
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
</html>