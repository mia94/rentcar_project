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
	
})