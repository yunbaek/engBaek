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
          <h1 class="title-single">공지사항</h1>
          <span class="color-text-a">Notice</span>
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
  </div>
</section>
<!--/ Intro Single End /-->

<!-- Page Content -->
<form role="form" class="form-a" method="post" action="/notice/modify/">
  <input type="hidden" name="noticeNo" value="${notice.noticeNo }">
  <div class="container">
    <div class="row">
      <!-- Post Content Column -->
      <div class="col-lg-8">
        <!-- Title -->
        <h3 class="mt-3">${notice.noticeTitle }</h3>
        <!-- Author -->
        <p class="lead">
          by <a href="#">${notice.adminId }</a>
        </p>
        <hr>
        <!-- Date/Time -->
        <p>
          <fmt:formatDate value="${notice.noticeRegdate}" pattern="yyyy-MM-dd a HH:mm " />
        </p>
        <hr>
        <!-- Post Content -->
        <div style="overflow:auto;">
          <p class="lead">${notice.noticeContent }</p>
        </div>
        <hr>
      </div>
    </div>
    <button type="submit" data-oper="modify" class="btn btn-a">Modify</button>
    <!-- 수정 처리 -->
    <button type="submit" data-oper="remove" class="btn btn-a">Remove</button>
    <!-- 삭제 처리 -->
    <button data-oper='list' class="btn btn-a">List</button>
    <!-- 목록 페이지 이동 -->
  </div>

</form>
<!-- End Page Content -->

<script>
	$(function() {
		var formObj = $("form");

		$('button').on("click", function(e) {
			e.preventDefault();

			var operation = $(this).data("oper");
			console.log("operation : " + operation);

			if (operation === 'remove') { //삭제 버튼이 눌린 경우 
				var deleteConfirm = confirm("정말 삭제하시겠습니까?")
				if (deleteConfirm == true) {
					alert("삭제가 완료되었습니다.")
					formObj.attr("action", "/notice/remove");
				} else {
					return;
				}

			} else if (operation === 'list') { //목록 버튼이 눌린 경우
				//				self.location = "/notice/list";	
				//				return;

				//페이지 번호와 게시물 개수 복사
				var pageNumTag = $("input[name='pageNum']").clone();
				var amountTag = $("input[name='amount']").clone();

				//검색 조건과 키워드 복사
				var typeTag = $("input[name='type']").clone();
				var keywordTag = $("input[name='keyword']").clone();

				formObj.attr("action", "/notice/list").attr("method", "get");
				formObj.empty(); //폼 태그 모든 내용을 지움

				//페이지 번호와 게시물 개수만 폼에 추가
				formObj.append(pageNumTag);
				formObj.append(amountTag);

				//검색 조건과 키워드 폼에 추가 
				formObj.append(typeTag);
				formObj.append(keywordTag);

			} else {
				formObj.attr("action", "/notice/modify").attr("method", "get");
			}

			formObj.submit();
		});
	});
</script>

<%@ include file="../includes/footer.jsp"%>