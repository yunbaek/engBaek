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
          <div class="title-single-box">
            <h1 class="title-single">권한이 없습니다</h1>
            <h3>승인이 되지 않은 강사입니다</h3>
            <a href="/member/customLogout">로그아웃</a>
          </div> <!-- title-single-box -->
        </div>		
      </div>
    </div>
  </section>

<%@ include file="../includes/footer.jsp" %>