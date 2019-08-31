<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>     
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <%@ include file="../includes/header.jsp" %>
 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta charset="utf-8">
<title>Baek 어학원</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicons -->
<link href="../../../resources/img/favicon.png" rel="icon">
<link href="../../../resources/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">

<!-- Bootstrap CSS File -->
<link href="../../../resources/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Libraries CSS Files -->
<link href="../../../resources/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link href="../../../resources/lib/animate/animate.min.css" rel="stylesheet">
<link href="../../../resources/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
<link href="../../../resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

<!-- Main Stylesheet File -->
<link href="../../../resources/css/style.css" rel="stylesheet">

<!-- 
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
           Board Register
           Board Read Page</h1>
    </div>  /.col-lg-12
</div>      /.row

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                DataTables Advanced Tables
                Board Register
                Board Read Page
            </div>
            /.panel-heading
            <div class="panel-body">
             게시물 등록 폼    -->
         <form id="operForm" action="/privateQna/read">
            <div>
               <label>privateQnaNo</label>
                  <input class="form-control" name="privateQnaNo" id="privateQnaNo"
                   readonly="readonly" value="${privateQna.privateQnaNo}"></div>
               <div>
                  <label>Title</label>
                  <input class="form-control" name="privateQnaTitle"
                        readonly="readonly"  value="${privateQna.privateQnaTitle}"></div>            
               <div class="form-group">
                  <label>Text area</label>
                  <textarea rows="3" class="form-control" 
                          name="privateQnaContent" 
                          readonly="readonly">${privateQna.privateQnaContent}</textarea></div>         
               <div class="form-group">
                  <label>Writer</label>
                  <input class="form-control" name="studentId"
                        readonly="readonly"  value="${privateQna.studentId}"></div>   
                        
                        </form>   
               <button  type="submit" data-oper="modify" class="btn btn-default">
                  Modify</button>   <!-- 수정 페이지 이동 -->
               <button data-oper="remove" class="btn btn-danger">
                  Remove</button>   <!-- 삭제 처리 -->
               <button type="submit"  data-oper="reply" class="btn btn-default">Reply</button>
               <button data-oper="list" class="btn btn-info">
                  List</button>   <!-- 목록 페이지 이동 -->         
                        
                        
<!--             
                  
                  
            </div>   /.panel-body
        </div>      /.panel
    </div>         /.col-lg-6
</div>            /.row -->

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
    
    var  operForm = $("#operForm");
    
    //수정 버튼 이벤트 처리 
    $("button[data-oper='modify']").on("click",function(e){
       operForm.attr("action","/privateQna/modify").submit();
       
    });
    //목록 버튼 이벤트 처리 
    $("button[data-oper='list']").on("click",function(e){
       
       operForm.find("privateQnaNo").remove();
       operForm.attr("action","/privateQna/list");
       operForm.submit();
   
    });
    //삭제 버튼 이벤트 처리 
    $("button[data-oper='remove']").on("click",function(e){
       var deletcheck=confirm("삭제 하시겠습니까?")
       if(deletcheck==true){
       alert("삭제가 완료되었습니다.");
       operForm.attr("action","/privateQna/remove").attr("method","post");
       operForm.submit();
       }else{
          return;
       }
      
    });
    
    //관리자일경우 답글 등록 이벤트 처리 
   $("button[data-oper='reply']").on("click",function(e){
          
          operForm.attr("action","/privateQna/replyRegister");
         
          operForm.submit();
      
       });
    
});

 </script>
 <%@ include file = "../includes/footer.jsp" %>