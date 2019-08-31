<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<%--<%@ include file="../includes/header.jsp" --%>
<%@ include file="../about/sidebar.jsp"%>
<%@ include file="../includes/header.jsp"%>

<!--/ News Single Star /-->
<section class="news-single nav-arrow-b">
  <div class="container">
    <div class="row">
      <div class="col-md-10 offset-md-1 col-lg-10 offset-lg-1">
        <div class="col-md-12 col-lg-8">
          <div class="title-single-box">
            <h1 class="title-single">결제내역</h1>
            <span class="color-text-a">Payment</span>
          </div>
        </div>
        <div class="col-md-12 col-lg-4"></div>
        <div class="title-single-box">
          <h1 class="title-single">결제내역</h1>
          <span class="color-text-a">Payment</span>
        </div>
        <h2>결제 취소 가능한 강좌</h2>
        <form action="/payment/list" id="operForm">
          <table class="table table-striped table-bordered table-hover">
            <!-- 목록 출력 -->


            <thead>
              <tr>
                <th>No.</th>
                <th>강좌명</th>
                <th>결제수단</th>
                <th>결제일</th>
                <th>금액</th>
                <th>결제 상태</th>
              </tr>
            </thead>
            <c:forEach items="${list}" var="payment">

              <tr>
                <td>${payment.paymentNo}</td>
                <td>${payment.courseName}</td>
                <td>${payment.paymentMethod}</td>
                <td><fmt:formatDate value="${payment.paymentDate}" pattern="yyyy-MM-dd" /></td>
                <td>${payment.price}</td>
                <td><c:if test="${payment.paymentState !='결제취소완료'}">
                    <a class="move" id="cancel" href="${payment.paymentNo}">${payment.paymentState} </a>
                  </c:if> <c:if test="${payment.paymentState eq '결제취소완료'}"> 
			 ${payment.paymentState}
			</c:if></td>
              </tr>
            </c:forEach>
          </table>
          <input type="hidden" name="paymentState" value="결제취소완료">
        </form>

        <h2>수강 완료(결제 취소 불가능) 결재내역</h2>
        <form action="/payment/list">
          <table class="table table-striped table-bordered table-hover">
            <!-- 목록 출력 -->
            <thead>
              <tr>
                <th>No.</th>
                <th>강좌명</th>
                <th>결제수단</th>
                <th>결제일</th>
                <th>금액</th>
                <th>결제 상태</th>
              </tr>
            </thead>
            <c:forEach items="${list2}" var="paymentRefundNo">
              <tr>
                <td>${paymentRefundNo.paymentNo}</td>
                <td>${paymentRefundNo.courseName}</td>
                <td>${paymentRefundNo.paymentMethod}</td>
                <td><fmt:formatDate value="${paymentRefundNo.paymentDate}" pattern="yyyy-MM-dd" /></td>
                <td>${paymentRefundNo.price}</td>
                <td>취소 불가능</td>
              </tr>
            </c:forEach>
          </table>
        </form>

      </div>
    </div>
  </div>
</section>
<!--/ News Single End /-->





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
	var operForm = $("#operForm");

	$(".move").on("click", function(e) {
		//a 태그의 기본 동작 막고
		e.preventDefault();
		var deletcheck = confirm("결제를 취소 하시겠습니까?")
		if (deletcheck == true) {
			alert("결제 취소가 완료되었습니다.");

			operForm.append("<input type='hidden' name='paymentNo' value='" + $(this).attr('href') + "'>'");
			operForm.attr("action", "/payment/modify").attr("method", "post");
			e.preventDefault();
			operForm.submit();
		} else {
			return;
		}
	});
</script>
<%-- %@ include file = "../includes/footer.jsp" %>--%>



<%@ include file="../includes/footer.jsp"%>