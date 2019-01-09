$(function() {
	// 날짜선택(Datepicker)
	$("#start_date").datepicker({
		minDate : 0,
		maxDate : "+2M"
	});
	$("#start_date").datepicker("option", "dateFormat", "yy-mm-dd");
	$("#end_date").datepicker({
		minDate : 1,
		maxDate : "+2M 15D"
	});
	$("#end_date").datepicker("option", "dateFormat", "yy-mm-dd");

	// 셀렉트메뉴1(대여 시간)
	var $default = $(".defaultTitle");
	var $current = $(".selectbox");
	var $currentLi = $(".selectbox li");

	// 셀렉트메뉴2(대여 분)
	var $defaultM = $(".defaultTitleMinute");
	var $currentM = $(".selectboxMinute");
	var $currentMLi = $(".selectboxMinute li");

	// 셀렉트메뉴3(반납 시간)
	var $rDefault = $(".defaultTitle2");
	var $rCurrent = $(".selectbox2");
	var $rCurrentLi = $(".selectbox2 li");

	// 셀렉트메뉴4(반납 분)
	var $rDefaultM = $(".defaultTitleMinute2");
	var $rCurrentM = $(".selectboxMinute2");
	var $rCurrentMLi = $(".selectboxMinute2 li");

	// 대여 시간선택 셀렉트메뉴
	$default.on('click', function() {
		$currentM.hide(); // 시간선택 클릭했을 때 분 선택 리스트가 안보이게 한다.
		$rCurrent.hide();
		$rCurrentM.hide();

		$current.toggle(); // 시간선택 toggle로 시간 선택 리스트가 보이다가 안보이게 처리함.
	})

	if ($current) {
		if (!$currentLi.hasClass("selected")) {
			$currentLi.first().addClass("selected");
		}

		$currentLi.click(function(e) {
			var index = parseInt($(this).index()) + 1;

			$(".defaultTitle").text($(this).text());
			$(e.currentTarget).addClass("selected").siblings().removeClass(
					"selected");
			$current.hide();
		})
	}

	// 대여 분 선택 셀렉트메뉴
	$defaultM.on('click', function() {
		$current.hide(); // 분 선택 클릭했을 때 시간 선택 리스트가 안보이게 한다.
		$rCurrent.hide();
		$rCurrentM.hide();

		$currentM.toggle();
	})

	if ($currentM) {
		if (!$currentMLi.hasClass("selected")) {
			$currentMLi.first().addClass("selected");
		}

		$currentMLi.click(function(e) {
			var index = parseInt($(this).index()) + 1;

			$(".defaultTitleMinute").text($(this).text());
			$(e.currentTarget).addClass("selected").siblings().removeClass(
					"selected");
			$currentM.hide();

		})
	}

	// 반납 시간선택 셀렉트메뉴
	$rDefault.on('click', function() {
		$rCurrentM.hide(); // 시간선택 클릭했을 때 분 선택 리스트가 안보이게 한다.
		$current.hide();
		$currentM.hide();

		$rCurrent.toggle(); // 시간선택 toggle로 시간 선택 리스트가 보이다가 안보이게 처리함.
	})

	if ($rCurrent) {
		if (!$rCurrentLi.hasClass("selected")) {
			$rCurrentLi.first().addClass("selected");
		}

		$rCurrentLi.click(function(e) {
			var index = parseInt($(this).index()) + 1;

			$(".defaultTitle2").text($(this).text());
			$(e.currentTarget).addClass("selected").siblings().removeClass(
					"selected");
			$rCurrent.hide();
		})
	}

	// 반납 분 선택 셀렉트메뉴
	$rDefaultM.on('click', function() {
		$rCurrent.hide(); // 분 선택 클릭했을 때 시간 선택 리스트가 안보이게 한다.
		$current.hide();
		$currentM.hide();

		$rCurrentM.toggle();
	})

	if ($rCurrentM) {
		if (!$rCurrentMLi.hasClass("selected")) {
			$rCurrentMLi.first().addClass("selected");
		}

		$rCurrentMLi.click(function(e) {
			var index = parseInt($(this).index()) + 1;

			$(".defaultTitleMinute2").text($(this).text());
			$(e.currentTarget).addClass("selected").siblings().removeClass(
					"selected");
			$rCurrentM.hide();

		})
	}

	// 계산하기 버튼
	$("#calRentDate").click(function() {
		// input에 있는 값 받아오기
		var start = $("#start_date").val(); // 나오는 방식 : 2019-01-01(String)
		var end = $("#end_date").val();

		// ==== 대여시간 ====
		var divStartHour = $(".defaultTitle").text();
		var divStartMin = $(".defaultTitleMinute").text();
		
		// ==== 반납시간 ====
		var divEndHour = $(".defaultTitle2").text();
		var divEndMin = $(".defaultTitleMinute2").text();

		
		// input에 있는 String -> Date로 바꾸기
		//new Date(연, 월, 일, 시, 분, 초, 밀리초)
		var startDate = new Date(start.substr(0, 4), start.substr(5, 2) - 1, start.substr(8, 2), divStartHour.substr(0, 2), divStartMin.substr(0, 2));
		var endDate = new Date(end.substr(0, 4), end.substr(5, 2) - 1, end.substr(8, 2), divEndHour.substr(0, 2), divEndMin.substr(0, 2));

		
		// 반납일자 - 대여일자 차이 구하기
		var diff = endDate.getTime() - startDate.getTime();
		var resultDay = Math.floor(diff / (1000 * 60 * 60 * 24));

		//대여일자, 반납일자 값이 비어져있을 경우
		if (start == null | start == "") {
			alert("대여일자를 선택해주세요.");
		}
		if (end == null | end == "") {
			alert("반납일자를 선택해주세요.");
		}

		//대여일자, 반납일자 모두 값이 있으면
		if (end != "" && start != "" && divStartHour != "시간 선택" && divStartMin != "분 선택" && divStartHour != "시간 선택" && divStartMin != "분 선택") {
			console.log(resultDay);
			$("#diff").text(resultDay);
		}
		
		if(resultDay <= 0){
			alert("대여기간은 최소 1일입니다.");
		}
	
	})

})