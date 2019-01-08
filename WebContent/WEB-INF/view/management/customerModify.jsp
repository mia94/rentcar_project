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
         <label>이름</label>
         <input type="text" name="name"> 
        
      </p>
      <p>
         <label>아이디</label>
         <input type="text" name="id" > 
       
      </p>
     
      
       <p>
         <label>생년월일</label>
       	 <input type="text" id="datepicker" name="dob" class="format">
       
      </p>
      
  <p>
         <label>전화번호</label>
        <select name="phone">
        	<!-- <option selected="selected" value="opt">선택하세요</option> -->
        	<option value="010">010</option>
        	<option value="011">011</option>
        	<option value="017">017</option>
        </select>
      - <input type="text" name="phone2"> - <input type="text" name="phone3">
        
      </p>
       <p>
         <label>이메일</label>
         <input type="text"> @
        <select name="email">
        	<!-- <option value="a">선택하세요</option> -->
        	<option value="naver">naver.com</option>
        	<option value="gmail">gmail.com</option>
        	<option value="daum">daum.net</option>
        	<option value="nate">nate.com</option>
        </select>
      </p>
      
      <p>
       <label>우편번호</label>
      <input type="text" name="zipcode">
      <input type="button" value="우편번호 검색" name="post" id="BtnPost">
      </p>
      
      <p>
       <label>주소</label>   
      	<input type="text" name="address">
      </p>
      
	 <p>
	  <label>면허종류</label>
	 	<select name="license">
	 		<!-- <option>선택하세요</option> -->
	 		<option value="1종보통">1종보통</option>
	 		<option value="2종보통">2종보통</option>
		 </section>
		 
		 <p>
         <label>현재 비밀번호</label>
         <input type="password" name="password"> 
       
      </p>
      <p>
         <label>새비밀번호</label>
         <input type="password" name="password"> 
       
      </p>
      <p>
         <label>비밀번호 확인</label>
         <input type="password" name="confirmPassword"> 
         
      </p>
        <p>  
         <input type="submit" value="회원정보수장"> 
      </p>
   </form>
		 
	</div>
	
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
</html>