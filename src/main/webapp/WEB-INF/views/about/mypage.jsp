<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
    
    
    
    
 <%@ include file="../includes/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 mypage</title>
</head>
<body>
<!-- sidenav -->
	<div id="sidenav" class="sidenav">
	<div class="panel-heading">
	<h3 class="panel-title"><span class="color-b">마이페이지</span></h3>
    </div>    
    <nav class="nav flex-column">
    	<a class="nav-link" href="">개인정보</a>
    	<a class="nav-link" href="/classStudent/student_class_list">강의별 QnA</a>
    	<a class="nav-link" href="/review/review_class_list">리뷰</a>
    	<a class="nav-link" href="../privateQna/list">1:1문의</a>
    	<a class="nav-link" href="../payment/list">결제내역</a>
	</nav>
</div>
	<!-- END sidenav -->
</body>
</html>