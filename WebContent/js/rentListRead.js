$(function(){
	$("#btnOverdueCal").click(function(){
		
		if($("#true").html() == "Y"){
			alert("이미 반납된 차량입니다.")
			
			return false;
		}
		
		$.ajax({
			url: "rentHour.do",
			type: "post",
			data: {"carCode": $("#btnOverdueCal").attr("data-cCode"), "rCode": $("#btnOverdueCal").attr("data-rCode")},
			dataType: "json",
			success: function(json){
				console.log(json);
				
				$("#overdue").html(json);
			}
		})
	})
	
})