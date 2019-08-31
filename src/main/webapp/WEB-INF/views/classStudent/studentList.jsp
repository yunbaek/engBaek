<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
<%--<%@ include file="../includes/header.jsp" --%>
<%@ include file="../about/sidebar.jsp" %>

<h3>학생 명단</h3>
<button id="classStudentListBtn" type="button">강의목록</button>
<form id="classStudentForm" action = "/classStudent/studentList">
<input type="hidden" id="courseCode" name="courseCode" value="${classStudent.courseCode}">
	<table border="3">
	  <!-- 목록 출력 -->                 
                   	<thead>
                   		<tr>
                   			<th>No.</th>
                   			<th>이름</th>
                   			<th>성별</th>
                   			<th>연락처</th>
                   		</tr>
                   	</thead>
                   	<c:forEach items="${studentList}" var="classStudent">                  	
                   	   <tr>
                   	    <td>${classStudent.rownum}</td>
                   	    <td>${classStudent.name}</td>                 	   	   	                    	   	   	 
                  	    <td>${classStudent.gender}</td> 
                   	   	<td>${classStudent.phone}</td>             	   	      	   	 
                   	   </tr>                  
                   </c:forEach>                                    
                </table>
              </form> 
            
<script>
$(function(){
	
	$("#classStudentListBtn").on("click", function(){
		self.location = "/classStudent/student_class_list";
	});
		
});
</script>
<%-- %@ include file = "../includes/footer.jsp" %>--%>