<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<%--<%@ include file="../includes/header.jsp" --%>
<%@ include file="../about/sidebar.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<br>

<div>
<label>제목 : </label>           
<input name="classQnaTitle" readonly = "readonly" value="${classQna.classQnaTitle}">
</div>

<div>
<label>작성자 : </label>
<input name="studentId" readonly = "readonly" value="${classQna.studentId}">
<label>작성일 : </label>
<fmt:formatDate value="${classQna.classQnaRegdate}" pattern="yyyy-MM-dd"/>
</div>

<div>
<label>내용 : </label>
</div>
<textarea name="classQnaContent" readonly = "readonly">${classQna.classQnaContent}</textarea>

<form id="classQnaForm1" action="/classQna/read" >
<input type="hidden" id="classQnaNo" name="classQnaNo" value="${classQna.classQnaNo}">
<input type="hidden" id="courseCode" name="courseCode" value="${classQna.courseCode}">
</form>

<button type = "submit" id="updateBtn">수정</button>
<button id="deleteBtn">삭제</button>
<button id="listBtn">목록</button>

<br>
 	
<div class="chat">
	
</div>
	<div class="s"></div>
<div>
	<label>댓글</label><br><br>
	<form id = "classQnaForm1" >
		<input type="hidden" value="${classQna.studentId}"> <!-- 나중에 로그인한 계정으로 해야함 -->
		<textarea id="commentWrite" style="width:500px; height:50px" placeholder="내용을 입력해주세요"></textarea>				
	</form>
	<button id="commentRegister" style="width:50px; height:30px">등록</button>
</div>

<script type="text/javascript" src="/resources/js/comment.js"></script>

<script type="text/javascript">
 var test;
		console.log("=============");
		console.log("JS TEST");
	
		var classQnaNoValue = '<c:out value="${classQna.classQnaNo}"/>';
		var courseCodeValue = '<c:out value = "${classQna.courseCode}"/>';
		var commentUL = $(".chat");
		
		showList(1);
		
		
		//댓글 목록
		function showList(page){
			commentService.getList({classQnaNo:classQnaNoValue,page: page || 1},function(list){
				
				var str="";
			if(list == null || list.length == 0){
				commentUL.html("");
				return;
			}
			for(var i=0, len = list.length || 0; i < len; i++){		

				str+=list[i].studentId+"<br>	<span class=test"+list[i].commentNo+">" +list[i].commentContent+"  "+
				commentService.displayTime(list[i].commentRegdate)+"</span>";
				str+=
				"    	<a class=a1 onclick= commentModify("+list[i].commentNo+")> 수정 |</a> "
				+" <a class=a2 onclick=commentDelete("+list[i].commentNo+")>삭제</a><br>"
				
				}
			
			commentUL.html(str);
			});
		}
			
	
	commentService.getList({classQnaNo:classQnaNoValue, page:1}, function(list){
		for(var i = 0, len = list.length||0; i< len; i++){
			console.log(list[i]);
		}
	});
	
	//댓글 등록
	$("#commentRegister").on("click",function(e){	
		var commentWrite = $('#commentWrite').val();
		commentService.add(
			{commentContent: commentWrite, classQnaNo: classQnaNoValue, courseCode: courseCodeValue},function(result){
			//$("#classQnaForm1").attr("action","/classQna/read").submit();
			$('#commentWrite').val('');
			showList(1);
		});	
	});
	
	//삭제 
	 function commentDelete(commentNo){
		 
		 commentService.remove(commentNo, function(count){
				console.log(count);
				
				if(count == "success"){
					alert("삭제가 완료되었습니다.");
					showList(1);
				}
			}, function(err){
				alert('삭제실패');
			}); 
		 //$("#classQnaForm1").attr("action","/classQna/read").submit();
		 showList(1);	
	 }
	<%--삭제되는데 이제 디테일하게 고쳐야함--%>

	
	//수정
	function commentModify(commentNo){
		var str = "";
		var commentBefore="";
		 var space = /\s/g; /* 띄어쓰기   */
		 
		commentService.get(commentNo, function(data){
			
			commentBefore = data["commentContent"].replace(space,"&nbsp");
			
			console.log(data["commentContent"]);

			str += "<textarea id=commentWriteAfter style=width:500px;height:50px placeholder="
				+commentBefore+">"+commentBefore+"</textarea>"
			+"<button id=commentModifyBtn style=width:50px; hegith:30px>수정</button> "
			+"<button id=commentCancelBtn style=width:50px; hegith:30px>취소</button>";
			$('.a1').hide(); 
			$('.a2').hide();
			$('.test'+commentNo).html(str);	
			

			$("#commentModifyBtn").on("click", function(e){
				var commentContent = $("#commentWriteAfter").val();
				console.log(commentContent);
				commentService.update({
					commentNo : commentNo,
					classQnaNo : classQnaNoValue,
					commentContent : commentContent
				}, function(result){
					alert("수정이 완료되었습니다.");
					showList(1);
					//$("#classQnaForm1").attr("action","/classQna/read").submit();
					
				});
			});
			
			$("#commentCancelBtn").on("click", function(e){
				showList(1);
				//$("#classQnaForm1").attr("action","/classQna/read").submit();
			});
		});	
		
	}
	
	
	
</script>

<script>
$(function(){
	var classQnaNo = "${classQna.classQnaNo}"; //게시글 번호 
	var classQnaForm1 = $("#classQnaForm1");
	
	   $("#listBtn").on("click", function(e){
		  classQnaForm1.find("#classQnaNo").remove();
	      classQnaForm1.attr("action", "/classQna/list");
	      classQnaForm1.submit();
	   });
	   
	   $("#updateBtn").on("click",function(e){
		  classQnaForm1.attr("action","/classQna/modify").submit();
	   });
	   
	   $("#deleteBtn").on("click",function(){
		  classQnaForm1.attr("action","/classQna/remove");
		  classQnaForm1.attr("method","post");
		  classQnaForm1.submit();
		  alert("삭제가 완료되었습니다.");
	   });
	   
	   
	 });
</script>
<%-- %@ include file = "../includes/footer.jsp" %>--%>