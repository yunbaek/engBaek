<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/header.jsp"%>
<%@ include file="../about/adminSidebar.jsp"%>

<!-- a 태그 대신 pageNum과 amount 파라미터로 전송 -->
<form id="actionForm" action="/course/list">
  <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
  <input type="hidden" name="amount" value="${pageMaker.cri.amount }">

  <!-- 검색 키워드와 조건 파라미터 추가 -->
  <input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
  <input type="hidden" name="type" value="${pageMaker.cri.type }">
</form>

<!--/ Intro Single star /-->
<section class="intro-single">
  <div class="container">
    <div class="row">
      <div class="col-md-12 col-lg-8">
        <div class="title-single-box">
          <h1 class="title-single">강좌 소개</h1>
          <span class="color-text-a">Course Introduce</span>
        </div>
      </div>
      <div class="col-md-12 col-lg-4">
        <nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end">
          <ol class="breadcrumb">
            <li class="breadcrumb-item">
              <a href="/">Home</a>
            </li>
            <li class="breadcrumb-item active" aria-current="page">
              <a href="/course/list">강좌 소개</a>
            </li>
          </ol>
        </nav>
        <div class="grid-option">
          <form>
            <select class="custom-select" id="search">
              <option value="ALL">ALL</option>
              <optgroup label="Toeic">
                <option value="550" class="toeic" <c:if test='${param.keyword == "550"}'>selected</c:if>>토익-550</option>
                <option value="700" class="toeic" <c:if test='${param.keyword == "700"}'>selected</c:if>>토익-700</option>
                <option value="850" class="toeic" <c:if test='${param.keyword == "850"}'>selected</c:if>>토익-850</option>
              </optgroup>
              <optgroup label="Toeic Speaking">
                <option value="5" class="tos" <c:if test='${param.keyword == "5"}'>selected</c:if>>토스-5</option>
                <option value="6" class="tos" <c:if test='${param.keyword == "6"}'>selected</c:if>>토스-6</option>
                <option value="7" class="tos" <c:if test='${param.keyword == "7"}'>selected</c:if>>토스-7</option>
              </optgroup>
            </select>
          </form>
        </div>
      </div>
    </div>
  </div>
</section>
<!--/ Intro Single End /-->

<!--/ Property Grid Star /-->

<section class="property-grid grid">
  <div class="container">
    <div class="row">
      <form id="mainForm">
        <div class="row">
          <div class="col-sm-12">
            <div class="grid-option"></div>
          </div>
          <c:forEach items="${courseList}" var="course">
            <div class="col-md-4">
              <div class="card-box-a card-shadow" style="height: 350px">
                <div class="img-box-a">
                  <img src="/courseImages/display?fileName=${course.uploadPath }/s_${course.coursePictureUuid}_${course.coursePictureName }" width="100%" height="200px" class="img-d img-fluid">
                </div>
                <div class="card-overlay">
                  <div class="card-overlay-a-content">
                    <div class="card-header-a">
                      <h2 class="card-title-a">
                        <a href="${course.courseCode }" class="move"> ${course.name } <br />${course.courseName }
                        </a>
                      </h2>
                    </div>
                    <div class="card-body-a">
                      <div class="price-box d-flex">
                        <span class="price-a"> 개강 | ${course.courseStart}</span>
                      </div>
                      <a href="${course.courseCode}" class="move link-a">상세보기<span class="ion-ios-arrow-forward"></span>
                      </a>
                    </div>
                    <div class="card-footer-a">
                      <ul class="card-info d-flex justify-content-around">
                        <li>
                          <h4 class="card-info-title">유형</h4>
                          <span>${course.courseType }
                            <sup></sup>
                          </span>
                        </li>
                        <li>
                          <h4 class="card-info-title">레벨</h4>
                          <span>${course.courseLevel }</span>
                        </li>
                        <li>
                          <h4 class="card-info-title">요일</h4>
                          <span>${course.courseDay }</span>
                        </li>
                        <li>
                          <h4 class="card-info-title">시간</h4>
                          <span>${course.courseTime }</span>
                        </li>
                      </ul>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </c:forEach>
        </div>
      </form>

      <!-- 검색창 - 검색 조건 및 키워드 입력 영역 -->
      <div class='row'>
        <div class="col-lg-12">
          <form id="searchForm" action="/course/list/">
            <select name="type">
              <c:set var="type" value="${pageMaker.cri.type }" />
              <!-- 검색 조건이 없을 경우 selected 표시 -->
              <option value="" <c:out value="${type == null?'selected':'' }"/>>검색 조건 지정</option>
              <!-- ${pageMaker.cri.type}이 value와 일치하면 selected 표시 -->
              <option value="A" <c:out value="${type == 'A'?'selected':'' }"/>>강좌명</option>
              <option value="B" <c:out value="${type == 'B'?'selected':'' }"/>>강사명</option>
              <option value="AB" <c:out value="${type == 'AB'?'selected':'' }"/>>강좌명 + 강사명</option>
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
        <button id="regBtn" type="button" class="btn btn-a pull-right">Register</button>
      </div>
      <!-- END 페이지 번호 출력 -->
    </div>
  </div>
</section>
<!--/ Property Grid End /-->

<script>
	$(function() {

		//등록 버튼 처리
		$("#regBtn").on("click", function() {
			self.location = "/course/register";
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

			actionForm.append("<input type='hidden' name='courseCode' value='" + $(this).attr('href') + "'>'");
			actionForm.attr("action", "/course/info");
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

		// select 검색 처리
		$(function() {
			var searchValue;

			$('#search').change(function() {
				searchValue = $("#search option:selected").val();
				var actionForm = $('#mainForm');
				console.log(searchValue);

				if (searchValue == "ALL") {
					actionForm.attr("action", "/course/list").submit();
					return false;
				}
				if (searchValue >= 10) {
					actionForm.append("<input type='hidden' name='type' value='C'>");
					actionForm.append("<input type='hidden' name='keyword' value='"+searchValue+"'>")
				} else {
					actionForm.append("<input type='hidden' name='type' value='D'>");
					actionForm.append("<input type='hidden' name='keyword' value='"+searchValue+"'>")
				}
				actionForm.attr("action", "/course/list").submit();
				return false;
			});
		});
	});
</script>

<script>
	let date = new Date();
	console.log(date);
	let courseStart = $
	{
		course.courseStart
	};
</script>

<%@ include file="../includes/footer.jsp"%>
