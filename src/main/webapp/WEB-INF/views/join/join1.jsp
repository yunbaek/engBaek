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

  <!--/ Services Star /-->
  <section class="section-services section-t8">
    <div class="container">  
      <div class="row">
      
        <div class="col-md-12">
          <div class="title-wrap d-flex justify-content-between">
            <div class="title-box">
            <br>
              <h2 class="title-a">회원가입</h2>
              </div> 
            </div> 
          </div>
        </div>
        	
	<div class="row">
        <table class="table table-borderless table-sm">
              <tr align="center">
              <td class="table-success">회원유형 선택<td>
              <td class="table-secondary">　약관동의 　<td>
              <td class="table-secondary">회원정보 입력<td>
              <td class="table-secondary">회원가입 완료<td>
              </tr>
        </table>
        <br>    
	</div>	
        
       
        <div class="row">
        <div class="col-md-6">
          <div class="card-box-c foo">
            <div class="card-header-c d-flex">
              <div class="card-box-ico">
                <img src="../img/student.png" width="150px">
              </div>
              <div class="card-title-c align-self-center">
              <br>
              </div>
            </div>
            <div class="card-body-c align-self-center">
              <h2 class="title-c">학생</h2>
            </div>
            <div class="card-footer-c">
<p class="content-c">
               radio 버튼 올 장소
              </p>
            </div>
          </div>
        </div>
        
        <div class="col-md-6">
          <div class="card-box-c foo">
            <div class="card-header-c d-flex">
              <div class="card-box-ico align-self-center">
                <img src="../img/teacher.png" width="150px">
              </div>
            </div>
            <div class="card-body-c">
              <p class="content-c">
                <h2 class="title-c">강사</h2>
              </p>
            </div>
            <div class="card-footer-c">
              radio 버튼 올 장소
            </div>
          </div>
        </div>
       </div> 	
      </div>
      
      비포버튼
      넥스트버튼

  </section>
  <!--/ Services End /-->
  
  <br>
  <jsp:include page="../includes/footer.jsp"></jsp:include>
  <a href="../#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
  <div id="preloader"></div>

  <!-- JavaScript Libraries -->
  <script src="../lib/jquery/jquery.min.js"></script>
  <script src="../lib/jquery/jquery-migrate.min.js"></script>
  <script src="../lib/popper/popper.min.js"></script>
  <script src="../lib/bootstrap/js/bootstrap.min.js"></script>
  <script src="../lib/easing/easing.min.js"></script>
  <script src="../lib/owlcarousel/owl.carousel.min.js"></script>
  <script src="../lib/scrollreveal/scrollreveal.min.js"></script>
  <!-- Contact Form JavaScript File -->
  <script src="../contactform/contactform.js"></script>

  <!-- Template Main Javascript File -->
  <script src="../js/main.js"></script>


</body>
</html>