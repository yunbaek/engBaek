<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<%--<%@ include file="../includes/header.jsp" --%>
<%@ include file="../about/sidebar.jsp" %>

<br>
<h3>강의중인 강좌</h3>
<form id="qnaClassForm">
<table border="3">
	  <!-- 목록 출력 -->                 
                   	<thead>
                   		<tr>
                   			<th>No.</th>
                   			<th>강좌명</th>
                   			<th>강사명</th>
                   			<th>개강일</th>
                   		</tr>
                   	</thead>
                   	<c:forEach items="${qnaClassList}" var="classQna">
                   		<tr>
                   	  <td>${classQna.rownum}</td>
                   	   <td>
                   	   <a class="move" href="${classQna.courseCode}">
                   	   	   ${classQna.courseName}</a></td> 
                   	   	   <td>${classQna.name}</td>                	   	   	                    	   	   	 
                   	   	   <td>  
                   	   	  ${classQna.courseStart}
                   	   	   </td>             	   	      	   	 
                   	   </tr>                  
                   </c:forEach>                                                   
                </table>
              </form> 
            
<script>
$(function(){
	
	var actionForm = $("#qnaClassForm");

	$(".move").on("click",function(e){	
		e.preventDefault();
		actionForm.append("<input type='hidden' name='courseCode' value='"
			+$(this).attr('href')+"'>'");	
		actionForm.attr("action","/classQna/list").submit();
	});

	
});

</script>