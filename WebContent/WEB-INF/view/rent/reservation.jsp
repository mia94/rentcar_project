<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<link href="${pageContext.request.contextPath }/css/common.css" rel="stylesheet"  type="text/css">
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
	
	/* 반납일 선택 */
	div#choose_rent_end{
		float: left;
		margin-left: 50px;
	}
	
	input#start_date, input#end_date{
		width: 140px;
		height: 31px;
		padding: 10px;
		font-family: inherit;
		font-size: 16px;
	}
	
	/* 셀렉트 메뉴 */
	div.selectWrap, div.selectWrapMinute, div.selectWrap2, div.selectWrapMinute2{
		width: 100px;
		overflow: hidden;
		border: 1px solid #ccc;
		padding: 0px;
		margin: 0px;
		float: left;
	}
	
	div.defaultTitle, div.defaultTitleMinute, div.defaultTitle2, div.defaultTitleMinute2{
		width: 90px;
		float: left;
		height: 53px;
		line-height: 53px;
		padding-left: 10px;
	}
	
	div.selectWrap ul, div.selectWrap2 ul{
		margin: 0;
		padding: 5px;
		width: 90px;
		height: 140px;
		list-style: none;
		overflow: auto;
		border-top: 1px solid #ccc;
		display: none;
	}
	
	div.selectWrapMinute ul, div.selectWrapMinute2 ul{
		margin: 0;
		padding: 5px;
		width: 90px;
		height: 75px;
		list-style: none;
		overflow: auto;
		border-top: 1px solid #ccc;
		display: none;
	}
	
	div.selectWrap ul li, div.selectWrapMinute ul li, div.selectWrap2 ul li, div.selectWrapMinute2 ul li{
		background-color: none;
		width: 50%;
		padding: 5px 3px 8px 5px;
	}
	
	div.selectWrap ul li a, div.selectWrapMinute ul li a, div.selectWrap2 ul li a, div.selectWrapMinute2 ul li a{
		text-decoration: none;
		color: black;
	}
		
	div.selectWrap ul li a:hover, div.selectWrapMinute ul li a:hover, div.selectWrap2 ul li a:hover, div.selectWrapMinute2 ul li a:hover{
		color: red;
	}
</style>

