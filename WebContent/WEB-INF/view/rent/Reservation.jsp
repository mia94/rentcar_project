<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<style>
@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR');
	
	*{
		font-family: 'Noto Sans KR', sans-serif;
	}
	
	/* 전체를 감싸는 div */
	div#date_container{
		margin: 20px auto;
		width: 1000px;
		overflow: hidden;
	}
	
	/* 대여일 선택 */
	div#choose_rent_start{
		float: left;
	}
	
	input#start_date{
		width: 140px;
		height: 31px;
		padding: 10px;
		font-family: inherit;
		font-size: 16px;
	}
	
	/* 셀렉트 메뉴 */

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function(){
		$("#start_date").datepicker({minDate: 0, maxDate: "+2M"});
		$("#start_date").datepicker("option", "dateFormat", "yy-mm-dd");
		
	})
</script>
</head>
<body>
		<div id="date_container">
			<h2>기간 선택</h2>
			<div id="choose_rent_start">
				<input type="text" id="start_date" placeholder="대여일 선택" readonly>
			</div>
			
			<!-- 대여 시간 -->
			
			
		</div>


</body>
</html>