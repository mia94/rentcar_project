<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/css/common.css" rel="stylesheet"  type="text/css">
</head>
<body>
<div id="container">
		<header>
			<jsp:include page="../admin.jsp"></jsp:include>
		</header>
		
		<section>
			<div id="modify_wrap">
			<h1>직원 수정 창</h1>
				<div id="input_wrap">
					<div id="img_wrap">img</div>
					<form action="employeeModify.do" method="post">
						<p>
							<label>직원 코드</label>
							<input type="text" name="code" class="textfield" readonly value="${employee.code }">
						</p>
						<p>
							<label>직원 이름</label>
							<input type="text" name="name" class="textfield" value="${employee.name }">
						</p>
						<p>
							<label>직원연락처</label>
       
         <c:set var='phone1' value="${fn:substring(employee.phone,0, 3) }"></c:set>
	        <select name="phone">
	        	<!-- <option value="opt">선택하세요</option> -->
	        	
	        	<option value="010" ${phone1=='010'?'selected':''}>010</option>
	        	<option value="011" ${phone1=='011'?'selected':''}>011</option>
	        	<option value="017" ${phone1=='017'?'selected':''}>017</option>
	        </select>
	      - <input type="text" name="phone2" value="${fn:substring(employee.phone,4,4+fn:indexOf(fn:substringAfter(employee.phone,'-'),'-')) }"> - <input type="text" name="phone3" value="${fn:substring(employee.phone,9,13) }">
     	 </p>
				
						<p>
							<label>직원 비밀번호</label>
							<input type="password" name="password" class="textfield" value="${employee.passwd }">
						</p>
	
						<div id="btn_wrap">
							<input type="submit" value="저장">
							<input type="reset" value="취소">
						</div>
					</form>	
				</div>
			</div>
		</section>
	</div>
	
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
</body>
</html>