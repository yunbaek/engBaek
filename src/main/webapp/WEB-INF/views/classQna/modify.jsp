<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<%--<%@ include file="../includes/header.jsp" --%>
<%@ include file="../about/sidebar.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<br>
<form role="form" action="/classQna/modify" method="post">
<input type="hidden" name="classQnaNo" value="${classQna.classQnaNo}">
<input type="hidden" name="courseCode" value="${classQna.courseCode}">
<input type="hidden" name="teacherId" value="${classQna.teacherId}">
<div>
<label>제목 : </label>           
<input name="classQnaTitle"  value="${classQna.classQnaTitle}">
</div>

<div>
<label>작성자 : </label>
<input name="studentId" readonly = "readonly" value="${classQna.studentId}">
<label>작성일 : </label>
<fmt:formatDate value="${classQna.classQnaRegdate}" pattern="yyyy-MM-dd"/>
</div>

<div>
<label>내용 : </label>
</div>
<textarea name="classQnaContent">${classQna.classQnaContent}</textarea>
<br>
</form>
<button type="submit" id="updateDoneBtn">수정</button>
<button id="cancel">취소</button>
<script>
var formObj = $("form");
$(function(){
	var classQnaNo = "${classQna.classQnaNo}"; //게시글 번호 
		
	$("#updateDoneBtn").on("click", function(e){
		var classQnaTitle = $("input[name='classQnaTitle']").val();
		var classQnaContent = $("textarea[name='classQnaContent']").val();
		if(classQnaTitle==""){
			alert("제목을 입력해주세요");
			return false;
		}else if(classQnaContent==""){
			alert("내용을 입력해주세요");
			return false;
		}else{
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