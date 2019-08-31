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
            <h1 class="title-single">로그아웃</h1>
          </div> <!-- title-single-box -->
        </div>		
      </div>
    </div>
  </section>

<section class="logout">
	<div class="container">
	<form action="/customLogout" method="post">
		<div class="control-group">
			<div class="controls">		
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }"/>
				<button>로그아웃</button>
			</div>
		</div>
	</form>
	</div>
</section>

<%@ include file="../includes/footer.jsp" %>