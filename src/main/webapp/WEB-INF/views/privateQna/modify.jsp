<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<%@ include file="../includes/header.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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

<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
        	<!-- Board Register -->
        	<!-- Board Read Page -->
        	Board Modify Page</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                <!-- DataTables Advanced Tables -->
                <!-- Board Register -->
                <!-- Board Read Page -->
                Board Modify Page
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
				<!-- 게시물 수정 폼 -->	
				<form role="form" method="post" action="/privateQna/modify">
					<!-- 페이지 번호와 페이지 당 표시 개수 파라미터 추가 -->
					<input type="hidden"  
						   name="pageNum" value="${cri.pageNum }">
					<input type="hidden"  
						   name="amount" value="${cri.amount }">
					<!-- 검색 조건과 키워드 파라미터 추가 -->	   
					<input type="hidden"  
						   name="type"    value="${cri.type }">
					<input type="hidden"  
						   name="keyword" value="${cri.keyword }">
					
					<div class="form-group">
						<label>PrivateQnaNo</label>
						<input class="form-control" name="privateQnaNo"
							   readonly="readonly"  value="${privateQna.privateQnaNo}"></div>
					<div class="form-group">
						<label>Title</label>
						<input class="form-control" name="privateQnaTitle"
							   value="${privateQna.privateQnaTitle}"></div>		
					<div class="form-group">
						<label>Text area</label>
						<textarea rows="3" class="form-control" 
								  name="privateQnaContent">${privateQna.privateQnaContent}</textarea></div>			
					<div class="form-group">
						<label>Writer</label>
						<input class="form-control" name="studentId"
							   readonly="readonly"  value="${privateQna.studentId}"></div>	
					<!-- 등록일자 및 수정일자 -->		   
					<%-- <input type="hidden" name="regdate"
                   	   	   value="<fmt:formatDate value="${board.regdate}"
                   	   	   					      pattern="yyyy-MM-dd"/>">
					<input type="hidden" name="updateDate"
						   value="<fmt:formatDate value="${board.updateDate}"
                   	   	   					      pattern="yyyy-MM-dd"/>"> --%>
					<button type="submit" 
							data-oper="modify" class="btn btn-default">
						Modify</button>	<!-- 수정 처리 -->
					<button type="submit" 
							data-oper="remove" class="btn btn-danger">
						Remove</button>	<!-- 삭제 처리 -->
					<button data-oper='list' class="btn btn-info">
						List</button>	<!-- 목록 페이지 이동 -->
				</form>
				<!-- END 게시물 등록 폼 -->			
            </div>
            <!-- /.panel-body -->
        </div>
        <!-- /.panel -->
    </div>
    <!-- /.col-lg-6 -->
</div>
<!-- /.row --> 

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
$(document).ready(function(){
	
	var formobj = $("form");
	
	$('button').on("click",function(e){
		
		
		e.preventDefault();
		
		var operation=$(this).data('oper');
		
		console.log(operation);
		//삭제 버튼을 눌렀을 시 이동 경로 
		if(operation ==='remove'){
			formobj.attr("action","/privateQna/remove");
		}else if(operation==='list'){
			//목록으로 버튼을 눌렀을 시 경로 
			self.location="/privateQna/list";
			return;
		
		formobj.submit();
		
		
	);
});

</script>

<%@ include file="../includes/footer.jsp" %>
