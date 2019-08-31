<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>     
<%@ taglib prefix="sec" 
		   uri="http://www.springframework.org/security/tags"%>      
<%@ page import = "java.util.*" %>
<%@ include file="../includes/header.jsp" %>

  <section class="intro-single">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="title-single-box">
            <h1 class="title-single">접근이 거부되었습니다</h1>
          </div> <!-- title-single-box -->
        </div>		
      </div>
    </div>
  </section>

<section class="error-message">
	<div class="container">
		<p>
		<c:out value="${SPRING_SECURITY_403_EXCEPTION.getMessage()}"/>
		</p>
		msg : <c:out value="${msg}"/>
	</div>
</section>

<%@ include file="../includes/footer.jsp" %>