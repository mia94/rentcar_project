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
	
	//rentStepTwo.jsp에 있는 다음 버튼
	$("#btnNext").click(function(){
		var price = $(".price").text().trim();
		price = parseInt(price.replace(",", "").replace(",", ""));
		var discount = $("#discountPrice").text();
		var ins = $("#insurancePrice").text();
		var opt = $("#optionPrice").text();
		var total = $("#totalPrice").text();
		
		$("#basicPrice").val(price);
		$("#dPrice").val(discount);
		$("#iPrice").val(ins);
		$("#carOptPrice").val(opt);
		$("#totalRentPrice").val(total);
		
		$("#stepTwo").submit();
	})
	
	//rentStepThree.jsp에 있는 예약 버튼
	$("#btnBook").click(function(){
		//체크 박스 체크 해야 다음 페이지로 넘어가게 한다.
		if( $("#agree").prop('checked') == true ){
			alert("체크했습니다.");
		} else{
			alert("이용약관 동의에 체크해주세요.");
		}
	})
	
	//숫자에 , 붙이기
	function numWithCommas(num){
		return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	//최종 금액 계산하기
	function resultPrice(){		
		//차량 대여 금액
		var i = $(".price").text().trim();
		i = i.replace(",", "").replace(",", "");
		var sum = parseInt(i);
		
		//================================= 할인
		var value = $("input:radio[name='discount']:checked").val();	//선택된 라디오버튼의 값
		var res = Number( $("input:radio[name='discount']").val() );	//회원 할인율 값
		
		//기본금액
		var sale = 0;

		if(value == res){	//회원 할인 선택시
			// == 할인된 금액
			sale = - ( sum * res ) / 100;	//할인금액 => 기본 대여 금액에서만 적용
			$("#discountPrice").html(numWithCommas(sale));
			
		} else{	//이벤트 선택 시
			sale = 0;
			$("#discountPrice").html(numWithCommas(sale));
			$("select[name='selEvt']").prop('disabled', false);
			
			// ===================================
			//select에 있는 option 값 가져오기
			if($("#selEvt").val() == "선택"){
				sale = 0;
				$("#discountPrice").html(numWithCommas(sale));
			}
			if($("#selEvt").val() == 3){
				var rate = $("#selEvt").val();
				sale = - ( sum * rate ) / 100;
					
				$("#discountPrice").html(numWithCommas(sale));
			}
			if($("#selEvt").val() == 5){
				var rate = $("#selEvt").val();
				sale = - ( sum * rate ) / 100;
					
				$("#discountPrice").html(numWithCommas(sale));
			}
			// ===============================		
		}
		//sum에 할인 금액 더하기
		sum += sale;
		
		//================================= 차량 옵션
		var optPrice = 0;
		
		$(".optionChk:checked").each(function(i, obj) {
			optPrice += Number( $(obj).val() );	
			sum += Number( $(obj).val() );
		})
		
		//================================= 보험
		var insurancePrice = 0;
		
		$("input:radio[name='rdIns']:checked").each(function(i, obj) {
			insurancePrice = Number($(obj).val());
			sum += Number( $(obj).val() );
		})
		
		//================================= 화면에 디스플레이 될 부분
		$("#insurancePrice").html(numWithCommas(insurancePrice));		
		$("#optionPrice").html(numWithCommas(optPrice));		
		$("#totalPrice").html(numWithCommas(sum));
	}
	
	
	//차량 옵션 계산하기
	$(".optionChk").click(function(){
		resultPrice();
	})

	// 보험
	$("input:radio[name='rdIns']").click(function() {
		resultPrice();
	})
	
	// 이벤트/할인
	$("input:radio[name='discount']").click(function(){
		var value = $("input:radio[name='discount']").val();
		
		if(value == '이벤트'){
			resultPrice();
		} else{
			$("select[name='selEvt']").find('option:first').prop("selected", true);
			$("select[name='selEvt']").prop('disabled', true);	//select 박스 선택X
			
			resultPrice();
		}
	})

	$("#selEvt").on("change", function(){
		resultPrice();
	})
	

})