<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<%@ include file="../includes/header.jsp"%>
<%@ include file="../about/sidebar.jsp"%>

<br>
<h3>강의중인 강좌</h3>
<form id="classDataClassForm">
  <table class="table table-striped table-bordered table-hover">
    <!-- 목록 출력 -->
    <thead>
      <tr>
        <th>No.</th>
        <th>강좌명</th>
        <th>강사명</th>
        <th>개강일</th>
      </tr>
    </thead>
    <c:forEach items="${classDataClassList}" var="classData">
      <tr>
        <td>${classData.rownum}</td>
        <td><a class="move" href="${classData.courseCode}"> ${classData.courseName}</a></td>
        <td>${classData.name}</td>
        <td>${classData.courseStart}</td>
      </tr>
    </c:forEach>
  </table>
</form>

<script>
	$(function() {

		var actionForm = $("#classDataClassForm");

		$(".move").on("click", function(e) {
			e.preventDefault();
			actionForm.append("<input type='hidden' name='courseCode' value='" + $(this).attr('href') + "'>'");
			actionForm.attr("action", "/class/list").submit();
		});
	});
</script>