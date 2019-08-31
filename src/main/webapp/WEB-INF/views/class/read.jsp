<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<%--<%@ include file="../includes/header.jsp" --%>
<%@ include file="../about/sidebar.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<br>
<div>
<label>제목 : </label>           
<input name="classDataTitle" readonly = "readonly" value="${classData.classDataTitle}">
</div>

<div>
<label>작성자 : </label>
<input name="name" readonly = "readonly" value="${classData.name}">
<label>작성일 : </label>
<fmt:formatDate value="${classData.classDataRegdate}" pattern="yyyy-MM-dd"/>
</div>

<div>
<label>내용 : </label>
</div>
<textarea name="classDataContent" readonly = "readonly">${classData.classDataContent}</textarea>

<form id="classDataForm" action="/class/read" >
<input type="hidden" id="classDataNo" name="classDataNo" value="${classData.classDataNo}">
<input type="hidden" id="courseCode" name="courseCode" value="${classData.courseCode}">
</form>

<button type = "submit" id="updateBtn">수정</button>
<button id="deleteBtn">삭제</button>
<button id="listBtn">목록</button>

<br>

<script type="text/javascript">

$(function(){
	var classDataNo = "${classData.classDataNo}"; //게시글 번호 
	var classDataForm = $("#classDataForm");
	
	   $("#listBtn").on("click", function(e){
		   classDataForm.find("#classDataNo").remove();
		   classDataForm.attr("action", "/class/list");
		   classDataForm.submit();
	   });
	   
	   $("#updateBtn").on("click",function(e){
		   classDataForm.attr("action","/class/modify").submit();
	   });
	   
	   $("#deleteBtn").on("click",function(){
		   classDataForm.attr("action","/class/remove");
		   classDataForm.attr("method","post");
		   classDataForm.submit();
		  alert("삭제가 완료되었습니다.");
	   });   
	   
	 });
</script>
<%-- %@ include file = "../includes/footer.jsp" %>--%>