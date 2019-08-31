<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<%--<%@ include file="../includes/header.jsp" --%>
<%@ include file="../about/sidebar.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<br>
<form role="form" action="/class/modify" method="post">
<input type="hidden" name="classDataNo" value="${classData.classDataNo}">
<div>
<label>제목 : </label>           
<input name=classDataTitle  value="${classData.classDataTitle}">	
</div>

<div>
<label>작성자 : </label>
<input name="name" readonly = "readonly" value="${classData.name}">
<label>작성일 : </label>
<fmt:formatDate value="${classData.classDataRegdate}" pattern="yyyy-MM-dd"  />
</div>

<div>
<label>내용 : </label>
</div>
<textarea name="classDataContent">${classData.classDataContent}</textarea>
<br>
</form>
<button type="submit" id="updateDoneBtn">수정</button>
<button id="cancel">취소</button>

<script>
var formObj = $("form");

$(function(){
	var classDataNo = "${classData.classDataNo}"; //게시글 번호 
	var courseCode = '${classData.courseCode}';
	$("#updateDoneBtn").on("click", function(e){
		var classDataTitle = $("input[name='classDataTitle']").val();
		var classDataContent = $("textarea[name='classDataContent']").val();
		if(classDataTitle==""){
			alert("제목을 입력해주세요");
			return false;
		}else if(classDataContent==""){
			alert("내용을 입력해주세요");
			return false;
		}else{
			formObj.append("<input type='hidden' name='courseCode' value='"
					+courseCode+"'>'");
			formObj.submit();
			alert("수정이 완료 되었습니다");
		}
	 });
	
	$("#cancel").on("click",function(e){
		history.back(-1);
	});
});
</script>

<%--<%@ include file="../includes/footer.jsp" --%>