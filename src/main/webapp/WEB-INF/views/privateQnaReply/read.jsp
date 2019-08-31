<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>     
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- 
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
        	Board Register
        	Board Read Page</h1>
    </div>  /.col-lg-12
</div>		/.row

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
				 게시물 등록 폼 	-->
			<form id="operForm" action="/privateQnaReply/read">
				<div>
					<label>privateQnaReplyNo</label>
						<input class="form-control" name="privateQnaReplyNo" id="privateQnaReplyNo"
						 readonly="readonly" value="${privateQnaReply.privateQnaReplyNo}"></div>
					<div>
						<label>Title</label>
						<input class="form-control" name="privateQnaReplyTitle"
							   readonly="readonly"  value="${privateQnaReply.privateQnaReplyTitle}"></div>		   	
					<div class="form-group">
						<label>Text area</label>
						<textarea rows="3" class="form-control" 
								  name="privateQnaContent" 
								  readonly="readonly">${privateQnaReply.privateQnaReplyContent}</textarea></div>			
					<div class="form-group">
						<label>Writer</label>
						<input class="form-control" name="studentId"
							   readonly="readonly"  value="${privateQnaReply.adminId}"></div>	
							   
							   </form>	
					<button  type="submit" data-oper="modify" class="btn btn-default">
						Modify</button>	<!-- 수정 페이지 이동 -->
					<button data-oper="remove" class="btn btn-danger">
						Remove</button>	<!-- 삭제 처리 -->
					<button data-oper="list" class="btn btn-info">
						List</button>	<!-- 목록 페이지 이동 -->		   
							   
							   
<!-- 				
						
						
            </div>	/.panel-body
        </div>      /.panel
    </div>   		/.col-lg-6
</div>				/.row -->


<script>
$(function(){
	 
	 var  operForm = $("#operForm");
	 
	 //수정 버튼 이벤트 처리 
	 $("button[data-oper='modify']").on("click",function(e){
		 operForm.attr("action","/privateQnaReply/modify").submit();
		 
	 });
	 //목록 버튼 이벤트 처리 
	 $("button[data-oper='list']").on("click",function(e){
		 
		 operForm.find("privateQnaReplyNo").remove();
		 operForm.attr("action","/privateQna/list");
		 operForm.submit();
	
	 });
	 //삭제 버튼 이벤트 처리 
	 $("button[data-oper='remove']").on("click",function(e){
		 var deletcheck=confirm("삭제 하시겠습니까?")
		 if(deletcheck==true){
		 alert("삭제가 완료되었습니다.");
		 operForm.attr("action","/privateQnaReply/remove").attr("method","post");
		 operForm.submit();
		 }else{
			 return;
		 }
		
	 });

	 
	 
	 
});

 </script>
 