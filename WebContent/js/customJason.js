	$(function() {
		$("#CusDetail").css("margin-left","-100%").css("opacity",0);
		
		$(document).on("change", "")
		
		$(document).on("click",".cusInfo", function (event) {
			 $("#inner").empty()
			 /* $("#inner").append("<img src='${pageContext.request.contextPath }/images/btnX.png' id='btnx'>");  */
			 $("#CusDetail").animate({"margin-left":"0", "opacity":1});
			 $.ajax({
				 url: "customerList.do",
				 type: "get",
				
				 dataType: "json",
				 success : function(list) {
					console.log(list);
					
					  $("#test").append("<p>"+list+"</p>");
				}
			 })
		})
	})