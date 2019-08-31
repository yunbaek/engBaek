<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>     
<%@ taglib prefix="sec" 
		   uri="http://www.springframework.org/security/tags"%>      
<%@ include file="../includes/header.jsp" %>
  
  <section class="intro-single">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
				
			<!-- 비회원 : 로그인 화면으로 -->
			<sec:authorize access="isAnonymous()">
				<% pageContext.forward("/member/customLogin"); %>
			</sec:authorize>
				
			<!-- 학생 : 학생 마이페이지로 -->
			<sec:authorize access="hasRole('ROLE_S')">
				<% pageContext.forward("/member/student"); %>
			</sec:authorize>
				
			<!-- 강사 : 강사 마이페이지로 -->
			<sec:authorize access="hasRole('ROLE_Y')">
				<% pageContext.forward("/member/teacher"); %>
			</sec:authorize>
			
			<!-- 승인되지 않은 강사 : 권한 없음 안내 페이지로 -->
			<sec:authorize access="hasRole('ROLE_N')">
				<% pageContext.forward("/member/teacher_n"); %>
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_R')">
				<% pageContext.forward("/member/teacher_n"); %>
			</sec:authorize>
				
			<sec:authorize access="hasRole('ROLE_A')">
				<% pageContext.forward("/member/admin"); %>
			</sec:authorize>
	     </div>		
      </div>
    </div>
  </section>
  
<%@ include file="../includes/footer.jsp" %>