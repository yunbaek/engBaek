<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/header.jsp"%>
<%@ include file="../about/adminSidebar.jsp"%>

<form role="form" method="post" class="actionForm" action="/notice/modify">
  <!-- 게시물 번호 파라미터 추가 -->
  <input type="hidden" name="noticeNo" value="${notice.noticeNo }">
  <!-- 페이지 번호와 페이지 당 표시 개수 파라미터 추가 -->
  <input type="hidden" name="pageNum" value="${cri.pageNum }">
  <input type="hidden" name="amount" value="${cri.amount }">
  <!-- 검색 조건과 키워드 파라미터 추가 -->
  <input type="hidden" name="type" value="${cri.type }">
  <input type="hidden" name="keyword" value="${cri.keyword }">
</form>

<!--/ Intro Single star /-->
<section class="intro-single">
  <div class="container">
    <div class="row">
      <div class="col-md-12 col-lg-8">
        <div class="title-single-box">
          <h1 class="title-single">공지사항 수정</h1>
        </div>
      </div>
      <div class="col-md-12 col-lg-4">
        <nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end">
          <ol class="breadcrumb">
            <li class="breadcrumb-item">
              <a href="#">HOME</a>
            </li>
            <li class="breadcrumb-item active" aria-current="page">
              <a href="/notice/list/">공지사항</a>
            </li>
          </ol>
        </nav>
      </div>
    </div>
    <br> <br>
    <!--/ News Single Star /-->
    <section class="news-single nav-arrow-b">
      <div class="container">
        <div class="row">
          <div class="form-comments">
            <form role="form" class="form-a" method="post" action="/notice/modify/">
              <div class="row">
                <div class="col-md-6 mb-3">
                  <div class="form-group">
                    <label for="noticeNo">작성자</label>
                    <input type="text" name="adminId" class="form-control form-control-lg form-control-a" id="adminId" value="<sec:authentication property="principal.username"/>" readonly="readonly">
                  </div>
                </div>
                <div class="col-md-12 mb-3">
                  <div class="form-group">
                    <label for="noticeTitle">제목</label>
                    <input type="text" name="noticeTitle" class="form-control form-control-lg form-control-a" id="noticeTitle" value="${notice.noticeTitle }" required>
                  </div>
                </div>
                <div class="col-md-12 mb-3">
                  <div class="form-group">
                    <label for="infoInput">내용</label>
                    <textarea id="infoInput" class="form-control" placeholder="내용 *" name="noticeContent" cols="45" rows="8">${notice.noticeContent }</textarea>
                  </div>
                </div>
              </div>
              <button type="submit" data-oper="modify" class="btn btn-a">Modify</button>
              <!-- 수정 처리 -->
              <button type="submit" data-oper="cancel" class="btn btn-a">Cancel</button>
              <!-- 취소 처리 -->
            </form>
          </div>
        </div>
      </div>
    </section>
    <!--/ News Single End /-->

  </div>
</section>
<!--/ Intro Single End /-->

<script>
	$(function() {
		var formObj = $("form");

		$('button').on("click", function(e) {
			e.preventDefault();

			var operation = $(this).data("oper");
			console.log("operation : " + operation);

			if (operation === 'cancel') {
				var noticeNoTag = $("input[name='noticeNo']").clone();
				//페이지 번호와 게시물 개수 복사
				var pageNumTag = $("input[name='pageNum']").clone();
				var amountTag = $("input[name='amount']").clone();

				//검색 조건과 키워드 복사
				var typeTag = $("input[name='type']").clone();
				var keywordTag = $("input[name='keyword']").clone();

				formObj.attr("action", "/notice/modify").attr("method", "post");
				formObj.append(noticeNoTag);
				//페이지 번호와 게시물 개수만 폼에 추가
				formObj.append(pageNumTag);
				formObj.append(amountTag);

				//검색 조건과 키워드 폼에 추가 
				formObj.append(typeTag);
				formObj.append(keywordTag);

				formObj.attr("action", "/notice/read").attr("method", "get");;
			} else if (operation === 'modify') {

				var noticeNoTag = $("input[name='noticeNo']").clone();
				//페이지 번호와 게시물 개수 복사
				var pageNumTag = $("input[name='pageNum']").clone();
				var amountTag = $("input[name='amount']").clone();

				//검색 조건과 키워드 복사
				var typeTag = $("input[name='type']").clone();
				var keywordTag = $("input[name='keyword']").clone();

				formObj.attr("action", "/notice/modify").attr("method", "post");
				formObj.append(noticeNoTag);
				//페이지 번호와 게시물 개수만 폼에 추가
				formObj.append(pageNumTag);
				formObj.append(amountTag);

				//검색 조건과 키워드 폼에 추가 
				formObj.append(typeTag);
				formObj.append(keywordTag);
				alert("수정이 완료되었습니다.")
			}
			formObj.submit();
		});
	});
</script>

<%@ include file="../includes/footer.jsp"%>