<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ taglib prefix="sec"   uri="http://www.springframework.org/security/tags"%>   
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<%--<%@ include file="../includes/header.jsp" --%>
<%@ include file="../about/sidebar.jsp" %>

<form role="form" action="/class/register" method="post">
<input type="hidden" name="courseCode" value="${param.courseCode}"> 
<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
	<!-- <input type="hidden" name="teacherId" value="tc3"> -->
<div>
<label>제목 : </label>           
<input name="classDataTitle">
</div>

<div>
<label>작성자 : </label>
<input class="form-control" name="teacherId"
       value='<sec:authentication property="principal.username"/>' readonly="readonly"> 
<!--  <input name="name" readonly = "readonly" value="김세나">-->
</div>

<div>
<label>내용 : </label>
</div>
<textarea name="classDataContent"></textarea>

<br>
</form>
<button type="submit" id="registerBtn">등록</button>
<button id="cancel">취소</button>

<script>
var formObj = $("form");

$(function(){
   $("#registerBtn").on("click", function(e){
      e.preventDefault();
      var classQnaTitle = $("input[name='classDataTitle']").val();
      var classQnaContent = $("textarea[name='classDataContent']").val();
      if(classQnaTitle==""){
         alert("제목을 입력해주세요");
         return false;
      }else if(classQnaContent==""){
         alert("내용을 입력해주세요");
         return false;
      }else{
         formObj.submit();
         alert("등록이 완료 되었습니다");
      }
    });
   
   $("#cancel").on("click",function(e){
      self.location = "/class/list?courseCode="+${param.courseCode};
   }); 
});
</script>
<%--<%@ include file="../includes/footer.jsp" --%>