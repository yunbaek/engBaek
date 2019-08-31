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
            <h1 class="title-single">로그인</h1>
          </div> <!-- title-single-box -->
        </div>		
      </div>
    </div>
  </section>

<section class="login">
	<div class="container">
	<div>
		<h4 style="color:red"><c:out value="${error}"/></h4>
        <h4 style="color:red"><c:out value="${logout}"/></h4>
	</div>
	<form role="form" method="post" action="/login">
		
		<div class="control-group">
			<label class="control-label" for="id">아이디</label>
			<div class="controls">
				<input type="text" id="username" name="username" placeholder="아이디를 입력해 주세요">
			</div>			
		</div>
		
		<div class="control-group">
			<label for="inputPassword">비밀번호</label>
			<div class="controls">
				<input type="password" id="password" name="password" placeholder="비밀번호를 입력해주세요">
			</div>
		</div>
		
		<div class="control-group">
			<div class="controls">
				<button type="submit" value="login">로그인</button>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }"/>
			</div>
		</div>
	</form>
 	</div>
</section>

<%@ include file="../includes/footer.jsp" %>