<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/header.jsp"%>
<%@ include file="../about/adminSidebar.jsp"%>

<!--/ Intro Single star /-->
<section class="intro-single">
  <div class="container">
    <div class="row">
      <div class="col-md-12 col-lg-8">
        <div class="title-single-box">
          <h1 class="title-single">공지사항 등록</h1>
        </div>
      </div>
      <div class="col-md-12 col-lg-4">
        <nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end">
          <ol class="breadcrumb">
            <li class="breadcrumb-item">
              <a href="/">HOME</a>
            </li>
            <li class="breadcrumb-item active" aria-current="page">
              <a href="/notice/list/">공지사항</a>
            </li>
          </ol>
        </nav>
      </div>
    </div>
    <br>
    <br>
    <!--/ News Single Star /-->
    <section class="news-single nav-arrow-b">
      <div class="container">
        <div class="row">
          <div class="form-comments">
            <form role="form" class="form-a" method="post" action="/notice/register/">
              <div class="row">
                <div class="col-md-6 mb-3">
                  <div class="form-group">
                    <label for="noticeNo">작성자</label> 
                    <input type="text" name="adminId" class="form-control form-control-lg form-control-a" 
                          id="adminId" value="<sec:authentication property="principal.username"/>" readonly="readonly">
                  </div>
                </div>
                <div class="col-md-12 mb-3">
                  <div class="form-group">
                    <label for="noticeTitle">제목</label> 
                    <input type="text" name="noticeTitle" class="form-control form-control-lg form-control-a" 
                          id="noticeTitle" placeholder="제목 *" required>
                  </div>
                </div>

                <div class="col-md-12 mb-3">
                  <div class="form-group">
                    <label for="infoInput">내용</label>
                    <textarea id="infoInput" class="form-control" placeholder="내용 *" name="noticeContent" 
                          cols="45" rows="8"></textarea>
                  </div>
                </div>
              </div>
              <button type="submit" data-oper="register" class="btn btn-a">Register</button>
              <!-- 등록 처리 -->
            </form>
          </div>
        </div>
      </div>
    </section>
    <!--/ News Single End /-->

  </div>
</section>
<!--/ Intro Single End /-->

<%@ include file="../includes/footer.jsp"%>