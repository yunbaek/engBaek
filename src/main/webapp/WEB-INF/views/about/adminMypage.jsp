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
    	<a class="nav-link" href="">공지사항 관리</a>
    	<a class="nav-link" href="../">faq 관리</a>
    	<a class="nav-link" href="../privateQna/list">강좌 관리</a>
    	<a class="nav-link" href="../privateQna/list">강사 관리</a>
    	<a class="nav-link" href="../payment/list">후기 관리</a>
    	<a class="nav-link" href="../privateQna/list">상담 관리</a>
    	<a class="nav-link" href="../payment/list">결제 관리</a>
    	<a class="nav-link" href="../payment/list">강의실 관리</a>
	</nav>
</div>
	<!-- END sidenav -->
</body>
</html>