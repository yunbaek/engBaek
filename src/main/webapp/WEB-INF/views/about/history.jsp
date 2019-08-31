<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <jsp:include page="../includes/header.jsp"></jsp:include> 

<!--/ Intro Single star /-->
  <section class="intro-single">
  <jsp:include page="sidebar.jsp"></jsp:include>
    <div class="container">
      <div class="row">
        <div class="col-md-12 col-lg-8">
          <div class="title-single-box">
            <h1 class="title-single">학원연혁</h1>
          </div>
        </div>
        <div class="col-md-12 col-lg-4">
          <nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end">
            <ol class="breadcrumb">
              <li class="breadcrumb-item">
                <a href="#">학원안내</a>
              </li>
              <li class="breadcrumb-item active" aria-current="page">
                                학원연혁
              </li>
            </ol>
          </nav>
        </div>
      </div>
    </div>
  </section>
  <!--/ Intro Single End /-->

<!-- BAEK history -->
  <div class="container">
  <table class="table">
  <thead>
    <tr>
      <th width="30%" scope="col">년도</th>
      <th scope="col">사항</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">2019</th>
      <td>
      	<ul class="list-unstyled">
      	<li>맛있는 동영상강좌 개발완료</li>
      	<li>영어도사를 만드는 토익 리얼테스트 1,2,3권 출판</li>
      	<li>영어도사를 만드는 토익 Listening 출판 (빨강도토리)</li>
      	</ul>
      </td>
    </tr>
    <tr>
      <th scope="row">2018</th>
      <td>
      	<ul class="list-unstyled">
      	<li>한국능률협회컨설팅 2018년 ‘한국산업의 브랜드파워(K-BPI)’ 온라인 외국어학원 부문 1위(11년 연속)</li>
      	<li>온라인 영어독서 프로그램 'BAEK리더스' 론칭</li>
      	<li>육군과 군인장병, 군인가족 교육지원 업무 협약 체결</li>
      	</ul>
      </td>
    </tr>
    <tr>
      <th scope="row">2017</th>
      <td>
      	<ul class="list-unstyled">
      	<li>‘2017 대한민국 지식서비스 대상’ 산업통상자원부 장관상 수상</li>
      	<li>한국능률협회컨설팅 2017년 ‘한국산업의 브랜드파워(K-BPI)’ 온라인 외국어학원 부문 1위(10년 연속)</li>
      	</ul>
      </td>
    </tr>
    <tr>
      <th scope="row">2016</th>
      <td>
      	<ul class="list-unstyled">
      	<li>성남시 청소년재단과 성남시 청소년들의 진로직업 체험을 지원하기 위한 협약 체결</li>
      	<li>사단법인 '점프' 사회공헌활동 관련 후원 협약 체결</li>
      	<li>기초영어 사업 강화 위해 ㈜무나투나 인수</li>
      	</ul>
      </td>
    </tr>
    <tr>
      <th scope="row">2015</th>
      <td>
      	<ul class="list-unstyled">
      	<li>인하공업전문대학교 ANY TOEIC 시스템 개발 납품</li></ul>
      </td>
    </tr>
  </tbody>
</table>
</div>
<!-- END BAEK history -->

<jsp:include page="../includes/footer.jsp"></jsp:include>
</body>
</html>