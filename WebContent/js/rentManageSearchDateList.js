$(document).ready(function() {

	//datepicker 한국어로 사용하기 위한 언어설정
	$.datepicker.setDefaults($.datepicker.regional['ko']);

	// Datepicker            
	$(".datepicker").datepicker({
		showButtonPanel : true,
		dateFormat : "yy-mm-dd",
		onClose : function(selectedDate) {

			var eleId = $(this).attr("id");
			var optionName = "";

			if (eleId.indexOf("StartDate") > 0) {
				eleId = eleId.replace("StartDate", "EndDate");
				optionName = "minDate";
			} else {
				eleId = eleId.replace("EndDate", "StartDate");
				optionName = "maxDate";
			}

			$("#" + eleId).datepicker("option", optionName, selectedDate);
			$(".searchDate1").find(".chkbox1").removeClass("on");
		}
	});

	$(".dateclick1").dateclick(); // DateClick
	$(".searchDate").schDate(); // searchDate

});

// Search Date
jQuery.fn.schDate = function() {
	var $obj = $(this);
	var $chk = $obj.find("input[type=radio]");
	$chk.click(function() {
		$('input:not(:checked)').parent(".chkbox1").removeClass("on");
		$('input:checked').parent(".chkbox1").addClass("on");
	});
};

// DateClick
jQuery.fn.dateclick = function() {
	var $obj = $(this);
	$obj.click(function() {
		$(this).parent().find("input").focus();
	});
}

function setSearchDate(start) {

	var num = start.substring(0, 1);
	var str = start.substring(1, 2);

	var today = new Date();

	//var year = today.getFullYear();
	//var month = today.getMonth() + 1;
	//var day = today.getDate();

	var endDate = $.datepicker.formatDate('yy-mm-dd', today);
	$('#searchEndDate1').val(endDate);

	if (str == 'd') {
		today.setDate(today.getDate() - num);
	} else if (str == 'w') {
		today.setDate(today.getDate() - (num * 7));
	} else if (str == 'm') {
		today.setMonth(today.getMonth() - num);
		today.setDate(today.getDate() + 1);
	}

	var startDate = $.datepicker.formatDate('yy-mm-dd', today);
	$('#searchStartDate1').val(startDate);

	// 종료일은 시작일 이전 날짜 선택하지 못하도록 비활성화
	$("#searchEndDate1").datepicker("option", "minDate", startDate);

	// 시작일은 종료일 이후 날짜 선택하지 못하도록 비활성화
	$("#searchStartDate1").datepicker("option", "maxDate", endDate);

}

//초기화버튼
$("#btnReset1").click(function(){
	location.href = 'rentList.do';
})

//조회버튼
$("#btnSearch1").click(function(){
	if( $("#searchStartDate1").val() == "" && $("#searchEndDate1").val() == ""){
		alert("조회하고 싶은 기간을 선택해주세요.");
	} else{
			$.ajax({
			url: "manageRentList.do",
			type: "post",
			data:{"searchStartDate1": $("#searchStartDate1").val(), "searchEndDate1": $("#searchEndDate1").val()},
			dataType: "json",
			success: function(json){
				console.log(json);
				$("#title1").nextAll().remove();
				
				$(json).each(function(index, obj){
					$("#title1").after("<tr id='insert'></tr>");
					$("#insert").append("<td style='width:136px'>" + obj.code + "</td>");
					$("#insert").append("<td style='width:136px'>" + obj.customer_code.code + "</td>");
					$("#insert").append("<td style='width:192px'>" + obj.start_date + "</td>");
					$("#insert").append("<td style='width:192px'>" + obj.end_date + "</td>");
					$("#insert").append("<td style='width:138px' id='isReturn'>" + obj.is_return  + "</td>");
					var ir = $("#isReturn").text();
					if(ir == 'false'){
						$("#isReturn").html("N");
						$("#isReturn").css("color", "#F15F5F");
					} else{
						$("#isReturn").html("Y");
						$("#isReturn").css("color", "#6798FD");
					}
				})
			}
			
		})
	}
})

