$(function(){
	
	//rentStepOne.jsp에 있는 예약버튼
	$(".btnRentBook").click(function(){
		//버튼이 가지고 있는 속성값을 가지고 온다.
		var carCode = $(this).attr("data-carCode");
		var basicPrice = $(this).attr("data-basicPrice");
		var carName = $(this).attr("data-carName");
		//input에 value값을 위에 버튼이 가지고 있는 속성값으로 바꾼다.
		$("#carCode").val(carCode);
		$("#carName").val(carName);
		$("#basicPrice").val(basicPrice);
		
		$("#stepOne").submit();
		
	})
	
	//숫자에 , 붙이기
	function numWithCommas(num){
		return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	//rentStepTwp.jsp
	//차량 옵션 계산하기
	$(".optionChk").click(function(){
		var i = $(".price").text().trim();
		i = i.replace(",", "").replace(",", "");
		var sum = parseInt(i);
		var optPrice = 0;
		
		$(".optionChk:checked").each(function(i, obj) {
			optPrice += Number( $(obj).val() );	
			sum += Number( $(obj).val() );
		})
	
		$("#optionPrice").html(numWithCommas(optPrice));
		$("#totalPrice").html(numWithCommas(sum));
	})
	

	// 보험
	$("input:radio[name='rdIns']").click(function() {
		var i = $(".price").text().trim();
		i = i.replace(",", "").replace(",", "");
		var sum = parseInt(i);
		var insurancePrice = 0;
		
		$("input:radio[name='rdIns']:checked").each(function(i, obj) {
			insurancePrice = Number($(obj).val());
			sum += Number( $(obj).val() );
		})
		
		$("#insurancePrice").html(numWithCommas(insurancePrice));
		$("#totalPrice").html(numWithCommas(sum));
	})
	
	//회원할인
	$("input:radio[name='discount']").click(function(){
		var value = $("input:radio[name='discount']:checked").val();	//선택된 라디오버튼의 값
		var res = Number( $("input:radio[name='discount']").val() );	//회원 할인율 값
		
		//기본금액
		var i = $(".price").text().trim();
		i = i.replace(",", "").replace(",", "");
		var sum = parseInt(i);
		
		if(value == res){	//회원 할인 선택시
			$("select[name='selEvt']").prop('disabled', true);	//select 박스 선택X
			sum = - ( sum * res) / 100;	//기본 대여 금액에서만 적용
			
			$("#discountPrice").html(numWithCommas(sum));
			
		} else{	//이벤트 선택 시
			$("select[name='selEvt']").prop('disabled', false);
		}
		
		
		console.log(value);
	})
	

})