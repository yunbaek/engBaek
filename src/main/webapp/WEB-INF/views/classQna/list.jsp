<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
<%--<%@ include file="../includes/header.jsp" --%>
<%@ include file="../about/sidebar.jsp" %>
<button id="registerBtn" type="button">등록</button>
<button id="classQnaListBtn" type="button">강의목록</button>
<form id="classQnaForm0" action = "/classQna/list">
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
                   	<c:forEach items="${classQnaList}" var="classQna">
                   	
                   	   <tr><td>${classQna.rownum}</td>
                   	   <td>
                   	   <a class="move" href="${classQna.classQnaNo}">
                   	   	   ${classQna.classQnaTitle} <b>[${classQna.replyCnt}]</b></a></td>                 	   	   	                    	   	   	 
                   	   	   <td>${classQna.studentId}</td> 
                   	   	   <td>  
                   	   	   <fmt:formatDate value="${classQna.classQnaRegdate}" pattern="yyyy-MM-dd"/>
                   	   	   </td>             	   	      	   	 
                   	   </tr>                  
                   </c:forEach>                                    
                </table>
                   <input type="hidden" name="courseCode" value="${param.courseCode}"> 
              </form> 
            
<script>
$(function(){
	
	var actionForm = $("#classQnaForm0");
	$(".move").on("click",function(e){
		e.preventDefault();
		actionForm.append("<input type='hidden' name='classQnaNo' value='"
				+$(this).attr('href')+"'>'");
		actionForm.attr("action","/classQna/read");
		actionForm.submit();		
	});
	
	$("#registerBtn").on("click",function(){ 
		actionForm.attr("action","/classQna/register").submit();
	});
	
	$("#classQnaListBtn").on("click", function(){
		self.location = "/classQna/qna_class_list";
	});
		
});
</script>
<%-- %@ include file = "../includes/footer.jsp" %>--%>