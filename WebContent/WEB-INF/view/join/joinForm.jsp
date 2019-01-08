<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/css/common.css" rel="stylesheet"  type="text/css">
<style>
   label{
      width:120px;
      float:left;
   }
   .error, .error2{
      color:red;
      font-size: 12px;
      display:none;      
   }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

 <script>
    $(function(){
      $("#f1").submit(function(){
         $(".error").css("display","none");
         $(".error2").css("display","none");
         
         var name = $("input[name='name']").val();
         if(name == ""){
            $("input[name='name']").next().css("display","inline");
            return false;/*submit을 막음*/
         }
         var regName = /^[가-힣]{2,5}$/;
         if(regName.test(name) == false){
            $("input[name='name']").nextAll(".error2").css("display","inline");
            return false;
         }     
         
         var id = $("input[name='id']").val();
         if(id == ""){
            $("input[name='id']").nextAll(".error").css("display","inline");
            return false;/*submit을 막음*/
         }
         var regId = /^[a-z0-9]{6,15}$/i;
         if(regId.test(id) == false){
            $("input[name='id']").nextAll(".error2").css("display","inline");
            return false;
         }
        
         
         var password = $("input[name='password']").val();
         if(password == ""){
            $("input[name='password']").next().css("display","inline");
            return false;/*submit을 막음*/
         }
         var regPassword = /^[a-z0-9!@#$%]{6,20}$/i;
         if(regPassword.test(password) == false){
            $("input[name='password']").nextAll(".error2").css("display", "inline");
            return false;
         }
         
         var confirmPassword = $("input[name='confirmPassword']").val();
         if(confirmPassword == ""){
            $("input[name='confirmPassword']").next().css("display","inline");
            return false;/*submit을 막음*/
         }
         if(password != confirmPassword){
            $("input[name='confirmPassword']").nextAll(".error2").css("display","inline");
            return false;
         }
         
         
         return true;
      });
      
      $("#duplicatedIdBtn").click(function(){
         var id = $("input[name='id']").val();
         
         $.ajax({
            url:"duplicatedId.do",
            type:"get",
            data:{"id":id},
            dataType:"json",
            success:function(data){
               console.log(data);
               if(data.result == true){
                  alert("사용중인 ID입니다.");
               }else{
                  alert("ID를 사용할 수 있습니다.");
               }
            }
         })
      })
      	$(function () {
		$("#BtnPost").click(function() {
			location.href="post.do";
		})
	})
      
   })
   
</script>
</head>
<body>
   <form action="join.do" method="post" id="f1">
      <p>
         <label>이름</label>
         <input type="text" name="name"> 
         <span class="error">이름을 입력하세요</span>
         <span class="error2">한글 (2~5)</span>
      </p>
      <p>
         <label>아이디</label>
         <input type="text" name="id" > 
         <button type="button" id="duplicatedIdBtn">중복체크</button>
         <span class="error">ID를 입력하세요</span>
         <span class="error2">영어, 숫자 (6~15)</span>
      </p>
     
      <p>
         <label>비밀번호</label>
         <input type="password" name="password"> 
         <span class="error">비밀번호를 입력하세요</span>
         <span class="error2">영어,숫자, 특수문자 (6~20)</span>
      </p>
      <p>
         <label>비밀번호 확인</label>
         <input type="password" name="confirmPassword"> 
         <span class="error">비밀번호 확인을 입력하세요</span>
         <span class="error2">비밀번호 일치하지 않습니다</span>
      </p>
      
       <p>
         <label>전화번호</label>
        <select name="phone">
        	<option>선택하세요</option>
        	<option>010</option>
        	<option>011</option>
        	<option>017</option>
        </select>
      - <input type="text" name="phone2"> - <input type="text" name="phone3">
        
      </p>
       <p>
         <label>이메일</label>
         <input type="text"> @
        <select>
        	<option>선택하세요</option>
        	<option>naver.com</option>
        	<option>gmail.com</option>
        	<option>daum.net</option>
        	<option>nate.com</option>
        </select>
      </p>
      
      <p>
       <label>우편번호</label>
      <input type="text"> <input type="button" value="우편번호 검색" name="post" id="BtnPost">
      </p>
      
      <p>
       <label>주소</label>   
      	<input type="text">
      </p>
      
	 <p>
	  <label>면허종류</label>
	 	<select>
	 		<option>선택하세요</option>
	 		<option>1종보통</option>
	 		<option>2종보통</option>
	 	</select>
	 </p>
      
      <p>  
         <input type="submit" value="회원가입"> 
      </p>
   </form>
</body>
</html>

