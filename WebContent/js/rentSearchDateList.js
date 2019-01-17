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
			$(".searchDate").find(".chkbox2").removeClass("on");
		}
	});

	$(".dateclick").dateclick(); // DateClick
	$(".searchDate").schDate(); // searchDate

});

// Search Date
jQuery.fn.schDate = function() {
	var $obj = $(this);
	var $chk = $obj.find("input[type=radio]");
	$chk.click(function() {
		$('input:not(:checked)').parent(".chkbox2").removeClass("on");
		$('input:checked').parent(".chkbox2").addClass("on");
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
	$('#searchEndDate').val(endDate);

	if (str == 'd') {
		today.setDate(today.getDate() - num);
	} else if (str == 'w') {
		today.setDate(today.getDate() - (num * 7));
	} else if (str == 'm') {
		today.setMonth(today.getMonth() - num);
		today.setDate(today.getDate() + 1);
	}

	var startDate = $.datepicker.formatDate('yy-mm-dd', today);
	$('#searchStartDate').val(startDate);

	// 종료일은 시작일 이전 날짜 선택하지 못하도록 비활성화
	$("#searchEndDate").datepicker("option", "minDate", startDate);

	// 시작일은 종료일 이후 날짜 선택하지 못하도록 비활성화
	$("#searchStartDate").datepicker("option", "maxDate", endDate);

}

$("#btnReset").click(function(){
	location.href = 'rentChkList.do';
})

//조회버튼
$("#btnSearch").click(function(){
	if( $("#searchStartDate").val() == "" && $("#searchEndDate").val() == ""){
		alert("조회하고 싶은 기간을 선택해주세요.");
	} else{
		/*$("#searchForm").submit(); submit 쓰면 안되고 조회버튼의 버튼 타입을 button으로 바꿔야 함.
		*/
		$.ajax({
			url: "rentSearchDate.do",
			type: "post",
			data:{"searchStartDate": $("#searchStartDate").val(), "searchEndDate": $("#searchEndDate").val()},
			dataType: "json",
			success: function(json){
				console.log(json);
				$("#title").nextAll().remove();
				
				$(json).each(function(index, obj){
					$("#title").after("<tr id='insert'></tr>");
					$("#insert").append("<td style='width:136.8px'><a href='rentChkListRead.do?code=" + obj.code + "&name=" + obj.car_code.name + "'>" + obj.code + "</td>");
					$("#insert").append("<td style='width:192px'>" + obj.start_date + "</td>");
					$("#insert").append("<td style='width:192px'>" + obj.end_date + "</td>");
					$("#insert").append("<td style='width:103.2px'><img src='"+pathContext+"/upload/" + obj.car_code.brand.name + ".png'></td>");
					$("#insert").append("<td style='width:70.4px'>" + obj.car_code.carType.type + "</td>");
					$("#insert").append("<td style='width:104.8px'>" + obj.car_code.name + "</td>");
				})
			}
			
		})
	}
})
