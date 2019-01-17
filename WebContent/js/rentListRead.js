$(function(){
	$("#btnOverdueCal").click(function(){
		var carCode = $(this).attr("data-cCode");
		var rCode = $(this).attr("data-rCode");
		
		$("#carCode").val(carCode);
		$("#rCode").val(rCode);
		
		$("#calOverdue").submit();
	})
	
})