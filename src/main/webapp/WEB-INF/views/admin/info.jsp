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
            <h1 class="title-single">관리자 개인정보</h1>
          </div> <!-- title-single-box -->
        </div>		
      </div>
    </div>
  </section>
 

<section>
	<div class="container">
            <div class="col-sm-6 col-md-offset-3">
                <form role="form" method="post" action="/admin/info">
                	<div class="form-group">
                        <label for="name">성명</label>
                        <input class="form-control" name='adminName' value="${admin.adminName}" readonly="readonly">
                    </div>
	                <div class="form-group">
                        <label for="id">아이디</label>
                        <input type="text" class="form-control" name="adminId" id="adminId" value="${admin.adminId}" readonly="readonly">
                    </div>                    
                    <input type="hidden" name="authNo" value="ROLE_A">

                    <div class="form-group text-center">
                    	<button type="button" class="btn btn-secondary" onclick="history.back()">이전</button>
                        <button type="submit" class="btn btn-success">다음</button>
                    </div>
                </form>
              </div>
            </div>

        </section>
 
   <%@ include file="../includes/footer.jsp" %>