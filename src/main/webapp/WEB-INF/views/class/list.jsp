<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
<%--<%@ include file="../includes/header.jsp" --%>
<%@ include file="../about/sidebar.jsp" %>
<h3>수업 및 자료 공지</h3>

<button id="classListBtn" type="button">강의목록</button>
<button id="registerBtn" type="button">등록</button>
<form id="classForm" action = "/class/list">

	<table border="3">
	  <!-- 목록 출력 -->                 
                   	<thead>
                   		<tr>
                   			<th>No.</th>
                   			<th>제목</th>
                   			<th>작성자</th>
                   			<th>작성일</th>
                   		</tr>
                   	</thead>
                   	<c:forEach items="${classDataList}" var="classData">                  	
                   	   <tr><td>${classData.rownum}</td>
                   	   <td>
                   	   <a class="move" href="${classData.classDataNo}">
                   	   	   ${classData.classDataTitle}</a></td>                 	   	   	                    	   	   	 
                   	   	   <td>${classData.name}</td> 
                   	   	   <td>                    	   	 
                   	   	   <fmt:formatDate value="${classData.classDataRegdate}" pattern="yyyy-MM-dd"/>
                   	   	   </td>             	   	      	   	 
                   	   </tr>                  
                   </c:forEach>  
                                                 
                </table>
                 <input type="hidden" name="courseCode" value="${param.courseCode}">   
              </form>           
<script>
$(function(){
	var actionForm = $("#classForm");  
	
	$(".move").on("click",function(e){
		e.preventDefault();
		actionForm.append("<input type='hidden' name='classDataNo' value='"
				+$(this).attr('href')+"'>'");
		actionForm.attr("action","/class/read").submit();
	});	
	
	$("#classListBtn").on("click", function(){
		self.location = "/class/classData_class_list";
	});
	
	$("#registerBtn").on("click",function(){ 	
		actionForm.attr("action","/class/register").submit();
		
	});
	
});
</script>
<%-- %@ include file = "../includes/footer.jsp" %>--%>