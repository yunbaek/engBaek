<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%-- <jsp:include page="../includes/header.jsp"></jsp:include> --%>
  <%@ include file="../includes/header.jsp" %>
  <%@ include file="../about/sidebar.jsp" %>

<!--/ Intro Single star /-->
  <section class="intro-single">
  	
    <div class="container">
      <div class="row">
        <div class="col-md-12 col-lg-8">
          <div class="title-single-box">
            <h1 class="title-single">오시는 길</h1>
          </div>

        </div>
        <div class="col-md-12 col-lg-4">
          <nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end">
            <ol class="breadcrumb">
              <li class="breadcrumb-item">
                <a href="index.html">학원안내</a>
              </li>
              <li class="breadcrumb-item active" aria-current="page">
                                오시는 길
              </li>
            </ol>
          </nav>
        </div>
      </div>
      </div>
  </section>
  <!--/ Intro Single End /-->

  <!--/ Contact Star /-->
  <section class="contact">
    <div class="container">
      <div class="row">
        <div class="col-sm-12">
          <div class="contact-map box">
            <div id="map" class="contact-map">
              <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1581.4590017787498!2d126.91859882028261!3d37.55699559614132!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357c993410ca2f63%3A0x5bc4dfe507bd6544!2z7IyN7Jqp6rCV67aB6rWQ7Jyh7IS87YSw!5e0!3m2!1sko!2skr!4v1564541726225!5m2!1sko!2skr"
              width="100%" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
            </div>
          </div>
        </div>
        <div class="col-sm-12">
          <div class="row">
            <div class="col-md-5 section-md-t3">
            <!-- 주소 -->
              <div class="icon-box section-b2">
                <div class="icon-box-icon">
                  <span class="ion-ios-pin"></span>
                </div>
                <div class="icon-box-content table-cell">
                  <div class="icon-box-title">
                    <h4 class="icon-title">주소</h4>
                  </div>
                  <div class="icon-box-content">
                    <p class="mb-1">
                                            서울특별시 마포구 서교동 447-5 풍성빌딩 2층
                      <br>02-336-8546
                    </p>
                  </div>
                </div>                
              </div>
              <!-- 주소 -->              
              <div class="icon-box section-b2">
                <div class="icon-box-icon">
                  <span class="ion-ios-paper-plane"></span>
                </div>
                <div class="icon-box-content table-cell">
                  <div class="icon-box-title">
                    <h4 class="icon-title">지하철 이용시</h4>
                  </div>
                  <div class="icon-box-content">
                    <p class="mb-1">2호선 홍대입구역. 
                      <span class="color-a">1번 출구 도보 5분 거리</span>
                    </p>
                    <p class="mb-1">경의중앙선 홍대입구역. 
                      <span class="color-a">3번 출구 도보 9분 </span>
                    </p>
                  </div>
                </div>
              </div>
              
              <div class="icon-box">
                <div class="icon-box-icon">
                  <span class="ion-ios-paper-plane"></span>
                </div>
                <div class="icon-box-content table-cell">
                  <div class="icon-box-title">
                    <h4 class="icon-title">버스 이용시</h4>
                  </div>
                  <div class="icon-box-content">
                    <p class="mb-1">동교로 사거리 하차. 
                      <span class="color-a">7016, 7711, 7734, 7737, 7739, 마포06, 마포09</span>
                    </p>
                  </div>
                </div>
              </div>
              
            </div>
          </div>
        </div>
      </div>
    </div>
    <br>
  </section>
  <!--/ Contact End /-->

  <%@ include file="../includes/footer.jsp" %>
