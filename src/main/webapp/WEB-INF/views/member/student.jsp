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
            <h1 class="title-single">학생 개인정보</h1>
            <form action="/member/pwCheckStudent">
			회원님의 정보를 보호하기 위해 비밀번호를 다시 한 번 확인합니다
			<div class="controls">
			<input type="hidden" name="studentId">
			<input type="password" name="pw">
			</div>
            <!-- <button type="submit">확인</button> -->
            </form>
            
            <form action="/student/info" method="get">
            <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
            <input type="hidden"name="studentId" value='<sec:authentication property="principal.username"/>'>
            <button type="submit">확인</button>
            </form>
          </div> <!-- title-single-box -->
        </div>		
      </div>
    </div>
  </section>
  
<%@ include file="../includes/footer.jsp" %>