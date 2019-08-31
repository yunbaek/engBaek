<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%--<%@ include file="../includes/header.jsp" --%>
<%@ include file="../includes/header.jsp"%>
<%@ include file="../about/adminSidebar.jsp"%>

<!--/ Intro Single star /-->
<section class="intro-single">
  <div class="container">
    <div class="row">
      <div class="col-md-12 col-lg-8">
        <div class="title-single-box">
          <h1 class="title-single">강사 소개</h1>
          <span class="color-text-a">Teacher Profile</span>
        </div>
      </div>
      <div class="col-md-12 col-lg-4">
        <nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end">
          <ol class="breadcrumb">
            <li class="breadcrumb-item">
              <a href="/">Home</a>
            </li>
            <li class="breadcrumb-item active">
              <a href="/profile/list">강사 소개</a>
            </li>
          </ol>
        </nav>
        <div class="grid-option">
          <form>
            <select class="custom-select" id="search">
              <option value="">ALL</option>
              <optgroup label="Toeic">
                <option value="토익-550" <c:if test='${param.keyword == "토익-550"}'>selected</c:if>>토익-550</option>
                <option value="토익-700" <c:if test='${param.keyword == "토익-700"}'>selected</c:if>>토익-700</option>
                <option value="토익-850" <c:if test='${param.keyword == "토익-850"}'>selected</c:if>>토익-850</option>
              </optgroup>
              <optgroup label="Toeic Speaking">
                <option value="토스-5" <c:if test='${param.keyword == "토스-5"}'>selected</c:if>>토스-5</option>
                <option value="토스-6" <c:if test='${param.keyword == "토스-6"}'>selected</c:if>>토스-6</option>
                <option value="토스-7" <c:if test='${param.keyword == "토스-7"}'>selected</c:if>>토스-7</option>
              </optgroup>
            </select>
          </form>
        </div>
      </div>
    </div>
  </div>
</section>
<!--/ Intro Single End /-->

<!--/ Agents Grid Star /-->

<section class="agents-grid grid">
  <div class="container">
    <div class="row">
      <form id="mainForm" class="col-md-12">
        <div class="row">
          <c:forEach items="${profileList}" var="profile">
            <div class="col-md-4">
              <div class="card-box-d">
                <div class="card-img-d uploadResult list-unstyled">
                  <img src="/profileImages/display?fileName=${profile.uploadPath }/${profile.teacherProfileUuid}_${profile.teacherProfilePicture }" width=350px class="img-d img-fluid">
                </div>
                <div class="card-overlay card-overlay-hover">
                  <div class="card-header-d">
                    <div class="card-title-d align-self-center">
                      <h3 class="title-d">
                        <a href="${profile.teacherPno}" class="move link-two">${profile.name }</a>
                      </h3>
                    </div>
                  </div>
                  <div class="card-body-d">
                    <p class="content-d color-text-a">${profile.teacherProfile }</p>
                    <p class="content-d color-text-a">${profile.career }</p>
                    <div class="info-agents color-a">
                      <p>
                        <strong>과목 : </strong> ${profile.teacherSubject }
                      </p>
                      <p>
                        <strong>Email: </strong> ${profile.email1 }@${profile.email2 }
                      </p>
                    </div>
                  </div>
                  <div class="card-footer-d">
                    <div class="socials-footer d-flex justify-content-center">
                      <ul class="list-inline">
                        <li class="list-inline-item">
                          <a href="#" class="link-one"> <i class="fa fa-facebook" aria-hidden="true"></i>
                          </a>
                        </li>
                        <li class="list-inline-item">
                          <a href="#" class="link-one"> <i class="fa fa-twitter" aria-hidden="true"></i>
                          </a>
                        </li>
                        <li class="list-inline-item">
                          <a href="#" class="link-one"> <i class="fa fa-instagram" aria-hidden="true"></i>
                          </a>
                        </li>
                        <li class="list-inline-item">
                          <a href="#" class="link-one"> <i class="fa fa-pinterest-p" aria-hidden="true"></i>
                          </a>
                        </li>
                        <li class="list-inline-item">
                          <a href="#" class="link-one"> <i class="fa fa-dribbble" aria-hidden="true"></i>
                          </a>
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
        <div class="col-md-12">
          <form id="searchForm" action="/profile/list">
            <select name="type">
              <c:set var="type" value="${pageMaker.cri.type }" />
              <!-- 검색 조건이 없을 경우 selected 표시 -->
              <option value="A" <c:out value="${type == 'A'?'selected':'' }"/>>강사명</option>
              <!-- ${pageMaker.cri.type}이 value와 일치하면 selected 표시 -->
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
<!--/ Agents Grid End /-->

<!-- a 태그 대신 pageNum과 amount 파라미터로 전송 -->
<form id="actionForm" action="/profile/list">
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
			self.location = "/profile/register";
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

			actionForm.append("<input type='hidden' name='teacherPno' value='" + $(this).attr('href') + "'>'");
			actionForm.attr("action", "/profile/info");
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
					actionForm.attr("action", "/profile/list").submit();
					return false;
				}
				actionForm.append("<input type='hidden' name='type' value='C'>");
				actionForm.append("<input type='hidden' name='keyword' value='"+searchValue+"'>")
				actionForm.attr("action", "/profile/list").submit();
				return false;
			});

		});

	});
</script>

<script>
	$(function() {
		var formObj = $("#mainForm");

		$('.resultBtn').on("click", function(e) {
			e.preventDefault();

			var operation = $(this).data("oper");
			console.log("operation : " + operation);

			if (operation === 'remove') { //삭제 버튼이 눌린 경우 
				var deleteConfirm = confirm("정말 삭제하시겠습니까?")
				if (deleteConfirm == true) {
					alert("삭제가 완료되었습니다.")
					var teacherPnoTag = $("input[name='teacherPno']").clone();
					formObj.append(courseCodeTag);

					formObj.attr("action", "/profile/remove").attr("method", "post");
				} else {
					return;
				}

			} else if (operation === 'list') { //목록 버튼이 눌린 경우
				//				self.location = "/course/list";	
				//				return;

				//페이지 번호와 게시물 개수 복사
				var pageNumTag = $("input[name='pageNum']").clone();
				var amountTag = $("input[name='amount']").clone();

				//검색 조건과 키워드 복사
				var typeTag = $("input[name='type']").clone();
				var keywordTag = $("input[name='keyword']").clone();

				formObj.attr("action", "/profile/list").attr("method", "get");
				formObj.empty(); //폼 태그 모든 내용을 지움

				//페이지 번호와 게시물 개수만 폼에 추가
				formObj.append(pageNumTag);
				formObj.append(amountTag);

				//검색 조건과 키워드 폼에 추가 
				formObj.append(typeTag);
				formObj.append(keywordTag);

			} else {
				var teacherPnoTag = $("input[name='teacherPno']").clone();

				//페이지 번호와 게시물 개수 복사
				var pageNumTag = $("input[name='pageNum']").clone();
				var amountTag = $("input[name='amount']").clone();

				//검색 조건과 키워드 복사
				var typeTag = $("input[name='type']").clone();
				var keywordTag = $("input[name='keyword']").clone();

				formObj.attr("action", "/profile/modify").attr("method", "get");

				formObj.append(teacherPnoTag);
				//페이지 번호와 게시물 개수만 폼에 추가
				formObj.append(pageNumTag);
				formObj.append(amountTag);

				//검색 조건과 키워드 폼에 추가 
				formObj.append(typeTag);
				formObj.append(keywordTag);
			}

			formObj.submit();
		});
	});
</script>

<%@ include file="../includes/footer.jsp"%>