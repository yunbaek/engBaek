<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<%--<%@ include file="../includes/header.jsp" --%>

 <%@ include file="../includes/header.jsp" %>

 <%@ include file="../about/mypage.jsp" %>

  <section class="intro-single">
 <div class="container">
      <div class="row">
      <div class="col-md-12 col-lg-8">
          <div class="title-single-box">
            <h1 class="title-single">수강후기</h1>
          </div>
        </div>
  
<div class="container">
<form action="/review/list">
<table class="table table-striped table-bordered table-hover">
   <!-- 목록 출력 -->
   <thead>
      <tr>
         <th>No.</th>
         <th>강좌명</th>
         <th>제목</th>
         <th>작성자</th>
         <th>작성일</th>
      </tr>
   </thead>
   <c:forEach items="${list}" var="review">

      <tr>
         <td>${review.reviewNo}</td>
         <td>${review.courseName}</td>
         <td>
            <a href="../review/read?reviewNo=${review.reviewNo}"> ${review.reviewTitle}</a>
         </td>
         <td>${review.studentId}</td>
         <td>
            <fmt:formatDate value="${review.reviewRegdate}" pattern="yyyy-MM-dd" />
         </td>
      </tr>
   </c:forEach>

</table>
</form> 
</div>

<!-- 새로운 후기 등록 버튼 -->
<button id="regBtn" type="button" class="btn btn-xs pull-right">등록 </button>

<br>

<!-- 검색창 - 검색 조건 및 키워드 입력 영역 -->
<div class='row'>
   <div class="col-lg-12">
      <form id="searchForm" action="/review/list">
         <select name="type">
            <c:set var="type" value="${pageMaker.cri.type }" />
            <!-- 검색 조건이 없을 경우 selected 표시 -->
            <option value="" <c:out value="${type == null?'selected':'' }"/>>검색 조건 지정</option>
            <!-- ${pageMaker.cri.type}이 value와 일치하면 selected 표시 -->
            <option value="T" <c:out value="${type == 'T'?'selected':'' }"/>>제목</option>
            <option value="C" <c:out value="${type == 'C'?'selected':'' }"/>>내용</option>
            <option value="TC" <c:out value="${type == 'TC'?'selected':'' }"/>>제목 + 내용</option>
         </select>
         <input type="text" name="keyword" value="${pageMaker.cri.keyword }"> <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }"> <input type="hidden" name="amount" value="${pageMaker.cri.amount }">
         <button class="btn btn-default">Search</button>
      </form>
   </div>

</div>



<!-- END 검색창 - 검색 조건 및 키워드 입력 영역 -->


<!-- 페이지 번호 출력 -->
<div class="pull-right">
   <ul class="pagination">
      <c:if test="${pageMaker.prev }">
         <!-- previous 버튼 표시 -->
         <li class="paginate_button page-item previous"><a class="page-link" href="${pageMaker.startPage - 1 }"> Previous</a></li>
      </c:if>

      <!-- 페이지 번호 표시 -->
      <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">
         <li class="paginate_button page-item ${pageMaker.cri.pageNum == num ? 'active': '' }"><a class="page-link" href="${num }">${num }</a></li>
      </c:forEach>

      <c:if test="${pageMaker.next }">
         <!-- next 버튼 표시 -->
         <li class="paginate_button page-item next"><a class="page-link" href="${pageMaker.endPage + 1 }">Next</a></li>
      </c:if>
   </ul>
</div>
<!-- END 페이지 번호 출력 -->

<!--  페이지 번호와 개수 넘겨주기 -->
<form id="actionForm" action="/reivew/list">
   <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }"> <input type="hidden" name="amount" value="${pageMaker.cri.amount }">
   <!-- 검색 키워드와 조건 파라미터 추가 -->
   <input type="hidden" name="keyword" value="${pageMaker.cri.keyword }"> <input type="hidden" name="type" value="${pageMaker.cri.type }">
</form>
</div>
</div>
</section>
<!-- JavaScript Libraries -->
<script src="../../../resources/lib/jquery/jquery.min.js"></script>
<script src="../../../resources/lib/jquery/jquery-migrate.min.js"></script>
<script src="../../../resources/lib/popper/popper.min.js"></script>
<script src="../../../resources/lib/bootstrap/js/bootstrap.min.js"></script>
<script src="../../../resources/lib/easing/easing.min.js"></script>
<script src="../../../resources/lib/owlcarousel/owl.carousel.min.js"></script>
<script src="../../../resources/lib/scrollreveal/scrollreveal.min.js"></script>
<!-- Contact Form JavaScript File -->
<script src="../../../resources/contactform/contactform.js"></script>
<!-- Template Main Javascript File -->
<script src="../../../resources/js/main.js"></script>



<script>
//a 태그의 move 클래스 속성을 이용

$(".move").on("click", function(e){
   //a 태그의 기본 동작 막고
   e.preventDefault();   
   
   actionForm.append("<input type='hidden' name='reviewNo' value='"+
                $(this).attr('href')+"'>'");
   actionForm.attr("action", "/review/register");
   actionForm.submit();
});
   

//등록 버튼 처리
$("#regBtn").on("click", function() {
   self.location = "/review/register";
});
   
//페이지 번호 클릭 해당 페이지 목록 표시하기 
      var actionForm = $("#searchForm");
      $(".paginate_button a").on("click", function(e) {
         e.preventDefault(); //a 태그 기본 동작 막기

         //pageNum의 값을 클릭된 a의 href 값으로 변경
         actionForm.find("input[name='pageNum']").val($(this).attr('href'));
         //폼 전송
         actionForm.submit();
      });                                            
</script>
<%@ include file = "../includes/footer.jsp" %>