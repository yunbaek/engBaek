<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>     
<%@ taglib prefix="sec"   uri="http://www.springframework.org/security/tags"%>     

 <%@ include file="../includes/header.jsp" %>
<%@ include file="../about/mypage.jsp"%>



 <section class="intro-single">
 <div class="container">
      <div class="row">
      <div class="col-md-12 col-lg-8">
          <div class="title-single-box">
            <h1 class="title-single">수강 후기 등록</h1>
          </div>
</div>

            <form role="form" method="post" action="/review/register">
            <input type="hidden" name="${_csrf.parameterName }"
                                 value="${_csrf.token }">
               <div class="form-group">
                  <label>Title</label>
                  <input class="form-control" name="reviewTitle">
               </div>
         
               <!-- 강의명 -->
               <label for="CourseId"> 강의명</label>
               <select  class="form-control" name="courseCode">
               <c:forEach  items="${coursehistory}" var="coursehistory">
                  <option  value="${coursehistory.courseCode}">${coursehistory.courseName}</option>
               </c:forEach>
               
               </select>
               
               
               <!-- 강사명 -->
               <label for="teacherId">강사명</label>
               <select id="course" class="form-control" name="teacherId" >
                  <c:forEach  items="${coursehistory}" var="coursehistory">
                  <option  value="${coursehistory.teacherId}">${coursehistory.name}</option>
               </c:forEach>
               </select>
               
               <div class="form-group">
                  <label>Text area</label>
                  <textarea rows="3" class="form-control" name="reviewContent"></textarea>
               </div>         
               <div class="form-group">
                  <label>Writer</label>
                  <input class="form-control" name="studentId"
                        value='<sec:authentication 
                                 property="principal.username"/>'      
                        readonly="readonly">
                  
               </div>   
               <button type="submit" class="btn btn-default">
                  Submit</button>
               <button type="reset" class="btn btn-default">
                  Reset</button>
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

 <script>
 
 $(function(){
    
   $("#regBtn").on("click",function(){
      
      self.location="/review/register";
   });
    
 });

 </script>
 <%@ include file = "../includes/footer.jsp" %>