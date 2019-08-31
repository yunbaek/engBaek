<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/header.jsp"%>
<%@ include file="../about/mypage.jsp"%>



<section class="intro-single">
	<div class="container">
		<div class="row">
			<div class="col-md-12 col-lg-8">
				<div class="title-single-box">
					<h1 class="title-single">수강후기 수정</h1>
				</div>
			</div>
			<form role="form" method="post" action="/review/modify">
				<!-- 페이지 번호와 페이지 당 표시 개수 파라미터 추가 -->
				<input type="hidden" name="pageNum" value="${cri.pageNum }">
				<input type="hidden" name="amount" value="${cri.amount }">
				<!-- 검색 조건과 키워드 파라미터 추가 -->
				<input type="hidden" name="type" value="${cri.type }"> <input
					type="hidden" name="keyword" value="${cri.keyword }">

				<div class="form-group">
					<label>reviewNo</label> <input class="form-control" name="reviewNo"
						readonly="readonly" value="${review.reviewNo}">
				</div>
				<div class="form-group">
					<label>Title</label> <input class="form-control" name="reviewTitle"
						value="${review.reviewTitle}">
				</div>
				<div class="form-group">
					<label>Text area</label>
					<textarea rows="3" class="form-control" name="reviewContent">${review.reviewContent }</textarea>
				</div>
				<div class="form-group">
					<label>Writer</label> <input class="form-control" name="writer"
						readonly="readonly" value="${review.studentId}">
				</div>
				<!-- 등록일자 및 수정일자 -->
				<%-- <input type="hidden" name="regdate"
                               value="<fmt:formatDate value="${board.regdate}"
                                                    pattern="yyyy-MM-dd"/>">
               <input type="hidden" name="updateDate"
                     value="<fmt:formatDate value="${board.updateDate}"
                                                    pattern="yyyy-MM-dd"/>"> --%>
				<button type="submit" data-oper="modify" class="btn btn-default">
					완료</button>
				<!-- 수정 처리 -->
				<button type="submit" data-oper="remove" class="btn btn-danger">
					삭제</button>
				<!-- 삭제 처리 -->

			</form>
			<!-- END 게시물 등록 폼 -->
		</div>
		<!-- /.panel-body -->
	</div>
	<!-- /.panel -->
	<!-- /.col-lg-6 -->
	<!-- /.row -->
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
<script>
$(document).ready(function(){
   
   var formobj = $("form");
   
   $('button').on("click",function(e){
      
      
      e.preventDefault();
      
      var operation=$(this).data('oper');
      
      console.log(operation);
      //삭제 버튼을 눌렀을 시 이동 경로 
      if(operation ==='remove'){
         formobj.attr("action","/review/remove");
      
      )
});

</script>
<%@ include file="../includes/footer.jsp"%>