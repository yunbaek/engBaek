<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/header.jsp"%>
<%@ include file="../about/sidebar.jsp"%>

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<!--/ Intro Single star /-->
<section class="intro-single">
  <div class="container">
    <div class="row">
      <div class="col-md-12 col-lg-8">
        <div class="title-single-box">
          <h1 class="title-single">결제</h1>
        </div>
      </div>
      <div class="col-md-12 col-lg-4">
        <nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end">
          <ol class="breadcrumb">
            <li class="breadcrumb-item">
              <a href="/">HOME</a>
            </li>
            <li class="breadcrumb-item active" aria-current="page">
              <a href="/course/list/">강좌 소개</a>
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
            <form role="form" class="form-a" method="post" action="/payment/payRegister">
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="inputCourseName">강좌명</label>
                    <input type="text" class="form-control form-control-lg form-control-a" name="courseName" value="${courseName}" readonly="readonly" />
                    <input type="hidden" class="form-control" name="courseCode" value="${courseCode}" />
                    <input type="hidden" class="form-control" name="paymentState" value="결제완료" />
                    <input type="hidden" class="form-control" name="studentId" value="stu1" />
                    <input type="hidden" class="form-control" name="paymentMethod" value="card" />
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="priceInput">가격</label>
                    <input type="text" class="form-control form-control-lg form-control-a" name="paymentPrice" value="${paymentPrice}" readonly="readonly" />
                  </div>
                </div>
                <div class="col-md-12">
                  <button type="submit" class="btn btn-a" id="pay">결제하기</button>
                  <button type="reset" class="btn btn-a">Reset</button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </section>
    <!--/ News Single End /-->
  </div>
</section>
<!--/ Intro Single End /-->

<%-- <title>수강신청</title>
<div class="panel-body">
  <!-- 게시물 등록 폼 -->
  <form role="form" method="post" action="/payment/payRegister">
    <!--  <div class="form-group">

			<input type="hidden" class="form-control" name="paymentNo" value="1" />
			</div>  -->

    <div class="form-group">
      <label>강의명:${courseName}</label>
      <input type="hidden" class="form-control" name="courseCode" value="${courseCode}" />
    </div>
    <div class="form-group">
      <label>결제금액:${paymentPrice}</label>
      <input type="hidden" class="form-control" name="paymentPrice" value="${paymentPrice}" />
    </div>
    <div class="form-group">
      <label>결제자:</label>
      <input type="hidden" class="form-control" name="studentId" value="stu1" />
    </div>
    <div class="form-group">
      <input type="hidden" class="form-control" name="paymentMethod" value="card" />
    </div>

    <div class="form-group">
      <input type="hidden" class="form-control" name="paymentState" value="결제완료" />
    </div>
    <button type="submit" class="btn btn-default" id="pay">결제하기</button>

  </form>
  <!-- END 게시물 등록 폼 -->
</div>
<!-- /.panel-body --> --%>
 
<script>
	var IMP = window.IMP; // 생략가능
	IMP.init('imp98130930'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

	var formObj = $("form");

	$("button").on("click", function(e) {

		e.preventDefault();
		IMP.request_pay({
			pg : 'inicis', // version 1.1.0부터 지원.
			pay_method : 'card',
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : '주문명:${courseName}',
			amount : '${paymentPrice}',
			buyer_email : 'iamport@siot.do',
			buyer_name : 'stu1',
			buyer_tel : '010-1234-5678',
			buyer_addr : '서울특별시 강남구 삼성동',
			buyer_postcode : '123-456',
			m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		}, function(rsp) {
			if (rsp.success) {

				var msg = '결제가 완료되었습니다.';
				msg += '고유ID : ' + rsp.imp_uid;
				msg += '상점 거래ID : ' + rsp.merchant_uid;
				msg += '결제 금액 : ' + rsp.paid_amount;
				msg += '카드 승인번호 : ' + rsp.apply_num;

				formObj.attr("action", "/payment/payRegister").attr("method", "post");

				formObj.submit();
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
			}
			alert(msg);
		});
	});
</script>