</head>
<body>
<div id="container">
	    <header>
			<jsp:include page="../header.jsp"></jsp:include>
		</header>
		
		<section>
			<div id="date_container">
				<h2>기간 선택</h2>
				<!-- 대여일 선택 -->
				<div id="choose_rent_start">
					<input type="text" id="start_date" placeholder="대여일 선택" readonly>
				</div>
				
				<!-- 대여 시간 -->
				<div class="selectWrap">
					<div class="defaultTitle">시간 선택</div>
					<ul class="selectbox">
						<li><a href="#">09시</a></li>
						<li><a href="#">10시</a></li>
						<li><a href="#">11시</a></li>
						<li><a href="#">12시</a></li>
						<li><a href="#">13시</a></li>
						<li><a href="#">14시</a></li>
						<li><a href="#">15시</a></li>
						<li><a href="#">16시</a></li>
						<li><a href="#">17시</a></li>
						<li><a href="#">18시</a></li>
						<li><a href="#">19시</a></li>
						<li><a href="#">20시</a></li>
					</ul>
				</div>
				
				<!-- 대여 분 -->
				<div class="selectWrapMinute">
					<div class="defaultTitleMinute">분 선택</div>
					<ul class="selectboxMinute">
						<li><a href="#">00분</a></li>
						<li><a href="#">30분</a></li>
					</ul>
				</div>
				
				<!-- 반납일 선택 -->
				<div id="choose_rent_end">
					<input type="text" id="end_date" placeholder="반납일 선택" readonly>
				</div>
				
				<!-- 반납 시간 -->
				<div class="selectWrap2">
					<div class="defaultTitle2">시간 선택</div>
					<ul class="selectbox2">
						<li><a href="#">09시</a></li>
						<li><a href="#">10시</a></li>
						<li><a href="#">11시</a></li>
						<li><a href="#">12시</a></li>
						<li><a href="#">13시</a></li>
						<li><a href="#">14시</a></li>
						<li><a href="#">15시</a></li>
						<li><a href="#">16시</a></li>
						<li><a href="#">17시</a></li>
						<li><a href="#">18시</a></li>
						<li><a href="#">19시</a></li>
						<li><a href="#">20시</a></li>
					</ul>
				</div>
				
				<!-- 반납 분 -->
				<div class="selectWrapMinute2">
					<div class="defaultTitleMinute2">분 선택</div>
					<ul class="selectboxMinute2">
						<li><a href="#">00분</a></li>
						<li><a href="#">30분</a></li>
					</ul>
				</div>
			</div>

		</section>
		
	</div>
	
	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
	$(function(){
		//날짜선택(Datepicker)
		$("#start_date").datepicker({minDate: 0, maxDate: "+2M"});
		$("#start_date").datepicker("option", "dateFormat", "yy-mm-dd");
		$("#end_date").datepicker({minDate: 1, maxDate: "+2M 15D"});
		$("#end_date").datepicker("option", "dateFormat", "yy-mm-dd");
		
		//셀렉트메뉴1(대여 시간)
		var $default = $(".defaultTitle");
		var $current = $(".selectbox");
		var $currentLi = $(".selectbox li");
		//셀렉트메뉴2(대여 분)
		var $defaultM = $(".defaultTitleMinute");
		var $currentM = $(".selectboxMinute");
		var $currentMLi = $(".selectboxMinute li");
		//셀렉트메뉴3(반납 시간)
		var $rDefault = $(".defaultTitle2");
		var $rCurrent = $(".selectbox2");
		var $rCurrentLi = $(".selectbox2 li");
		//셀렉트메뉴4(반납 분)
		var $rDefaultM = $(".defaultTitleMinute2");
		var $rCurrentM = $(".selectboxMinute2");
		var $rCurrentMLi = $(".selectboxMinute2 li");
		
		//대여 시간선택 셀렉트메뉴
		$default.on('click', function(){
			$currentM.hide();	//시간선택 클릭했을 때 분 선택 리스트가 안보이게 한다.
			$rCurrent.hide();
			$rCurrentM.hide();
			
			$current.toggle();	//시간선택 toggle로 시간 선택 리스트가 보이다가 안보이게 처리함.
		})
		
		if($current){			
			if(!$currentLi.hasClass("selected")){
				$currentLi.first().addClass("selected");
			}
			
			$currentLi.click(function(e){
				var index = parseInt($(this).index()) + 1;
				
				$(".defaultTitle").text($(this).text());
				$(e.currentTarget).addClass("selected").siblings().removeClass("selected");
				$current.hide();
			})
		}

		//대여 분 선택 셀렉트메뉴
		$defaultM.on('click', function(){
			$current.hide();	//분 선택 클릭했을 때 시간 선택 리스트가 안보이게 한다.
			$rCurrent.hide();
			$rCurrentM.hide();
			
			$currentM.toggle();
		})
				
		if($currentM){
			if(!$currentMLi.hasClass("selected")){
				$currentMLi.first().addClass("selected");
			}
			
			$currentMLi.click(function(e){
				var index = parseInt($(this).index()) + 1;
				
				$(".defaultTitleMinute").text($(this).text());
				$(e.currentTarget).addClass("selected").siblings().removeClass("selected");
				$currentM.hide();
				
			})
		}
		
		//반납 시간선택 셀렉트메뉴
		$rDefault.on('click', function(){
			$rCurrentM.hide();	//시간선택 클릭했을 때 분 선택 리스트가 안보이게 한다.
			$current.hide();
			$currentM.hide();
			
			$rCurrent.toggle();	//시간선택 toggle로 시간 선택 리스트가 보이다가 안보이게 처리함.
		})
		
		if($rCurrent){			
			if(!$rCurrentLi.hasClass("selected")){
				$rCurrentLi.first().addClass("selected");
			}
			
			$rCurrentLi.click(function(e){
				var index = parseInt($(this).index()) + 1;
				
				$(".defaultTitle2").text($(this).text());
				$(e.currentTarget).addClass("selected").siblings().removeClass("selected");
				$rCurrent.hide();
			})
		}
		
		//반납 분 선택 셀렉트메뉴
		$rDefaultM.on('click', function(){
			$rCurrent.hide();	//분 선택 클릭했을 때 시간 선택 리스트가 안보이게 한다.
			$current.hide();
			$currentM.hide();
			
			$rCurrentM.toggle();
		})
		
		if($rCurrentM){
			if(!$rCurrentMLi.hasClass("selected")){
				$rCurrentMLi.first().addClass("selected");
			}
			
			$rCurrentMLi.click(function(e){
				var index = parseInt($(this).index()) + 1;
				
				$(".defaultTitleMinute2").text($(this).text());
				$(e.currentTarget).addClass("selected").siblings().removeClass("selected");
				$rCurrentM.hide();
				
			})
		}

	})
</script>
</body>
</html>