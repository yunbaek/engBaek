<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<%--<%@ include file="../includes/header.jsp" --%>
<%@ include file="../about/sidebar.jsp" %>

<h3>강의실 현황</h3>

<form >
<div id="searchDiv">
		<select id="search">     
			 <option value="0"<c:if test='${param.classroomNo == 0}'>selected</c:if>>전체</option>     			
		     <option value="301" <c:if test='${param.classroomNo == 301}'>selected</c:if>>301</option>
		     <option value="302" <c:if test='${param.classroomNo == 302}'>selected</c:if>>302</option>
		     <option value="303" <c:if test='${param.classroomNo == 303}'>selected</c:if>>303</option>
		     <option value="401" <c:if test='${param.classroomNo == 401}'>selected</c:if>>401</option>
		     <option value="402" <c:if test='${param.classroomNo == 402}'>selected</c:if>>402</option>
		     <option value="403" <c:if test='${param.classroomNo == 403}'>selected</c:if>>403</option>
		      <option value="12" <c:if test='${param.classroomNo == 12}'>selected</c:if>>12</option>	         
		</select>
</div>
</form>
<form id="classroomForm">

<table border="3">
	<thead>
		<tr>
			<th>강의실</th>
			<th>강좌</th>
			<th>강사명</th>
			<th>요일</th>
			<th>시간</th>
			<th>개강일</th>
			<th>종강일</th>
		</tr>
	</thead>
	
	<c:forEach items="${classroomList}" var="classroom">
		<tr>
			<td>${classroom.classroomNo}</td>
			<td>${classroom.courseName}</td>
			<td>${classroom.name}</td>
			<td>${classroom.courseDay}</td>
			<td>${classroom.courseTime}</td>
			<td>${classroom.courseStart}</td>
			<td>${classroom.courseEnd}</td>
		</tr>	
	</c:forEach>
</table>

</form>
<br>
<button>강좌 등록</button>

<script type="text/javascript">
$(function(){
	var searchValue;
 
		$('#search').change(function(){
			searchValue = $("#search option:selected").text();
			var actionForm = $('#classroomForm');
			
			if(searchValue == "전체"){
				searchValue = '';	
				actionForm.submit();
				return false;
			}
			actionForm.append("<input type='hidden' name='classroomNo' value='"
					+searchValue+"'>'");		
			actionForm.attr("action","/classroom/list").submit();
		});
		
});		
</script> 
<%--<%@ include file="../includes/footer.jsp" --%>