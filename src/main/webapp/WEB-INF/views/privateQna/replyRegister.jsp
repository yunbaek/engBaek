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
            <h1 class="title-single">1:1문의 답변  등록</h1>
          </div>
</div>
            <form role="form" id="operForm" Method="post" action="/privateQna/replyRegister">
            
            
            <input type="hidden" name="${_csrf.parameterName }"
                                 value="${_csrf.token }">
                  <div class="form-group">
                  <input type="hidden" class="form-control" name="privateQnaNo" value="${privateQna.privateQnaNo}">
                  </div>
                  
               <div class="form-group">
                   
                  <label>Title</label>
                  <input class="form-control" name="privateQnaReplyTitle">
               </div>
               <div class="form-group">
                  <label>Text area</label>
                  <textarea rows="3" class="form-control" name="privateQnaReplyContent"></textarea>
               </div>         
               <div class="form-group">
                  <label>Writer</label>
                  <input class="form-control" name="adminId"
                        value='<sec:authentication 
                                 property="principal.username"/>'      
                        readonly="readonly">
               </div>   
               <button  type="submit" data-oper="register" class="btn btn-default">
               등록   </button>
               <button type="reset" class="btn btn-default">
                  Reset</button>
            </form>
            <!-- END 게시물 등록 폼 -->         
            </div>
            <!-- /.panel-body -->
        </div>
        <!-- /.panel -->
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
 
 $(function(){
      var formObj = $("form");
      
      $('button').on("click", function(e){
         e.preventDefault();
         
         var operation = $(this).data("oper");
         console.log("operation : " + operation);
         
         if(operation === 'cancel'){       
            formObj.attr("action", "/faq/read");
         } else if(operation === 'register') {   
            

            var privateQnaNo = $("input[name='privateQnaNo']").clone();
            //페이지 번호와 게시물 개수 복사
            var pageNumTag = $("input[name='pageNum']").clone();
            var amountTag = $("input[name='amount']").clone();
            
            //검색 조건과 키워드 복사
            var typeTag = $("input[name='type']").clone();
            var keywordTag = $("input[name='keyword']").clone();

            formObj.attr("action", "/privateQna/replyRegister")
                  .attr("method", "post");
            formObj.append(privateQnaNo);
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
  <%@ include file = "../includes/footer.jsp" %>