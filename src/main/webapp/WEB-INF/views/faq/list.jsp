<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/header.jsp"%>
<%@ include file="../about/adminSidebar.jsp"%>

<!--/ Intro Single star /-->
<section class="intro-single">
  <%--  <jsp:include page="sidebar.jsp"></jsp:include> --%>
  <div class="container">
    <div class="row">
      <div class="col-md-12 col-lg-8">
        <div class="title-single-box">
          <h1 class="title-single">FAQ</h1>
          <span class="color-text-a">faq</span>
        </div>
      </div>
      <div class="col-md-12 col-lg-4">
        <nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end">
          <ol class="breadcrumb">
            <li class="breadcrumb-item">
              <a href="/">HOME</a>
            </li>
            <li class="breadcrumb-item active" aria-current="page">
              <a href="/faq/list/">FAQ</a>
            </li>
          </ol>
        </nav>
      </div>
    </div>
  </div>
</section>
<!--/ Intro Single End /-->

<!--/ About Star /-->
<section class="section-about">
  <div class="container">
    <div class="row">
      <table class="table table-striped table-hover">
        <!-- 목록 출력 -->
        <thead>
          <tr>
            <th>No.</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach items="${faqList}" var="faq">

            <tr>
              <td>${faq.faqNo}</td>
              <td><a class="move" href="${faq.faqNo}"> ${faq.faqTitle}</a></td>
              <td>${faq.adminId}</td>
              <td><fmt:formatDate value="${faq.faqRegdate}" pattern="yyyy-MM-dd" /></td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
      <!-- 검색창 - 검색 조건 및 키워드 입력 영역 -->
      <div class='row'>
        <div class="col-lg-12">
          <form id="searchForm" action="/faq/list">
            <select name="type">
              <c:set var="type" value="${pageMaker.cri.type }" />
              <!-- 검색 조건이 없을 경우 selected 표시 -->
              <option value="" <c:out value="${type == null?'selected':'' }"/>>검색 조건 지정</option>
              <!-- ${pageMaker.cri.type}이 value와 일치하면 selected 표시 -->
              <option value="T" <c:out value="${type == 'T'?'selected':'' }"/>>제목</option>
              <option value="C" <c:out value="${type == 'C'?'selected':'' }"/>>내용</option>
              <option value="TC" <c:out value="${type == 'TC'?'selected':'' }"/>>제목 + 내용</option>
            </select>
            <input type="text" name="keyword" value="${pageMaker.cri.keyword }">
            <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
            <input type="hidden" name="amount" value="${pageMaker.cri.amount }">
            <button class="btn btn-b btn-search">Search</button>
          </form>
        </div>
      </div>
      <!-- END 검색창 - 검색 조건 및 키워드 입력 영역 -->

      <!-- 페이지 번호 출력 -->
      <div class="col-xs-4 col-md-12 pull-right">
        <nav class="pagination-a">
          <ul class="pagination justify-content-end">
            <c:if test="${pageMaker.prev }">
              <!-- previous 버튼 표시 -->
              <li class="paginate_button page-item previous">
                <a class="page-link" href="${pageMaker.startPage - 1 }"> Previous</a>
              </li>
            </c:if>

            <!-- 페이지 번호 표시 -->
            <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">
              <li class="paginate_button page-item  ${pageMaker.cri.pageNum == num ? 'active': '' }">
                <a class="page-link" href="${num }">${num }</a>
              </li>
            </c:forEach>

            <c:if test="${pageMaker.next }">
              <!-- next 버튼 표시 -->
              <li class="paginate_button page-item next">
                <a class="page-link" href="${pageMaker.endPage + 1 }">Next</a>
              </li>
            </c:if>
          </ul>
        </nav>
        <button id="regBtn" type="button" class="btn btn-a pull-right">글쓰기</button>
      </div>
      <!-- END 페이지 번호 출력 -->
    </div>
  </div>
</section>
<!--/ About End /-->
<!--/ Intro Single End /-->

<!-- a 태그 대신 pageNum과 amount 파라미터로 전송 -->
<form id="actionForm" action="/faq/list">
  <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
  <input type="hidden" name="amount" value="${pageMaker.cri.amount }">
  <!-- 검색 키워드와 조건 파라미터 추가 -->
  <input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
  <input type="hidden" name="type" value="${pageMaker.cri.type }">
</form>

<script>
	$(function() {

		//등록 버튼 처리
		$("#regBtn").on("click", function() {
			self.location = "/faq/register";
		});

		//페이지 번호를 클릭하면 해당 페이지 목록 표시
		var actionForm = $("#actionForm");
		$(".paginate_button a").on("click", function(e) {
			e.preventDefault(); //a 태그 기본 동작 막기

			//pageNum의 값을 클릭된 a의 href 값으로 변경
			actionForm.find("input[name='pageNum']").val($(this).attr('href'));
			//폼 전송
			actionForm.submit();
		});

		//a 태그의 move 클래스 속성을 이용
		$(".move").on("click", function(e) {
			//a 태그의 기본 동작 막고
			e.preventDefault();

			actionForm.append("<input type='hidden' name='faqNo' value='" + $(this).attr('href') + "'>'");
			actionForm.attr("action", "/faq/read");
			actionForm.submit();
		});

		//검색 버튼 이벤트 처리
		var searchForm = $("#searchForm");
		$("#searchForm button").on("click", function(e) {
			if (!searchForm.find("option:selected").val()) {
				alert("검색 조건을 선택해 주세요."); //검색 조건 선택 알림
				return false;
			}

			if (!searchForm.find("input[name='keyword']").val()) {
				alert("검색어를 입력해 주세요."); //검색어 입력 알림
				return false;
			}

			//검색 시 페이지 번호는 1이 되도록 처리
			searchForm.find("input[name='pageNum']").val("1");
			e.preventDefault();
			searchForm.submit(); //폼 전송
		});

	});
</script>

<!-- Template Main Javascript File -->
<script src="../../../resources/js/main.js"></script>
<%@ include file="../includes/footer.jsp"%>